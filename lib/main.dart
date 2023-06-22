import 'package:flutter/material.dart';
import 'package:indra/view%20model/products_viewmodel.dart';
import 'package:provider/provider.dart';

import 'view/Home/product_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ProductsViewModel())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ProductList(),
      ),
    );
  }
}
