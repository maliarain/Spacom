import 'package:flutter/material.dart';

class Completed_Shape extends StatefulWidget {
  const Completed_Shape({Key? key}) : super(key: key);

  @override
  State<Completed_Shape> createState() => _Completed_ShapeState();
}

class _Completed_ShapeState extends State<Completed_Shape> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          SizedBox(
            height: 120,
            width: 120,
            child: CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/images/barbar.jpg'),
            ),
          ),
          Text(
            "Barbar Name",
            style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "Completed",
            style: TextStyle(
                color: Colors.redAccent,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
