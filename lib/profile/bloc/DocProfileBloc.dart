import 'dart:async';

import 'package:aazioondoctorapp/help/api_response.dart';
import 'package:aazioondoctorapp/login/LogInRepository.dart';
import 'package:aazioondoctorapp/login/model/RegisterResponseModel.dart';
import 'package:aazioondoctorapp/patientlist/repusitory/PatientListRepository.dart';
import 'package:aazioondoctorapp/profile/model/DocProfileModel.dart';
import 'package:aazioondoctorapp/profile/repository/DocProfileRepository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DocProfileBloc {
  DocProfileReposutory _docprofileRepository;

  StreamController _docprofileController;

  StreamSink<ApiResponse<DocProfileModel>> get docprofileSink => _docprofileController.sink;

  Stream<ApiResponse<DocProfileModel>> get docprofileStream => _docprofileController.stream;

  DocProfileBloc() {
    _docprofileController = StreamController<ApiResponse<DocProfileModel>>.broadcast();
    _docprofileRepository = DocProfileReposutory();
  }
  getDoctor() async {
    docprofileSink.add(ApiResponse.loading(
      "Fetching",
    ));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = "Bearer ";
    token += prefs.getString("token");
    print(token);
    int doctorId = prefs.getInt("user_id");
    Map body = {
      "doctor_id": doctorId.toString(),
    };
    try {
      DocProfileModel response = await _docprofileRepository.getDoctorProfile(body, token);
      docprofileSink.add(ApiResponse.completed(response));
    } catch (e) {
      docprofileSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _docprofileController?.close();
  }
}
