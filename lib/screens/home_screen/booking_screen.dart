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
    return Scaffold(
      appBar: AppBar(title: Text("Book an Appointment"),backgroundColor: Color(0xFF273A48),automaticallyImplyLeading: false,),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(
                  height: 130,
                  width: 130,
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage('assets/images/barbar.jpg'),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Enter Barbar Shop",style: TextStyle(fontSize: 20),),
                    ),
                    App_Things.getInputTextField(Icon(Icons.access_alarm,color: Colors.white,), "txt"),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Enter Description about Appointment",style: TextStyle(fontSize: 20),),
                    ),
                    App_Things.getInputTextField(Icon(Icons.access_alarm,color: Colors.white,), "txt"),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Enter Reason of Appointment",style: TextStyle(fontSize: 20),),
                    ),
                    App_Things.getInputTextField(Icon(Icons.access_alarm,color: Colors.white,), "txt"),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: App_Things.getProfileButtions(Icons.bookmark_added_outlined, "Click for Booking"),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
