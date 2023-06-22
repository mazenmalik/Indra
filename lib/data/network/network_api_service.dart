import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:indra/data/network/base_api_service.dart';
import 'package:indra/data/response/app_exceptions.dart';

class NetworkApiService extends BaseApiServices {
  @override
  Future getApiResponse(String url, dynamic queryParameters) async {
    dynamic responseJson;
    try {
      final response = await http
          .get(Uri.parse(url).replace(queryParameters: queryParameters))
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 201:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException('Error accured while communicating with server'
            ' with status code ${response.statusCode.toString()} ');
    }
  }
}
