import 'package:amazon_clone/core/widgets/custom_appbar.dart';
import 'package:amazon_clone/core/widgets/custom_button.dart';
import 'package:amazon_clone/core/widgets/custom_textfield.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddProductModal extends StatefulWidget {
  const AddProductModal({super.key});
  static const String routeName = '/add-product';

  @override
  State<AddProductModal> createState() => _AddProductModalState();
}

class _AddProductModalState extends State<AddProductModal> {
  final GlobalKey _formKey = GlobalKey();

  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productDescController = TextEditingController();
  final TextEditingController _productPriceController = TextEditingController();
  final TextEditingController _productQuantityController =
      TextEditingController();

  List<String> drowDownList = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Books',
    'Fashion',
  ];
  String selected_category = "Books";
  @override
  void dispose() {
    _productNameController.dispose();
    _productDescController.dispose();
    _productPriceController.dispose();
    _productQuantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(
          titleWidget: Expanded(
            child: Container(
              alignment: Alignment.topCenter,
              child: const Text("Add Product"),
            ),
          ),
          iconList: const [],
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(height: 30),
                DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(12),
                  dashPattern: const [20, 8],
                  strokeCap: StrokeCap.round,
                  child: Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.folder_open, size: 40),
                        const SizedBox(height: 15),
                        Text(
                          "Select Images for the product",
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                CustomTextField(
                  controller: _productNameController,
                  hintText: "Product Name",
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  controller: _productDescController,
                  hintText: "Description",
                  maxLines: 7,
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  controller: _productPriceController,
                  hintText: "Price",
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  controller: _productQuantityController,
                  hintText: "Quantity",
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    value: selected_category,
                    icon: const Icon(Icons.arrow_downward),
                    items: drowDownList
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        selected_category = val!;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 15),
                CustomButton(text: "Sell", onTap: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
