import 'package:flutter/material.dart';
import 'package:kiptus_marchant/pages/upload_product_image.dart';
import 'package:kiptus_marchant/widgets/my_app_bar.dart';
import 'package:kiptus_marchant/widgets/place_holder.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    UploadProductImage(),
    PlaceholderWidget(Colors.deepOrange),
    PlaceholderWidget(Colors.green),
    PlaceholderWidget(Colors.amber),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(),
      appBar: myAppBar(),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff95e2f9),
        unselectedItemColor: Color(0xff95e2f9),
        selectedItemColor: Colors.blue,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.tram),
            title: new Text('Delivery'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.shopping_basket),
            title: new Text('Shop'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            title: Text('Help'),
          )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
