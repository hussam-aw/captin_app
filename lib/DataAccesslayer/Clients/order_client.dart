import 'package:captin_app/Constants/api_links.dart';
import 'package:captin_app/main.dart';
import 'package:http/http.dart' as http;

class OrderClient {
  Future<dynamic> getOrders() async {
    var response =
        await http.get(Uri.parse('$baseUrl$ordersLink/${MyApp.appUser!.id}'));
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }
}
