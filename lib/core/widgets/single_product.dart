import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  final String image;
  final bool isLocalServer;
  const SingleProduct(
      {super.key, required this.image, this.isLocalServer = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black12, width: 1.5),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Container(
          height: 180,
          padding: const EdgeInsets.all(10),
          child: Image.network(
            isLocalServer ? "http://127.0.0.1:8000/$image" : image,
            height: 180,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
