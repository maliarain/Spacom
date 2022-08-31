import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'home_screen/booking_screen.dart';
import 'home_screen/favourite_screen.dart';
import 'home_screen/home_screen.dart';
import 'home_screen/location_screen.dart';
import 'home_screen/profile.dart';

class Main_Screen extends StatefulWidget {
  const Main_Screen({Key? key}) : super(key: key);

  @override
  State<Main_Screen> createState() => _Main_ScreenState();
}

class _Main_ScreenState extends State<Main_Screen> {
  int _selectedIndex = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  static const List<Widget> _widgetOptions = <Widget>[
    Home_Screen(),
    Location_Screen(),
    Booking_Screen(),
    Favourite_Screen(),
    Profile_Screen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 60.0,
          backgroundColor: Colors.blueGrey,
          items: <Widget>[
            Icon(
              Icons.home_outlined,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.location_on_outlined,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.calendar_today_outlined,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.favorite_border,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.account_circle_outlined,
              size: 30,
              color: Colors.white,
            ),
          ],
          color: Color(0xFF273A48),
          buttonBackgroundColor: Colors.cyan,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: _onItemTapped,
          letIndexChange: (index) => true,
        ),
      ),
    );
  }
}
