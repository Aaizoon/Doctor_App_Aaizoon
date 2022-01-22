import 'package:aazioondoctorapp/help/api_base_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/getLeaveListModel.dart';
import 'model/leaveDeleteModel.dart';
import 'model/leaveResponseModel.dart';

class LeaveRepository {
  ApiBaseHelper _helper = ApiBaseHelper();

  Future<LeaveResponseModel> leave(body) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String token = prefs.getString("token");

    final response = await _helper.postWithHeader("api/doctor/add/leave", body, "Bearer " + token);
    return LeaveResponseModel.fromJson(response);
  }

  Future<LeaveDeleteModel> leaveDelete(body) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String token = prefs.getString("token");

    final response = await _helper.postWithHeader("api/doctor/delete/leave", body, "Bearer " + token);
    return LeaveDeleteModel.fromJson(response);
  }

  Future<GetLeaveListModel> leaveList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int doctorId = prefs.getInt("user_id");
    String token = prefs.getString("token");
    Map body = {"doctor_id": doctorId.toString()};

    final response = await _helper.postWithHeader("api/doctor/all/leave", body, "Bearer " + token);
    return GetLeaveListModel.fromJson(response);
  }
}
