import 'exercise_model.dart';

class ExerciseCategory {
  final String id;
  final String name;
  final String lottiePath;
  final List<Exercise> exercises;

  ExerciseCategory({
    required this.id,
    required this.name,
    required this.lottiePath,
    required this.exercises,
  });
}