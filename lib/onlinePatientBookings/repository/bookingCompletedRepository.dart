import 'package:aazioondoctorapp/help/api_base_helper.dart';
import 'package:aazioondoctorapp/onlinePatientBookings/model/AddMedicineListModel.dart';
import 'package:aazioondoctorapp/onlinePatientBookings/model/DeleteMedicineModel.dart';
import 'package:aazioondoctorapp/onlinePatientBookings/model/GetMedicineModel.dart';
import 'package:aazioondoctorapp/onlinePatientBookings/model/updateFindingsModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Constant.dart';
import '../model/bookingCompletedModel.dart';

class BookingCompletedRepository {
  ApiBaseHelper _helper = ApiBaseHelper();

  Future<UpdateFindingsModel> updateFindings(body) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String token = prefs.getString("token");

    final response = await _helper.postWithHeader("api/doctor/add/finding", body, "Bearer " + token);
    return UpdateFindingsModel.fromJson(response);
  }
  Future<GetMedicineModel> getMedicine1(body) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String token = prefs.getString("token");

    final response = await _helper.postWithHeader("api/get/medicine", body, "Bearer " + token);
    return GetMedicineModel.fromJson(response);
  }
  Future<GetMedicineModel> getMedicineByComposition(body) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String token = prefs.getString("token");

    final response = await _helper.postWithHeader("api/get/medicine/by/composition", body, "Bearer " + token);
    return GetMedicineModel.fromJson(response);
  }
  Future<BookingCompletedModel> appointmentCompleted(body,token) async {

    final response = await _helper.postWithHeader("api/update/doctor/booking/status", body, "Bearer " + token);
    return BookingCompletedModel.fromJson(response);
  }
  Future<AddMedicineListModel> medList(body) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String token = prefs.getString("token");

    final response = await _helper.postWithHeader("api/create/prescription", body, "Bearer " + token);
    return AddMedicineListModel.fromJson(response);
  }
  Future<DeleteMedicineModel> deleteMed(body) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String token = prefs.getString("token");

    final response = await _helper.postWithHeader("api/delete/prescription", body, "Bearer " + token);
    return DeleteMedicineModel.fromJson(response);
  }
}
