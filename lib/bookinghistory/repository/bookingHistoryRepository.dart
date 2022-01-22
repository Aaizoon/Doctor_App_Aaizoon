import 'package:aazioondoctorapp/bookinghistory/model/bookingHistoryResponseModel.dart';
import 'package:aazioondoctorapp/help/api_base_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';


class BookingHistoryRepository {
  ApiBaseHelper _helper = ApiBaseHelper();

  Future<BookingHistoryResponseModel> history() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int doctorId = prefs.getInt("user_id");
    String token = prefs.getString("token");
    Map body = {
      "doctor_id": doctorId.toString(),
    };

    final response = await _helper.postWithHeader("api/doctor/past/appointment/list", body, "Bearer " + token);
    return BookingHistoryResponseModel.fromJson(response);
  }

}
