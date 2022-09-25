// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:spacom/screens/home_screen/detials_order.dart';

class Chat_Shape extends StatefulWidget {
  const Chat_Shape({Key? key}) : super(key: key);

  @override
  State<Chat_Shape> createState() => _Chat_ShapeState();
}

class _Chat_ShapeState extends State<Chat_Shape> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Detials_Order()));
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Container(
            width: 70,
            child: Row(
              children: [
                SizedBox(
                  height: 80,
                  width: 80,
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage('assets/images/barbar.jpg'),
                  ),
                ),
                Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            "Notification",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            "Barbar work experience and things here we are for describe",
                            style: TextStyle(fontSize: 15),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
