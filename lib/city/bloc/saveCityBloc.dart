import 'dart:async';

import 'package:aazioondoctorapp/city/model/SaveCityResponseModel.dart';
import 'package:aazioondoctorapp/city/repository/getCityRepoSitory.dart';
import 'package:aazioondoctorapp/help/api_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveCityBloc {
  GetCityRepository _getCityRepository;

  StreamController _streamController;

  StreamSink<ApiResponse<SaveCityResponseModel>> get getSink => _streamController.sink;

  Stream<ApiResponse<SaveCityResponseModel>> get getStream => _streamController.stream;

  SaveCityBloc() {
    _streamController = StreamController<ApiResponse<SaveCityResponseModel>>.broadcast();
    _getCityRepository = GetCityRepository();
    // getOtp();
  }

  Future<SaveCityResponseModel> saveCity(Map body) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    getSink.add(ApiResponse.loading('Loading'));
    SaveCityResponseModel saveCityResponseModel;
    try {
      saveCityResponseModel = await _getCityRepository.saveCityUpdate(body);
      getSink.add(ApiResponse.completed(saveCityResponseModel));
    } catch (e) {
      getSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
    return saveCityResponseModel;
  }

  dispose() {
    _streamController?.close();
  }
}
