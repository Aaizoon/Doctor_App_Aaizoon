import 'dart:async';
import 'package:aazioondoctorapp/Lab/model/GivenLabTesTModel.dart';
import 'package:aazioondoctorapp/Lab/repository/LabListRepository.dart';
import 'package:aazioondoctorapp/help/api_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GivenTestBloc {
  LabListRepository _labListRepository;

  StreamController _streamController;

  StreamSink<ApiResponse<GivenLabTesTModel>> get getSink => _streamController.sink;

  Stream<ApiResponse<GivenLabTesTModel>> get getStream => _streamController.stream;

  GivenTestBloc() {
    _streamController = StreamController<ApiResponse<GivenLabTesTModel>>.broadcast();
    _labListRepository = LabListRepository();
    // getOtp();
  }

  Future<GivenLabTesTModel> givenTests(Map body) async {
    getSink.add(ApiResponse.loading('Loading'));
    GivenLabTesTModel givenLabTesTModel;
    try {
      givenLabTesTModel = await _labListRepository.givenLabTestList(body);
      getSink.add(ApiResponse.completed(givenLabTesTModel));
    } catch (e) {
      getSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
    return givenLabTesTModel;
  }

  dispose() {
    _streamController?.close();
  }
}
