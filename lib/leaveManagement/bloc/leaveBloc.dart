import 'dart:async';
import 'package:aazioondoctorapp/help/api_response.dart';
import 'package:aazioondoctorapp/leaveManagement/leaveRepository.dart';
import 'package:aazioondoctorapp/leaveManagement/model/leaveResponseModel.dart';

class LeaveBloc {
  LeaveRepository _leaveRepository;

  StreamController _streamController;

  StreamSink<ApiResponse<LeaveResponseModel>> get getSink => _streamController.sink;

  Stream<ApiResponse<LeaveResponseModel>> get getStream => _streamController.stream;

  LeaveBloc() {
    _streamController = StreamController<ApiResponse<LeaveResponseModel>>.broadcast();
    _leaveRepository = LeaveRepository();
  }

  Future<LeaveResponseModel> leave(Map body) async {
    getSink.add(ApiResponse.loading('Loading'));
    LeaveResponseModel leaveResponseModel;
    try {
      leaveResponseModel = await _leaveRepository.leave(body);
      getSink.add(ApiResponse.completed(leaveResponseModel));
    } catch (e) {
      getSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
    return leaveResponseModel;
  }

  dispose() {
    _streamController?.close();
  }
}
