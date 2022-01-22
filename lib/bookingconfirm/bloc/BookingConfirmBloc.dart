import 'dart:async';

import 'package:aazioondoctorapp/bookingconfirm/model/BookingConfirmModel.dart';
import 'package:aazioondoctorapp/bookingconfirm/repository/BookingConfirmRepository.dart';
import 'package:aazioondoctorapp/help/api_response.dart';
import 'package:aazioondoctorapp/login/model/RegisterResponseModel.dart';

class BookingConfirmBloc {
  BookingConfirmRepository _bookingconfirmRepository;

  StreamController _bookingconfirmController;

  StreamSink<ApiResponse<BookingConfirmModel>> get bookingconfirmSink => _bookingconfirmController.sink;

  Stream<ApiResponse<BookingConfirmModel>> get bookingconfirmStream => _bookingconfirmController.stream;

  BookingConfirmBloc() {
    _bookingconfirmController = StreamController<ApiResponse<BookingConfirmModel>>.broadcast();
    _bookingconfirmRepository = BookingConfirmRepository();
  }

  booking(Map body, String token) async {
    bookingconfirmSink.add(ApiResponse.loading(""));
    try {
      BookingConfirmModel response = await _bookingconfirmRepository.booking(body, token);
      bookingconfirmSink.add(ApiResponse.completed(response));
    } catch (e) {
      bookingconfirmSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _bookingconfirmController?.close();
    bookingconfirmStream.asBroadcastStream().listen((event) {});
  }
}
