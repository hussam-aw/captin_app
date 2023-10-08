import 'package:http/http.dart' as http;
import '../../Constants/api_links.dart';

class MealClient {
  Future<dynamic> getMeals() async {
    var response = await http.get(Uri.parse('$baseUrl$mealsLink'));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }
}
