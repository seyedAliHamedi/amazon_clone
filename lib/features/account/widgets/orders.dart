import 'package:amazon_clone/core/ui.dart';
import 'package:amazon_clone/core/widgets/single_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15),
              child: const Text(
                "Your Orders",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.only(right: 15),
              child: Text(
                "see all",
                style: TextStyle(
                  color: UI.selectedNavBarColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        Container(
          height: 170,
          padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
          child: ListView.builder(
            itemCount: UI.carouselImages.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: ((context, index) {
              return SingleProduct(
                image: UI.carouselImages[index],
              );
            }),
          ),
        ),
      ],
    );
  }
}
