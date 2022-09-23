import 'package:flutter/material.dart';
import 'package:spacom/screens/home_screen/detials_order.dart';

class Favourite_Shape extends StatefulWidget {
  const Favourite_Shape({Key? key}) : super(key: key);

  @override
  State<Favourite_Shape> createState() => _Favourite_ShapeState();
}

class _Favourite_ShapeState extends State<Favourite_Shape> {
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
            borderRadius: BorderRadius.all(Radius.circular(25))),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage('assets/images/barbar.jpg'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Notification",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Barbar work experience and things",
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Column(
                      children: [
                        Icon(
                          Icons.notifications_active_outlined,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
