import 'package:flutter/material.dart';
import 'package:spacom/screens/home_screen/detials_order.dart';

class Popular_Barbar extends StatelessWidget {
  const Popular_Barbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Detials_Order()));
        },
        child: Container(
          height: 80,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Color(0xfff9fafc),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
                          "14 Styles",
                          style: TextStyle(fontSize: 15),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: Text(
                                "4.3",
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
                    width: 120,
                    height: 120,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/barbar.jpg'),
                      radius: 100,
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
