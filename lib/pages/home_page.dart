import 'package:dukan/pages/dashboard.dart';
import 'package:dukan/utils/cart_icons.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _widgetList = [
    DashBoard(),
    DashBoard(),
    DashBoard(),
    DashBoard()
  ];
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      bottomNavigationBar: BottomNavigationBar(
          items: [
BottomNavigationBarItem(icon: Icon(CartIcons.home,
),
label: 'Store',

),
BottomNavigationBarItem(icon: Icon(Icons.shopping_cart,
),
label: 'My Cart',
),BottomNavigationBarItem(icon: Icon(Icons.favorite,
),
label: 'Favourites',
),BottomNavigationBarItem(icon: Icon(Icons.supervised_user_circle,
),
label: 'Account',
),

          ],
          selectedItemColor: Colors.redAccent,
          unselectedItemColor: Colors.black,
          type: BottomNavigationBarType.shifting,
          currentIndex: _index,
          onTap: (index) {
            setState(() {
              _index = index;
            });
          },
          ),
      body: _widgetList[_index],
    );
  }
}

Widget _buildAppBar() {
  return AppBar(
    centerTitle: true,
    brightness: Brightness.dark,
    elevation: 0,
    backgroundColor: Colors.grey[900],
    automaticallyImplyLeading: false,
    title: Text(
      'JMD',
      style: TextStyle(color: Colors.white),
    ),
    actions: [
      Icon(
        Icons.notifications_none,
        color: Colors.white,
      ),
      SizedBox(
        width: 10,
      ),
      Icon(
        Icons.shopping_cart,
        color: Colors.white,
      ),
       SizedBox(
        width: 10,
      ),
    ],
  );
}


