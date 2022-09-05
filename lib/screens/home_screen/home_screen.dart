import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:spacom/screens/home_screen/detials_order.dart';
import 'package:spacom/shapes/home_shape.dart';
import 'package:spacom/shapes/popular_barbers.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Choose your",
                        style: const TextStyle(fontSize: 20),
                      ),
                      const Text(
                        "Design Course",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset("assets/images/profileicon.png"),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                decoration: new InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  labelText: "Search for Barbar...",
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: const BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: const Text(
                "Massage",
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(15),
            //   child: SizedBox(
            //     width: MediaQuery.of(context).size.width,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Expanded(
            //           child: Padding(
            //             padding: const EdgeInsets.only(top: 15),
            //             child: Container(
            //               alignment: Alignment.center,
            //               width: MediaQuery.of(context).size.width,
            //               height: 50,
            //               decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.all(
            //                   Radius.circular(40),
            //                 ),
            //                 border: Border.all(
            //                   width: 1,
            //                   color: Colors.blueAccent,
            //                   style: BorderStyle.solid,
            //                 ),
            //               ),
            //               child: Column(
            //                 mainAxisAlignment: MainAxisAlignment.center,
            //                 children: [
            //                   Text(
            //                     "Hair Cut",
            //                     style: TextStyle(
            //                         color: Colors.blueAccent,
            //                         fontSize: 15,
            //                         fontWeight: FontWeight.bold),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ),
            //         Expanded(
            //           child: Padding(
            //             padding:
            //                 const EdgeInsets.only(top: 15, left: 5, right: 5),
            //             child: Container(
            //               alignment: Alignment.center,
            //               width: MediaQuery.of(context).size.width,
            //               height: 50,
            //               decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.all(
            //                   Radius.circular(40),
            //                 ),
            //                 border: Border.all(
            //                   width: 1,
            //                   color: Colors.blueAccent,
            //                   style: BorderStyle.solid,
            //                 ),
            //               ),
            //               child: Column(
            //                 mainAxisAlignment: MainAxisAlignment.center,
            //                 children: [
            //                   Text(
            //                     "Face Facial",
            //                     style: TextStyle(
            //                         color: Colors.blueAccent,
            //                         fontSize: 15,
            //                         fontWeight: FontWeight.bold),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ),
            //         Expanded(
            //           child: Padding(
            //             padding: const EdgeInsets.only(top: 15),
            //             child: Container(
            //               alignment: Alignment.center,
            //               width: MediaQuery.of(context).size.width,
            //               height: 50,
            //               decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.all(
            //                   Radius.circular(40),
            //                 ),
            //                 border: Border.all(
            //                   width: 1,
            //                   color: Colors.blueAccent,
            //                   style: BorderStyle.solid,
            //                 ),
            //               ),
            //               child: Column(
            //                 mainAxisAlignment: MainAxisAlignment.center,
            //                 children: [
            //                   Text(
            //                     "Massage",
            //                     style: TextStyle(
            //                         color: Colors.blueAccent,
            //                         fontSize: 15,
            //                         fontWeight: FontWeight.bold),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: double.infinity,
                height: 160,
                child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return const Home_Shape();
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: const Text(
                "Hair Cut",
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: double.infinity,
                height: 160,
                child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return const Home_Shape();
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: const Text(
                "Popular Shops",
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              crossAxisCount: 2,
              children: List.generate(4, (index) {
                return const Popular_Barbar();
              }),
            ),
          ],
        ),
      ),
    );
  }
}
