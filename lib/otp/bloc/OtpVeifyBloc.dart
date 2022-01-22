import 'dart:async';

import 'package:aazioondoctorapp/help/api_response.dart';
import 'package:aazioondoctorapp/otp/model/VerifyMobileResponse.dart';

import '../OtpRepository.dart';

class OtpVerifyBloc {
  OtpRepository _otpRepository;

  StreamController _otpVerifyController;

  StreamSink<ApiResponse<VerifyMobileModel>> get verifySink => _otpVerifyController.sink;

  Stream<ApiResponse<VerifyMobileModel>> get verifyStream => _otpVerifyController.stream;

  OtpVerifyBloc() {
    _otpVerifyController = StreamController<ApiResponse<VerifyMobileModel>>();
    _otpRepository = OtpRepository();
    // getOtp();
  }

  verifyOtp(Map body, String token) async {
    verifySink.add(ApiResponse.loading('Verifying'));
    try {
      VerifyMobileModel otpsubmit = await _otpRepository.verifyMobile(body, token);
      verifySink.add(ApiResponse.completed(otpsubmit));
    } catch (e) {
      verifySink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _otpVerifyController?.close();
  }
}
