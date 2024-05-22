import 'package:amazon_clone/core/providers/user_provider.dart';
import 'package:amazon_clone/core/ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressBox extends StatelessWidget {
  const AddressBox({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      height: 40,
      decoration: const BoxDecoration(
        gradient: UI.appBarGradient,
      ),
      child: Row(
        children: [
          const Icon(Icons.pin_drop),
          const SizedBox(width: 5),
          Expanded(
            child: Text(
              "Delivery to ${user.name} - ${user.address}",
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }
}
