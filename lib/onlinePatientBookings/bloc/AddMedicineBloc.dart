import 'dart:async';
import 'package:aazioondoctorapp/help/api_response.dart';
import 'package:aazioondoctorapp/onlinePatientBookings/model/AddMedicineListModel.dart';
import 'package:aazioondoctorapp/onlinePatientBookings/repository/bookingCompletedRepository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddMedicineBloc {
  BookingCompletedRepository _bookingCompletedRepository;

  StreamController _streamController;

  StreamSink<ApiResponse<AddMedicineListModel>> get getSink => _streamController.sink;

  Stream<ApiResponse<AddMedicineListModel>> get getStream => _streamController.stream;

  AddMedicineBloc() {
    _streamController = StreamController<ApiResponse<AddMedicineListModel>>.broadcast();
    _bookingCompletedRepository = BookingCompletedRepository();
    // getOtp();
  }

  Future<AddMedicineListModel> addMed(Map body) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    getSink.add(ApiResponse.loading('Loading'));
    AddMedicineListModel addMedicineListModel;
    try {
      addMedicineListModel = await _bookingCompletedRepository.medList(body);
      getSink.add(ApiResponse.completed(addMedicineListModel));
    } catch (e) {
      getSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
    return addMedicineListModel;
  }

  dispose() {
    _streamController?.close();
  }
}
