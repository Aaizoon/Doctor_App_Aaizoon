import 'dart:async';



import 'package:aazioondoctorapp/city/model/SaveCityResponseModel.dart';
import 'package:aazioondoctorapp/help/api_response.dart';
import 'package:aazioondoctorapp/onlinePatientBookings/model/updateFindingsModel.dart';
import 'package:aazioondoctorapp/onlinePatientBookings/repository/bookingCompletedRepository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateFindingsBloc {
  BookingCompletedRepository _bookingCompletedRepository;

  StreamController _streamController;

  StreamSink<ApiResponse<UpdateFindingsModel>> get getSink => _streamController.sink;

  Stream<ApiResponse<UpdateFindingsModel>> get getStream => _streamController.stream;

  UpdateFindingsBloc() {
    _streamController = StreamController<ApiResponse<UpdateFindingsModel>>.broadcast();
    _bookingCompletedRepository = BookingCompletedRepository();
    // getOtp();
  }

  Future<UpdateFindingsModel> updateFindings(Map body) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    getSink.add(ApiResponse.loading('Loading'));
    UpdateFindingsModel updateFindingsModel;
    try {
      updateFindingsModel = await _bookingCompletedRepository.updateFindings(body);
      getSink.add(ApiResponse.completed(updateFindingsModel));
    } catch (e) {
      getSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
    return updateFindingsModel;
  }

  dispose() {
    _streamController?.close();
  }
}
