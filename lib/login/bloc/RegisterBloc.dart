/*
import 'dart:async';

import 'package:aazioondoctorapp/help/api_response.dart';
import 'package:aazioondoctorapp/login/model/RegisterResponseModel.dart';
import '../LogInRepository.dart';

class RegisterBloc {
  LogInRepository _loginRepository;

  StreamController _loginController;

  StreamSink<ApiResponse<RegisterResponseModel>> get registerSink =>
      _loginController.sink;

  Stream<ApiResponse<RegisterResponseModel>> get registerStream =>
      _loginController.stream;


  RegisterBloc() {
    _loginController = StreamController<ApiResponse<RegisterResponseModel>>();
    _loginRepository = LogInRepository();
   // getOtp();
  }

  register(Map body) async {
    registerSink.add(ApiResponse.loading('Submitting'));
    try {
      RegisterResponseModel response = await _loginRepository.register(body);
      registerSink.add(ApiResponse.completed(response));
    } catch (e) {
      registerSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }


  dispose() {
    _loginController?.close();
  }
}
*/
