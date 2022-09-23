import 'package:flutter/material.dart';
import 'package:spacom/shapes/notification_shape.dart';

class Favourite_Screen extends StatefulWidget {
  const Favourite_Screen({Key? key}) : super(key: key);

  @override
  State<Favourite_Screen> createState() => _Favourite_ScreenState();
}

class _Favourite_ScreenState extends State<Favourite_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Notifications"),
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) {
          return Favourite_Shape();
        },
      ),
    );
  }
}
