import 'package:flutter/material.dart';
import 'package:spacom/utils/Things_We_Want.dart';

class Profile_Screen extends StatefulWidget {
  const Profile_Screen({Key? key}) : super(key: key);

  @override
  State<Profile_Screen> createState() => _Profile_ScreenState();
}

class _Profile_ScreenState extends State<Profile_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
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
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  "Email : adkhan1@gmail.com",
                  style: TextStyle(
                      color: Color(0xFF273A48),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              App_Things.getProfileButtions(
                  Icons.privacy_tip_outlined, "Privacy"),
              App_Things.getProfileButtions(Icons.history, "Purchase History"),
              App_Things.getProfileButtions(
                  Icons.help_outline, "Help & Support"),
              App_Things.getProfileButtions(Icons.settings, "Settings"),
              App_Things.getProfileButtions(
                  Icons.person_add_alt_outlined, "Invite a Friend"),
              App_Things.getProfileButtions(Icons.logout, "Logout"),
            ],
          ),
        ),
      ),
    );
  }
}
