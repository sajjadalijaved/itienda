import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'baseapiservices.dart';
import 'package:http/http.dart' as http;
import '../appException/app_exception.dart';

class NetworkApiServices implements BaseApiAServices {
  dynamic requestResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 400:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 401:
        throw UnauthorizedException();
      case 500:
        throw FetchDataException(
            "Error communication with server${response.statusCode}");
      default:
        throw UnauthorizedException();
    }
  }

  @override
  Future<dynamic> getGetApiResponse(
      String url, Map<String, String> headers) async {
    dynamic jsonResponse;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 50));
      jsonResponse = requestResponse(response);
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw FetchDataException('Time out try again');
    } catch (e) {
      log(e.toString());
    }
    return jsonResponse;
  }

  @override
  Future<dynamic> getPostApiResponse(String url, data) async {
    dynamic jsonResponse;
    try {
      final response = await http.post(Uri.parse(url),
          body: jsonEncode(data),
          headers: {
            'Content-Type': 'application/json'
          }).timeout(const Duration(seconds: 50));
      jsonResponse = requestResponse(response);
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw FetchDataException('Time out try again');
    } catch (e) {
      log(e.toString());
    }
    return jsonResponse;
  }

  @override
  Future<dynamic> getPostForgetApiResponse(String url, data) async {
    dynamic responseJson;
    try {
      final response = await http.post(Uri.parse(url),
          body: jsonEncode(data),
          headers: {
            'Content-Type': 'application/json'
          }).timeout(const Duration(seconds: 50));
      responseJson = requestResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Exception');
    }
    return responseJson;
  }
}
