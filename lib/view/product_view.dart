import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:indra/resources/string_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductView extends StatefulWidget {
  const ProductView(
      {super.key,
      required this.url,
      required this.price,
      required this.stock,
      required this.discount,
      required this.title,
      required this.description,
      required this.album});
  final String url, title, price, stock, discount, description;
  final List<String>? album;

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  int activeIndex = 0;
  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: widget.album!.length,
        effect: const JumpingDotEffect(
            dotWidth: 8, dotHeight: 8, activeDotColor: Colors.deepPurple),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
          title: Text(widget.title)),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          color: Colors.white,
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                  options: CarouselOptions(
                      height: 300,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index, reason) =>
                          setState(() => activeIndex = index)),
                  items: widget.album!
                      .map((item) => Center(
                            child: SizedBox(
                                height: 250,
                                child: Image.network(item, fit: BoxFit.cover)),
                          ))
                      .toList()),
              Center(child: buildIndicator()),
              const SizedBox(height: 30),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(widget.title,
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                    Text("${AppString.stock} ${widget.stock}")
                  ]),
              Text('\$${widget.price}'),
              const SizedBox(height: 20),
              const Text(AppString.description,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              Text(widget.description)
            ],
          ),
        ),
      ),
    );
  }
}
