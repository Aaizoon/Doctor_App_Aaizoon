

import 'package:aazioondoctorapp/help/api_base_helper.dart';
import 'package:aazioondoctorapp/incomehistory/model/OnlineIncomeResponseModel.dart';
import 'package:aazioondoctorapp/incomehistory/model/getIncomeOfflineResponseModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IncomeRepository {
  ApiBaseHelper _helper = ApiBaseHelper();

  Future<GetIncomeOfflineResponseModel> getOfflineIncome(Map body) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    final response = await _helper.postWithHeader("api/doctor/offline/earnings", body, "Bearer "+token);
    return GetIncomeOfflineResponseModel.fromJson(response);
  }
  Future<GetIncomeOnlineResponseModel> getOnlineIncome(Map body) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    final response = await _helper.postWithHeader("api/doctor/online/earnings", body, "Bearer "+token);
    return GetIncomeOnlineResponseModel.fromJson(response);
  }
}
