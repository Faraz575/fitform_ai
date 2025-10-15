
import 'dart:async';

import 'package:fitform_ai/app/data/local/models/exercise_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

enum WorkoutState { initial, countdown, active, paused, finished }

class DetailController extends GetxController {
  Exercise? exercise;
  final FlutterTts flutterTts = FlutterTts();
  Timer? _timer;

  var workoutState = WorkoutState.initial.obs;
  var countdown = 3.obs;
  var currentDuration = 0.obs;

  @override
  void onInit() {
    super.onInit();
    _initializeData();
    _initializeTts();
  }

  void _initializeData() {
    if (Get.arguments != null && Get.arguments is Exercise) {
      exercise = Get.arguments as Exercise;
      currentDuration.value = exercise!.durationInSeconds;
    } else {
      Future.delayed(Duration.zero, () {
        Get.back();
        Get.snackbar("Error", "Could not load exercise data.", backgroundColor: Colors.red, colorText: Colors.white);
      });
    }
  }

  void _initializeTts() {
    flutterTts.setLanguage("en-US");
    flutterTts.setSpeechRate(0.5);
    flutterTts.setPitch(1.0);
  }

  void speak(String text) async {
    await flutterTts.stop(); // Pehle wali speech ko roko (agar chal rahi hai)
    await flutterTts.speak(text);
  }

  void startCountdown() {
    workoutState.value = WorkoutState.countdown;
    speak("Workout starting in 3, 2, 1");

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown.value > 1) {
        countdown.value--;
      } else {
        timer.cancel();
        startWorkout();
      }
    });
  }

  void startWorkout() {
    workoutState.value = WorkoutState.active;
    if (countdown.value == 1) speak("Start"); // Sirf pehli baar "Start" bolo

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (currentDuration.value > 0) {
        currentDuration.value--;
        if (currentDuration.value <= 3 && currentDuration.value > 0) {
          speak(currentDuration.value.toString());
        }
      } else {
        timer.cancel();
        workoutState.value = WorkoutState.finished;
        speak("Workout complete. Great job!");
      }
    });
  }

  void pauseWorkout() {
    if (workoutState.value == WorkoutState.active) {
      _timer?.cancel();
      flutterTts.stop();
      workoutState.value = WorkoutState.paused;
      speak("Workout paused");
    }
  }

  void resumeWorkout() {
    if (workoutState.value == WorkoutState.paused) {
      speak("Resuming");
      startWorkout();
    }
  }

  void resetWorkout() {
    _timer?.cancel();
    flutterTts.stop();
    countdown.value = 3;
    if (exercise != null) {
      currentDuration.value = exercise!.durationInSeconds;
    }
    workoutState.value = WorkoutState.initial;
  }

  @override
  void onClose() {
    _timer?.cancel();
    flutterTts.stop();
    super.onClose();
  }
}