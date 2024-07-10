import 'package:flutter/material.dart';
import 'package:task/model/product_list.dart';

class GridListWidget extends StatelessWidget {
  final int index;

  const GridListWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              ProductList.productList[index],
              height: 60,
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
