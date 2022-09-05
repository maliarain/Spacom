import 'package:flutter/material.dart';
import 'package:spacom/utils/Things_We_Want.dart';

class Booked_Shape extends StatefulWidget {
  const Booked_Shape({Key? key}) : super(key: key);

  @override
  State<Booked_Shape> createState() => _Booked_ShapeState();
}

class _Booked_ShapeState extends State<Booked_Shape> {
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
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [Text("Pending"), Text("2 Days Left")],
            ),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.redAccent),
                ),
                onPressed: () {},
                child: Text("Cancel"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
