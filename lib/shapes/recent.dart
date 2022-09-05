import 'package:flutter/material.dart';

class Recent_Shape extends StatefulWidget {
  const Recent_Shape({Key? key}) : super(key: key);

  @override
  State<Recent_Shape> createState() => _Recent_ShapeState();
}

class _Recent_ShapeState extends State<Recent_Shape> {
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
