import 'package:flutter/material.dart';
import 'package:task/model/product_list.dart';

class HorizontalListWidget extends StatelessWidget {
  final int index;
  const HorizontalListWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              ProductList.productList[index],
              height: 100,
            ),
          ),
        ),
        Text(
          "Nature Image",
          style: TextStyle(
              color: Colors.blue[400],
              fontSize: 14,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
