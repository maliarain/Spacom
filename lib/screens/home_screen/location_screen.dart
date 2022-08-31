import 'package:flutter/material.dart';

class Location_Screen extends StatefulWidget {
  const Location_Screen({Key? key}) : super(key: key);

  @override
  State<Location_Screen> createState() => _Location_ScreenState();
}

class _Location_ScreenState extends State<Location_Screen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: FittedBox(
          fit: BoxFit.fill, child: Image.asset("assets/images/pk.png")),
    );
  }
}
