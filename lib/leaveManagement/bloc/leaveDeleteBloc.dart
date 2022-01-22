import 'dart:async';
import 'package:aazioondoctorapp/help/api_response.dart';
import 'package:aazioondoctorapp/leaveManagement/leaveRepository.dart';
import 'package:aazioondoctorapp/leaveManagement/model/leaveDeleteModel.dart';

class LeaveDeleteBloc {
  LeaveRepository _leaveRepository;

  StreamController _streamController;

  StreamSink<ApiResponse<LeaveDeleteModel>> get deleteSink => _streamController.sink;

  Stream<ApiResponse<LeaveDeleteModel>> get deleteStream => _streamController.stream;

  LeaveDeleteBloc() {
    _streamController = StreamController<ApiResponse<LeaveDeleteModel>>.broadcast();
    _leaveRepository = LeaveRepository();
  }

  Future<LeaveDeleteModel> leaveDelete(Map body) async {
    deleteSink.add(ApiResponse.loading('Loading'));
    LeaveDeleteModel leaveDeleteModel;
    try {
      leaveDeleteModel = await _leaveRepository.leaveDelete(body);
      deleteSink.add(ApiResponse.completed(leaveDeleteModel));
    } catch (e) {
      deleteSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
    return leaveDeleteModel;
  }

  dispose() {
    _streamController?.close();
  }
}
