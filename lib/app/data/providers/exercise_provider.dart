import '../local/exercises/abs_exercises.dart';
import '../local/exercises/back_exercises.dart';
import '../local/exercises/biceps_exercises.dart';
import '../local/exercises/chest_exercises.dart';
import '../local/exercises/legs_exercises.dart';
import '../local/exercises/shoulders_exercises.dart';
import '../local/exercises/triceps_exercises.dart';
import '../local/models/category_model.dart';

class ExerciseProvider {
  List<ExerciseCategory> getExerciseCategories() {
    return [
      getChestCategory(),
      getBackCategory(),
      getLegsCategory(),
      getShouldersCategory(),
      getBicepsCategory(),
      getTricepsCategory(),
      getAbsCategory(),
    ];
  }
}