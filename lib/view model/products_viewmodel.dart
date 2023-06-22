import 'package:flutter/material.dart';
import 'package:indra/data/repository/product_repository.dart';
import 'package:indra/data/response/api_response.dart';
import 'package:indra/model/product_list_model.dart';

class ProductsViewModel extends ChangeNotifier {
  final _myRepo = ProductListRepository();
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  ApiResponse<ProductListModel> productList = ApiResponse.loading();
  setProductList(ApiResponse<ProductListModel> response) {
    productList = response;
    notifyListeners();
  }

  Future<void> fetchStationListApi(BuildContext context, data) async {
    setProductList(ApiResponse.loading());

    _myRepo.fetchProductList(context, data).then((value) {
      setProductList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setProductList(ApiResponse.error(error.toString()));
    });
  }
}
