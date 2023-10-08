import 'package:captin_app/DataAccesslayer/Models/meal.dart';
import 'package:captin_app/DataAccesslayer/Repositories/meal_repo.dart';
import 'package:get/get.dart';

class MealsController extends GetxController {
  MealRepo mealRepo = MealRepo();
  List<Meal> meals = [];

  Future<void> getMeals() async {
    meals = await mealRepo.getMeals();
  }

  Meal? getMealFromId(mealId) {
    var meal = meals.firstWhereOrNull((meal) => meal.id == mealId);
    if (meal != null) {
      return meal;
    }
    return null;
  }
}
