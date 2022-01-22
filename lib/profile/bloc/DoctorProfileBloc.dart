import 'dart:async';

import 'package:aazioondoctorapp/help/api_response.dart';
import 'package:aazioondoctorapp/profile/model/DoctorProfileModel.dart';
import 'package:aazioondoctorapp/profile/repository/DoctorProfileRepository.dart';

class DoctorProfileBloc {
  DoctorProfileReposutory _doctorprofileReposutory;

  StreamController _doctorprofileController;

  StreamSink<ApiResponse<DoctorProfileModel>> get doctorprofileSink => _doctorprofileController.sink;

  Stream<ApiResponse<DoctorProfileModel>> get doctorprofileStream => _doctorprofileController.stream;

  DoctorProfileBloc() {
    _doctorprofileController = StreamController<ApiResponse<DoctorProfileModel>>();
    _doctorprofileReposutory = DoctorProfileReposutory();
    // getOtp();
  }

  AddDoctor(Map body, String token) async {
    doctorprofileSink.add(ApiResponse.loading(
      "Submitting",
    ));
    try {
      DoctorProfileModel response = await _doctorprofileReposutory.addDoctor(body, token);
      doctorprofileSink.add(ApiResponse.completed(response));
    } catch (e) {
      doctorprofileSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _doctorprofileController?.close();
  }
}
