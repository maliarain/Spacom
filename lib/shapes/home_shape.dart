import 'package:flutter/material.dart';

class Home_Shape extends StatefulWidget {
  const Home_Shape({Key? key}) : super(key: key);

  @override
  State<Home_Shape> createState() => _Home_ShapeState();
}

class _Home_ShapeState extends State<Home_Shape> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
          width: 350,
          height: 150,
          child: Stack(
            children: <Widget>[
              Positioned(
                  left: 50,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xfff9fafc),
                        borderRadius: BorderRadius.circular(10)),
                    constraints: BoxConstraints(maxWidth: 300, maxHeight: 150),
                  )),
              Positioned(
                  top: 20,
                  left: -5,
                  child: Container(
                    height: 100,
                    width: 100,
                    child: Image.asset(
                      "assets/images/flutterbudy.png",
                      fit: BoxFit.fill,
                    ),
                  )),
              Positioned(
                  top: 20,
                  left: 100,
                  child: Text(
                    "User Interfeace Design",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
              Positioned(
                  top: 60,
                  left: 100,
                  width: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "24 Lessons",
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        "43",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.blueAccent,
                      )
                    ],
                  )),
              Positioned(
                  top: 100,
                  left: 100,
                  width: 230,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$8.99',
                        style:
                            TextStyle(fontSize: 20, color: Color(0xff00b6f7)),
                      ),
                      Card(
                          color: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ))
                    ],
                  )),
            ],
          )),
    );
  }
}
