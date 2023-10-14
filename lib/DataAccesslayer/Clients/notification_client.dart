import 'package:captin_app/Constants/api_links.dart';
import 'package:http/http.dart' as http;

class NotificationClient {
  Future<dynamic> getNotifications() async {
    var response = await http.get(Uri.parse("$baseUrl$notificationsLink"));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }
}
