import 'dart:async';
import 'package:aazioondoctorapp/help/api_response.dart';
import 'package:aazioondoctorapp/incomehistory/model/OnlineIncomeResponseModel.dart';
import 'package:aazioondoctorapp/incomehistory/repository/getIncomeRepository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetOnlineEarningsBloc {
  IncomeRepository _incomeRepository;

  StreamController _streamController;

  StreamSink<ApiResponse<GetIncomeOnlineResponseModel>> get getSink => _streamController.sink;

  Stream<ApiResponse<GetIncomeOnlineResponseModel>> get getStream => _streamController.stream;

  GetOnlineEarningsBloc() {
    _streamController = StreamController<ApiResponse<GetIncomeOnlineResponseModel>>.broadcast();
    _incomeRepository = IncomeRepository();
  }

  Future<GetIncomeOnlineResponseModel> getOnlineEarnings(Map body) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    getSink.add(ApiResponse.loading('Loading'));
    GetIncomeOnlineResponseModel getIncomeOnlineResponseModel;
    try {
      getIncomeOnlineResponseModel = await _incomeRepository.getOnlineIncome(body);
      getSink.add(ApiResponse.completed(getIncomeOnlineResponseModel));
    } catch (e) {
      getSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
    return getIncomeOnlineResponseModel;
  }

  dispose() {
    _streamController?.close();
  }
}
