/*


import 'package:aazioondoctorapp/help/api_base_helper.dart';
import 'package:aazioondoctorapp/login/model/RegisterResponseModel.dart';

class LogInRepository {


  ApiBaseHelper _helper = ApiBaseHelper();

  Future<RegisterResponseModel> register(Map body) async {
    //final response = await _helper.get("movie/popular?api_key=$_apiKey");
    final response = await _helper.post("api/register",body);
    return RegisterResponseModel.fromJson(response);

  }

}
*/
