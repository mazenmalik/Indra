import 'package:flutter/material.dart';
import 'package:indra/resources/string_manager.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer(
      {super.key,
      required this.url,
      required this.price,
      required this.stock,
      required this.discount,
      required this.title});
  final String url, title, price, stock, discount;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 300,
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network(
                  height: 250, width: double.maxFinite, url, fit: BoxFit.fill),
              Positioned(
                  top: 5,
                  right: 5,
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text("  ${AppString.save}\n$discount%"),
                      )))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              Text("${AppString.stock} $stock")
            ],
          ),
          Text('\$$price ${AppString.only}'),
        ],
      ),
    );
  }
}
