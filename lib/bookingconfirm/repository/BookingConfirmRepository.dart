import 'package:aazioondoctorapp/bookingconfirm/model/BookingConfirmModel.dart';
import 'package:aazioondoctorapp/help/api_base_helper.dart';

class BookingConfirmRepository {
  ApiBaseHelper _helper = ApiBaseHelper();

  Future<BookingConfirmModel> booking(Map body, String token) async {
    final response = await _helper.postWithHeader("api/doctor/approve-appointment", body, token);
    return BookingConfirmModel.fromJson(response);
  }
}
