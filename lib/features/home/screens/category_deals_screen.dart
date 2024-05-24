import 'package:amazon_clone/core/widgets/custom_appbar.dart';
import 'package:amazon_clone/core/widgets/loader.dart';
import 'package:amazon_clone/core/widgets/single_product.dart';
import 'package:amazon_clone/features/home/services/home_services.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CategoryDealsScreen extends StatefulWidget {
  final String category;
  static const String routeName = '/category-deals';
  const CategoryDealsScreen({super.key, required this.category});

  @override
  State<CategoryDealsScreen> createState() => _CategoryDealsScreenState();
}

class _CategoryDealsScreenState extends State<CategoryDealsScreen> {
  final HomeServices _services = HomeServices();
  List<Product> products = [];

  void fetchCategoryProducts() async {
    products = await _services.fetchCategoryProducts(
        context: context, category: widget.category);
    setState(() {});
  }

  @override
  void initState() {
    fetchCategoryProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(
          titleWidget: Expanded(
            child: Text(
              widget.category,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          iconList: const [],
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Text(
              "Keep shopping for ${widget.category}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                letterSpacing: .5,
                color: Colors.black,
              ),
            ),
          ),
          products.isEmpty
              ? const Loader()
              : SizedBox(
                  height: 200,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 15),
                    itemCount: products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 1.4,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          SingleProduct(
                            image: products[index].imageUrls[0],
                            isLocalServer: true,
                          ),
                          Text(
                            products[index].name,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ],
                      );
                    },
                  ),
                )
        ],
      ),
    );
  }
}
