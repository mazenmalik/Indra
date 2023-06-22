import 'package:flutter/material.dart';
import 'package:indra/data/network/app_url.dart';
import 'package:indra/data/network/base_api_service.dart';
import 'package:indra/data/network/network_api_service.dart';
import 'package:indra/model/product_list_model.dart';

class ProductListRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future fetchProductList(BuildContext context, dynamic queryParameters) async {
    try {
      dynamic response = await _apiServices.getApiResponse(
          AppUrl.productListApiEndpoint, queryParameters);

      return response = ProductListModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
