// ignore_for_file: prefer_const_constructors, camel_case_types

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
      backgroundColor: Colors.white,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            floating: true,
            snap: true,
            automaticallyImplyLeading: false,
            title: Text("Notifications"),
          )
        ],
        body: ListView.builder(
          itemCount: 15,
          itemBuilder: (context, index) {
            return Favourite_Shape();
          },
        ),
      ),
    );
  }
}
