import 'package:aazioondoctorapp/help/api_base_helper.dart';
import 'package:aazioondoctorapp/onlinePatientBookings/model/availabilityModel.dart';
import 'package:aazioondoctorapp/onlinePatientBookings/model/onlinePatientBookingModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnlinePatientBookingRepository {
  ApiBaseHelper _helper = ApiBaseHelper();

  Future<OnlinePatientBookingModel> getOnlinePatient() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int doctorid = prefs.getInt("user_id");
    String token = prefs.getString("token");
    Map body = {
      "userid": doctorid.toString(),
    };
    final response = await _helper.postWithHeader("api/doctor/active/booking", body, "Bearer " + token);
    return OnlinePatientBookingModel.fromJson(response);
  }

  Future<AvailabilityModel> availability(body, token) async {
    final response = await _helper.postWithHeader("api/doctor/online/availability/update", body, "Bearer " + token);
    return AvailabilityModel.fromJson(response);
  }
}
