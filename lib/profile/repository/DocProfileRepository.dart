import 'package:aazioondoctorapp/help/api_base_helper.dart';
import 'package:aazioondoctorapp/profile/model/DocProfileModel.dart';

class DocProfileReposutory {
  ApiBaseHelper _helper = ApiBaseHelper();

  Future<DocProfileModel> getDoctorProfile(Map body, String token) async {
    final response = await _helper.postWithHeader("api/doctor/get-doctor-profile", body, token);
    return DocProfileModel.fromJson(response);
  }
}
