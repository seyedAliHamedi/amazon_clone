import 'package:amazon_clone/core/widgets/loader.dart';
import 'package:amazon_clone/core/widgets/single_product.dart';
import 'package:amazon_clone/features/admin/screens/add_product_modal.dart';
import 'package:amazon_clone/features/admin/services/admin_services.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  AdminServices _services = AdminServices();
  List<Product>? products;

  fetchAllProducts() async {
    products = await _services.fetchProducts(context: context);
    setState(() {});
  }

  deleteProduct(int index) {
    _services.deleteProduct(context: context, id: products![index].id!);
    setState(() {});
  }

  @override
  void initState() {
    fetchAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return products == null
        ? const Loader()
        : Scaffold(
            body: GridView.builder(
              itemCount: products!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                final productData = products![index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 140,
                      child: SingleProduct(
                        image: productData.imageUrls[0],
                        isLocalServer: true,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(width: 15),
                        Expanded(
                          child: Text(
                            productData.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 15),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            deleteProduct(index);
                          },
                          icon: const Icon(Icons.delete_outline),
                        )
                      ],
                    )
                  ],
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              onPressed: () async {
                var val = await Navigator.pushNamed(
                    context, AddProductModal.routeName);
                print(val);
                setState(() {});
              },
              tooltip: "Add a Product",
              child: const Icon(Icons.add),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}
