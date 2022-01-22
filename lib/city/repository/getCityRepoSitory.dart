import 'package:aazioondoctorapp/city/model/SaveCityResponseModel.dart';
import 'package:aazioondoctorapp/city/model/getCityResponseModel.dart';
import 'package:aazioondoctorapp/help/api_base_helper.dart';

class GetCityRepository {
  ApiBaseHelper _helper = ApiBaseHelper();

  Future<GetCityResponseModel> getCityUpdate(Map body) async {
    final response = await _helper.post("api/user/get-cities", body);
    return GetCityResponseModel.fromJson(response);
  }

  Future<SaveCityResponseModel> saveCityUpdate(Map body) async {
    final response = await _helper.post("api/user/save-city", body);
    return SaveCityResponseModel.fromJson(response);
  }
}
