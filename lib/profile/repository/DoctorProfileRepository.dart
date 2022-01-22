import 'package:aazioondoctorapp/help/api_base_helper.dart';
import 'package:aazioondoctorapp/profile/model/DoctorProfileModel.dart';

class DoctorProfileReposutory {
  ApiBaseHelper _helper = ApiBaseHelper();

  Future<DoctorProfileModel> addDoctor(Map body, String token) async {
    final response = await _helper.postWithHeader("api/doctor/doctor-profile-update", body, token);
    return DoctorProfileModel.fromJson(response);
  }
}
