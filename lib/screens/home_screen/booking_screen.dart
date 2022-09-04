import 'package:flutter/material.dart';
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
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            bottom: TabBar(
                unselectedLabelColor: Colors.blueAccent,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.blueAccent),
                tabs: [
                  Tab(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border:
                              Border.all(color: Colors.blueAccent, width: 1)),
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
                          border:
                              Border.all(color: Colors.blueAccent, width: 1)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Recent"),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border:
                              Border.all(color: Colors.blueAccent, width: 1)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Completed"),
                      ),
                    ),
                  ),
                ]),
          ),
          body: TabBarView(children: [
            Icon(Icons.apps),
            Icon(Icons.movie),
            Icon(Icons.games),
          ]),
        ));
  }
}
