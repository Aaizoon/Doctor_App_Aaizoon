import 'package:aazioondoctorapp/help/api_base_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'NotificationResponseModel.dart';

class NotificationRepository {
  ApiBaseHelper _helper = ApiBaseHelper();

  Future<NotificationResponseModel> notification() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int doctorId = prefs.getInt("user_id");
    String token = "Bearer ";
    token += prefs.getString("token");
    Map body = {
      "user_id": doctorId.toString(),
    };
    final response = await _helper.postWithHeader("api/users/notification-list", body, token);
    return NotificationResponseModel.fromJson(response);
  }
}
