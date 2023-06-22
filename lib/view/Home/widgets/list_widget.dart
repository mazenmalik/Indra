import 'product_container.dart';
import 'package:flutter/material.dart';
import 'package:indra/view/product_view.dart';
import 'package:indra/view%20model/products_viewmodel.dart';

class List extends StatelessWidget {
  const List({super.key, required this.value});
  final ProductsViewModel value;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: value.productList.data!.products!.length,
        itemBuilder: (context, index) {
          final url =
              value.productList.data!.products![index].thumbnail.toString();
          final title = value.productList.data!.products![index].title
              .toString()
              .toUpperCase();
          final price =
              value.productList.data!.products![index].price.toString();
          final discount = value
              .productList.data!.products![index].discountPercentage
              .toString();
          final stock =
              value.productList.data!.products![index].stock.toString();
          final album = value.productList.data!.products![index].images;
          final description =
              value.productList.data!.products![index].description.toString();
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductView(
                      url: url,
                      price: price,
                      description: description,
                      stock: stock,
                      discount: discount,
                      title: title,
                      album: album)));
            },
            child: ProductContainer(
              url: url,
              price: price,
              stock: stock,
              discount: discount,
              title: title,
            ),
          );
        });
  }
}
