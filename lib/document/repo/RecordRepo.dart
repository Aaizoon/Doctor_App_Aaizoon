import 'package:aazioondoctorapp/document/model/AllAppointmentForPatient.dart';
import 'package:aazioondoctorapp/help/api_base_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../BookingModel.dart';

class RecordRepo {
  ApiBaseHelper _helper = ApiBaseHelper();
  Future<AllAppointmentForPatient> recordRepo() async {
    final prefs = await SharedPreferences.getInstance();

    int userId = prefs.getInt("user_id");
    Map body = {
      "doctor_id": userId.toString(),
    };

    String token = prefs.getString("token");

    final response = await _helper.postWithHeader("api/doctor/all-appointment-list", body, "Bearer " + token);
    return AllAppointmentForPatient.fromJson(response);
  }

  Future<BookingModel> appointment_uploaded_file_patient(String appointment_id) async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    int userId = prefs.getInt('user_id');
    Map body = {"doctor_id": userId.toString(), "appt_id": appointment_id};
    final response = await _helper.postWithHeader("api/doctor/appointment-uploaded-file-doctor", body, "Bearer " + token);
    return BookingModel.fromJson(response);
  }
}
