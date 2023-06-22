import 'package:flutter/material.dart';
import 'package:indra/data/response/status.dart';
import 'package:indra/resources/string_manager.dart';
import 'package:indra/view%20model/products_viewmodel.dart';
import 'package:provider/provider.dart';

import 'widgets/list_widget.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});
  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  ProductsViewModel productsViewModel = ProductsViewModel();
  @override
  void initState() {
    productsViewModel.fetchStationListApi(context,
        {"limit": 10}.map((key, value) => MapEntry(key, value.toString())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          centerTitle: true,
          title: const Text(AppString.productList),
        ),
        body: ChangeNotifierProvider<ProductsViewModel>(
            create: (BuildContext context) => productsViewModel,
            child: Consumer<ProductsViewModel>(builder: (context, value, _) {
              switch (value.productList.status!) {
                case Status.LOADING:
                  return const Center(
                      child: Center(child: CircularProgressIndicator()));
                case Status.ERROR:
                  return Center(
                      child: Text(value.productList.message.toString()));
                case Status.COMPLETED:
                  return Builder(builder: (context) {
                    return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: List(value: value));
                  });
              }
            })));
  }
}
