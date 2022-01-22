import 'dart:async';

import 'package:aazioondoctorapp/help/api_response.dart';
import 'package:aazioondoctorapp/onlinePatientBookings/model/availabilityModel.dart';
import 'package:aazioondoctorapp/onlinePatientBookings/repository/onlinePatientBookingRepository.dart';

class AvailabilityBloc {
  OnlinePatientBookingRepository _onlinePatientBookingRepository;

  StreamController _availabilityController;

  StreamSink<ApiResponse<AvailabilityModel>> get sink => _availabilityController.sink;

  Stream<ApiResponse<AvailabilityModel>> get stream => _availabilityController.stream;

  AvailabilityBloc() {
    _availabilityController = StreamController<ApiResponse<AvailabilityModel>>();
    _onlinePatientBookingRepository = OnlinePatientBookingRepository();
  }

  availability(Map body, token) async {
    sink.add(ApiResponse.loading('Submitting'));
    try {
      AvailabilityModel response = await _onlinePatientBookingRepository.availability(body, token);
      sink.add(ApiResponse.completed(response));
    } catch (e) {
      sink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _availabilityController?.close();
  }
}
