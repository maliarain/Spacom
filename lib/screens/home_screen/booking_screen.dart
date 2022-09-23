import 'package:flutter/material.dart';
import 'package:spacom/shapes/booked.dart';
import 'package:spacom/shapes/completed.dart';
import 'package:spacom/shapes/notification_shape.dart';
import 'package:spacom/shapes/recent.dart';
import 'package:spacom/utils/Things_We_Want.dart';

class Booking_Screen extends StatefulWidget {
  const Booking_Screen({Key? key}) : super(key: key);

  @override
  State<Booking_Screen> createState() => _Booking_ScreenState();
}

class _Booking_ScreenState extends State<Booking_Screen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              "Bookings Category",
            ),
            elevation: 0,
            bottom: TabBar(
                unselectedLabelColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Colors.black,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.blue[200]),
                tabs: [
                  Tab(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.black, width: 1)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Booked"),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.black, width: 1)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Completed"),
                      ),
                    ),
                  ),
                ]),
          ),
          body: TabBarView(children: [
            ListView.builder(
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                return const Booked_Shape();
              },
            ),
            ListView.builder(
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                return const Completed_Shape();
              },
            ),
          ]),
        ));
  }
}
