import 'dart:async';
import 'package:aazioondoctorapp/help/api_response.dart';
import 'package:aazioondoctorapp/incomehistory/model/getIncomeOfflineResponseModel.dart';
import 'package:aazioondoctorapp/incomehistory/repository/getIncomeRepository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetInClinicEarningsBloc {
  IncomeRepository _incomeRepository;

  StreamController _streamController;

  StreamSink<ApiResponse<GetIncomeOfflineResponseModel>> get getSink => _streamController.sink;

  Stream<ApiResponse<GetIncomeOfflineResponseModel>> get getStream => _streamController.stream;

  GetInClinicEarningsBloc() {
    _streamController = StreamController<ApiResponse<GetIncomeOfflineResponseModel>>.broadcast();
    _incomeRepository = IncomeRepository();
    // getOtp();
  }

  Future<GetIncomeOfflineResponseModel> getEarnings(Map body) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    getSink.add(ApiResponse.loading('Loading'));
    GetIncomeOfflineResponseModel getIncomeOfflineResponseModel;
    try {
      getIncomeOfflineResponseModel = await _incomeRepository.getOfflineIncome(body);
      getSink.add(ApiResponse.completed(getIncomeOfflineResponseModel));
    } catch (e) {
      getSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
    return getIncomeOfflineResponseModel;
  }

  dispose() {
    _streamController?.close();
  }
}
