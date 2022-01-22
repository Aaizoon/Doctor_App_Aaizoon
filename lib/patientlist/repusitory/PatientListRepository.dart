import 'package:aazioondoctorapp/help/api_base_helper.dart';
import 'package:aazioondoctorapp/patientlist/model/PatientListModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PatientListRepository {
  ApiBaseHelper _helper = ApiBaseHelper();

  Future<PatientListModel> patient() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int doctorid = prefs.getInt("user_id");
    String token = "Bearer ";
    token += prefs.getString("token");
    Map body = {
      "doctor_id": doctorid.toString(),
    };
    final response = await _helper.postWithHeader("api/doctor/upcoming/appointment/list", body, token);
    return PatientListModel.fromJson(response);
  }
}
