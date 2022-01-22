import 'dart:async';

import 'package:aazioondoctorapp/document/repo/RecordRepo.dart';
import 'package:aazioondoctorapp/help/api_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'BookingModel.dart';
import 'model/AllAppointmentForPatient.dart';

class BookingBlocDoc {
  RecordRepo _profileRepository;

  StreamController _profileController;

  StreamSink<ApiResponse<BookingModel>> get profileSink => _profileController.sink;

  Stream<ApiResponse<BookingModel>> get profileStream => _profileController.stream;

  BookingBlocDoc() {
    _profileController = StreamController<ApiResponse<BookingModel>>();
    _profileRepository = RecordRepo();
    // getOtp();
  }

  Appointment_uploded_file_patient(String appointment_id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    int userId = prefs.getInt("uid");
    Map body = {
      "user_id": userId.toString(),
    };
    profileSink.add(ApiResponse.loading('Fetching Profile'));
    try {
      BookingModel response = await _profileRepository.appointment_uploaded_file_patient(appointment_id);
      profileSink.add(ApiResponse.completed(response));
    } catch (e) {
      profileSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _profileController?.close();
  }
}
