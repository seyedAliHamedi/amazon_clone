import 'package:amazon_clone/core/widgets/custom_appbar.dart';
import 'package:amazon_clone/features/home/widgets/address_box.dart';
import 'package:amazon_clone/features/home/widgets/categories.dart';
import 'package:amazon_clone/features/home/widgets/crousel_image.dart';
import 'package:amazon_clone/features/home/widgets/deal_of_day.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = "/home-screen";
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(
          titleWidget: Expanded(
            child: Container(
              height: 42,
              margin: const EdgeInsets.only(left: 15, bottom: 5),
              child: Material(
                borderRadius: BorderRadius.circular(8),
                elevation: 1,
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(2.5),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      borderSide: BorderSide(color: Colors.black38, width: 1),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Search in Amazon.com",
                    prefixIcon: InkWell(
                      onTap: () {},
                      child: const Icon(Icons.search),
                    ),
                  ),
                ),
              ),
            ),
          ),
          iconList: const [
            Icon(Icons.mic),
          ],
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            AddressBox(),
            SizedBox(height: 20),
            Categories(),
            SizedBox(height: 20),
            CarouselImage(),
            SizedBox(height: 20),
            DealOfDay(),
          ],
        ),
      ),
    );
  }
}
