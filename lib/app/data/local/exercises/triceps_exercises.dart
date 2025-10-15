import 'package:fitform_ai/app/data/local/models/category_model.dart';
import 'package:fitform_ai/app/data/local/models/exercise_model.dart';

ExerciseCategory getTricepsCategory() {
  return ExerciseCategory(
    id: 'cat_triceps',
    name: 'Triceps',
    lottiePath: 'assets/lottie/man-doing-dips.json',
    exercises: [
      Exercise(
        id: 'ex_close_grip_bench',
        title: 'Close-Grip Bench Press',
        gifPath: 'assets/gifs/close_grip_bench.gif',
        durationInSeconds: 60,
        instructions: [
          'Lie on a flat bench, gripping a barbell with hands closer than shoulder-width.',
          'Lower the bar to your chest, keeping elbows close to your body.',
          'Press the bar back up until arms are fully extended.',
          'Keep your elbows tucked throughout.'
        ],
      ),
      Exercise(
        id: 'ex_tricep_dips',
        title: 'Tricep Dips',
        gifPath: 'assets/gifs/tricep_dips.gif',
        durationInSeconds: 45,
        instructions: [
          'Use parallel bars, keeping your torso upright.',
          'Lower your body until your upper arms are parallel to the ground.',
          'Push back up to the starting position.',
          'Avoid leaning forward to focus on triceps.'
        ],
      ),
      Exercise(
        id: 'ex_overhead_tricep_extension',
        title: 'Overhead Tricep Extension',
        gifPath: 'assets/gifs/overhead_tricep_extension.gif',
        durationInSeconds: 60,
        instructions: [
          'Stand or sit, holding a dumbbell overhead with both hands.',
          'Lower the dumbbell behind your head, bending your elbows.',
          'Extend your arms to lift the dumbbell back up.',
          'Keep your elbows pointing forward.'
        ],
      ),
      Exercise(
        id: 'ex_tricep_pushdown',
        title: 'Tricep Pushdown',
        gifPath: 'assets/gifs/tricep_pushdown.gif',
        durationInSeconds: 60,
        instructions: [
          'Stand at a cable machine with a high pulley and bar attachment.',
          'Push the bar down until your arms are fully extended.',
          'Keep your elbows close to your body.',
          'Slowly let the bar rise back up.'
        ],
      ),
      Exercise(
        id: 'ex_skull_crushers',
        title: 'Skull Crushers',
        gifPath: 'assets/gifs/skull_crushers.gif',
        durationInSeconds: 60,
        instructions: [
          'Lie on a flat bench, holding an EZ bar above your chest.',
          'Lower the bar towards your forehead by bending your elbows.',
          'Extend your arms back to the starting position.',
          'Keep your upper arms stationary.'
        ],
      ),
      Exercise(
        id: 'ex_dumbbell_kickback',
        title: 'Dumbbell Kickback',
        gifPath: 'assets/gifs/dumbbell_kickback.gif',
        durationInSeconds: 60,
        instructions: [
          'Bend forward at the hips, holding a dumbbell in each hand.',
          'Keep your upper arms parallel to the ground.',
          'Extend your forearms back until your arms are straight.',
          'Lower the dumbbells back with control.'
        ],
      ),
      Exercise(
        id: 'ex_bench_dips',
        title: 'Bench Dips',
        gifPath: 'assets/gifs/bench_dips.gif',
        durationInSeconds: 45,
        instructions: [
          'Sit on a bench with hands next to your hips, legs extended.',
          'Lift your body off the bench and lower it down.',
          'Bend your elbows to lower your body, then push back up.',
          'Keep your shoulders relaxed.'
        ],
      ),
      Exercise(
        id: 'ex_cable_overhead_extension',
        title: 'Cable Overhead Extension',
        gifPath: 'assets/gifs/cable_overhead_extension.gif',
        durationInSeconds: 60,
        instructions: [
          'Stand facing away from a cable machine with a low pulley.',
          'Hold a rope attachment overhead with both hands.',
          'Extend your arms forward, keeping your upper arms stationary.',
          'Slowly let the rope return to the starting position.'
        ],
      ),
      Exercise(
        id: 'ex_diamond_pushups',
        title: 'Diamond Push-ups',
        gifPath: 'assets/gifs/diamond_pushups.gif',
        durationInSeconds: 45,
        instructions: [
          'Place your hands close together, forming a diamond shape.',
          'Keep your body in a straight line.',
          'Lower your chest toward your hands.',
          'Push back up to the starting position.'
        ],
      ),
      Exercise(
        id: 'ex_single_arm_extension',
        title: 'Single-Arm Dumbbell Extension',
        gifPath: 'assets/gifs/single_arm_extension.gif',
        durationInSeconds: 60,
        instructions: [
          'Sit or stand, holding a dumbbell in one hand overhead.',
          'Lower the dumbbell behind your head by bending your elbow.',
          'Extend your arm back to the starting position.',
          'Repeat on the other side.'
        ],
      ),
    ],
  );
}