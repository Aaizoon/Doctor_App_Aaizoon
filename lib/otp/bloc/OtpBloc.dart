import 'dart:async';

import 'package:aazioondoctorapp/help/api_response.dart';
import 'package:aazioondoctorapp/help/api_response.dart';
import 'package:aazioondoctorapp/model/RegisterApi.dart';
import '../OtpRepository.dart';

class OtpBloc {
  OtpRepository _otpRepository;

  StreamController _otpController;

  StreamSink<ApiResponse<RegisterApi>> get registerSink => _otpController.sink;

  Stream<ApiResponse<RegisterApi>> get registerStream => _otpController.stream;

  OtpBloc() {
    _otpController = StreamController<ApiResponse<RegisterApi>>();
    _otpRepository = OtpRepository();
    // getOtp();
  }

  getOtp(Map body) async {
    registerSink.add(ApiResponse.loading('Loading'));
    try {
      RegisterApi response = await _otpRepository.register(body);
      registerSink.add(ApiResponse.completed(response));
    } catch (e) {
      registerSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _otpController?.close();
  }
}
