import 'dart:convert';
import 'dart:io';
import 'package:flutter_mvvm_demo/data/app_exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_mvvm_demo/data/network/base_api_services.dart';

class NetworkApiService extends BaseApiService {
  @override
  Future<dynamic> getApi(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 20));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetExceptions('');
    }

    return responseJson;
  }

  @override
  Future<dynamic> postApi(var data, String url) async {
    dynamic responseJson;
    try {
      print("url: $url");
      print("data: $data");
      final response = await http
          .post(Uri.parse(url), body: json.encode(data))
          .timeout(const Duration(seconds: 60));
      responseJson = returnResponse(response);
      print(responseJson);
    } on SocketException {
      throw InternetExceptions('Hello anuj,error is here');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw TimeOutExceptions('Api returned 400');
      default:
        throw FetchDataExceptions(
            'Something other issue happaned:: check in network_api_service file');
    }
  }
}
