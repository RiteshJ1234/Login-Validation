import 'package:flutter/material.dart';
import 'package:task/custom_widget/grid_list_widget.dart';
import 'package:task/custom_widget/horizontal_list_widget.dart';
import 'package:task/custom_widget/vertical_list_widget.dart';
import 'package:task/model/product_list.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[50],
        title: const Text(
          "Hellow Ritesh",
          style: TextStyle(
              color: Colors.blue, fontSize: 26, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.logout_outlined,
              color: Colors.blue[400],
            ),
            tooltip: "Logout",
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Grid List",
              style: TextStyle(
                  color: Colors.pink[300],
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: GridView.builder(
                  itemCount: ProductList.productList.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (_, int index) => GridListWidget(index: index)),
            ),
            Text(
              "Horizontal List",
              style: TextStyle(
                  color: Colors.pink[300],
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 130,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: ProductList.productList.length,
                  itemBuilder: (context, index) => HorizontalListWidget(
                        index: index,
                      )),
            ),
            Text(
              "Vertical List",
              style: TextStyle(
                  color: Colors.pink[300],
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                //scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: ProductList.productList.length,
                itemBuilder: (context, index) => VerticalListWidget(
                  index: index,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.pink[50],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[300],
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }
}
