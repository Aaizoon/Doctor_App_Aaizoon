
import 'package:aazioondoctorapp/Lab/model/GivenLabTesTModel.dart';
import 'package:aazioondoctorapp/Lab/model/LabModel.dart';
import 'package:aazioondoctorapp/Lab/model/LabTestListModel.dart';
import 'package:aazioondoctorapp/help/api_base_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LabListRepository {


  ApiBaseHelper _helper = ApiBaseHelper();

  Future<GetLabListModel> getLabList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");

    final response = await _helper.getWithHeader("api/lab/get-lab-list", "Bearer " + token);
    return GetLabListModel.fromJson(response);
  }

  Future<LabTestListModel> getLabTestList(labId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");

    Map body = {"lab_id": labId.toString()};

    final response = await _helper.postWithHeader("api/lab/get-lab-test-list", body, "Bearer " + token);
    return LabTestListModel.fromJson(response);
  }
  Future<GivenLabTesTModel> givenLabTestList(body) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    final response = await _helper.postWithHeader("api/doctor/lab/booking", body, "Bearer " + token);
    return GivenLabTesTModel.fromJson(response);
  }
}
