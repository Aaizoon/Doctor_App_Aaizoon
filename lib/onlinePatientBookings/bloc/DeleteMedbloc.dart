import 'dart:async';
import 'package:aazioondoctorapp/help/api_response.dart';
import 'package:aazioondoctorapp/onlinePatientBookings/model/DeleteMedicineModel.dart';
import 'package:aazioondoctorapp/onlinePatientBookings/repository/bookingCompletedRepository.dart';

class DeleteMedbloc {
  BookingCompletedRepository _bookingCompletedRepository;

  StreamController _streamController;

  StreamSink<ApiResponse<DeleteMedicineModel>> get getSink => _streamController.sink;

  Stream<ApiResponse<DeleteMedicineModel>> get getStream => _streamController.stream;

  DeleteMedbloc() {
    _streamController = StreamController<ApiResponse<DeleteMedicineModel>>.broadcast();
    _bookingCompletedRepository = BookingCompletedRepository();
    // getOtp();
  }

  Future<DeleteMedicineModel> deleteMed(Map body) async {
    getSink.add(ApiResponse.loading('Loading'));
    DeleteMedicineModel deleteMedicineModel;
    try {
      deleteMedicineModel = await _bookingCompletedRepository.deleteMed(body);
      getSink.add(ApiResponse.completed(deleteMedicineModel));
    } catch (e) {
      getSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
    return deleteMedicineModel;
  }

  dispose() {
    _streamController?.close();
  }
}
