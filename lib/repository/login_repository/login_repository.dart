import 'package:flutter_mvvm_demo/data/network/network_api_service.dart';
import 'package:flutter_mvvm_demo/res/app_url.dart';

class LoginRepository {
  final _apiService = NetworkApiService();

  Future<dynamic> loginApi(var data) async {
    dynamic response = await _apiService.postApi(data, AppUrl.loginApi);
    return response;
  }
}
