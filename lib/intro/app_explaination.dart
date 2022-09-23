import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:spacom/screens/landing_screen.dart';
import 'package:spacom/user/auth_screen.dart';

class App_Explaination extends StatelessWidget {
  const App_Explaination({Key? key}) : super(key: key);

  List<PageViewModel> getPages() {
    return [
      PageViewModel(
          title: 'Hair Cut',
          body: 'We are open for Hair Cut and Stylish Face',
          image: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset("assets/images/barbar.jpg"),
          )),
      PageViewModel(
          title: 'Get free Tips',
          body: 'Get a free tips and advice from specialist',
          image: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset("assets/images/spalogo.jpg"))),
      PageViewModel(
          title: 'Want a Peacful Spa',
          body: 'multiple option available in SPA around your location',
          image: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset("assets/images/spaadvice.jpg"))),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        back: const Text("Back", style: TextStyle(color: Color(0xFF3B5999))),
        next: const Text("Next", style: TextStyle(color: Colors.orangeAccent)),
        done: const Text("Go to Home",
            style: TextStyle(color: Colors.orangeAccent)),
        dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            color: Colors.black26,
            activeColor: Colors.orangeAccent,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0))),
        onDone: () {
          if (FirebaseAuth.instance.currentUser != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Main_Screen()),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginSignupScreen()),
            );
          }
        },
        showBackButton: true,
        pages: getPages(),
      ),
    );
  }
}
