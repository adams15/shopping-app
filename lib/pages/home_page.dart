import 'package:flutter/material.dart';
import '../nav_bar.dart';
import 'cart_page.dart';
import 'shop-page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // this selected index is to control the btn bar
  int _selectedIndex = 0;
  // this method will update our selcted index
  // when the user taps on th btn bar
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // pages to display
  final List<Widget> _pages = [
    ShopPage(),
    // Cart page
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[300],
      bottomNavigationBar: BtnNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          children: [
            DrawerHeader(
                child: Image.asset(
              "lib/images/image6.png",
              color: Colors.white,
            )),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Divider(color: Colors.red),
            ),
            //other pages
            const Padding(
              padding: EdgeInsets.only(left: 25),
              child: ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                title: Text(
                  "Home",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            //item2
            const Padding(
              padding: EdgeInsets.only(left: 25),
              child: ListTile(
                leading: Icon(
                  Icons.info,
                  color: Colors.white,
                ),
                title: Text(
                  "About",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            //itm3
            const Padding(
              padding: EdgeInsets.only(left: 25),
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                title: Text(
                  "Logout",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
