import 'package:fitform_ai/app/data/local/models/category_model.dart';
import 'package:fitform_ai/app/data/providers/exercise_provider.dart';
import 'package:get/get.dart';

class LibraryController extends GetxController {
  final exerciseProvider = ExerciseProvider();

  var categoryList = <ExerciseCategory>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  void fetchCategories() {
    categoryList.assignAll(exerciseProvider.getExerciseCategories());
  }
}