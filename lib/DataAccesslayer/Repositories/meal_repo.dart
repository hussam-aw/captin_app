import 'dart:convert';
import 'package:captin_app/DataAccesslayer/Clients/meal_client.dart';
import '../Models/meal.dart';

class MealRepo {
  MealClient client = MealClient();

  Future<List<Meal>> getMeals() async {
    var response = await client.getMeals();
    if (response != "") {
      final parsed = json.decode(response).cast<Map<String, dynamic>>();
      return parsed.map<Meal>((json) => Meal.fromMap(json)).toList();
    }
    return [];
  }
}
