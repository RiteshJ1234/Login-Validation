import 'package:flutter/material.dart';
import 'package:task/model/product_list.dart';

class VerticalListWidget extends StatelessWidget {
  final int index;
  const VerticalListWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              ProductList.productList[index],
              height: 80,
            ),
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        Text(
          "Nature Image",
          style: TextStyle(
              color: Colors.blue[400],
              fontSize: 19,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
