import 'package:amazon_clone/core/ui.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        itemCount: UI.categoryImages.length,
        scrollDirection: Axis.horizontal,
        itemExtent: 85,
        itemBuilder: ((context, index) {
          return Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  UI.categoryImages[index]['image']!,
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                UI.categoryImages[index]['title']!,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
