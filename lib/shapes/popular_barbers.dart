import 'package:flutter/material.dart';

class Popular_Barbar extends StatelessWidget {
  const Popular_Barbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Color(0xfff9fafc), borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Hair Cut Shop",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "24 Lessons",
                    style: TextStyle(fontSize: 15),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          "43",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.blueAccent,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 130,
              width: double.infinity,
              child: Image.asset("assets/images/fluttterbuddy.png"),
            ),
          ]),
        ),
      ),
    );
  }
}
