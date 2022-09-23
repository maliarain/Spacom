import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:spacom/screens/home_screen/setting.dart';
import 'package:spacom/user/auth_screen.dart';
import 'package:spacom/utils/Things_We_Want.dart';
import 'package:spacom/utils/google_sign_in.dart';

class Profile_Screen extends StatefulWidget {
  const Profile_Screen({Key? key}) : super(key: key);

  @override
  State<Profile_Screen> createState() => _Profile_ScreenState();
}

class _Profile_ScreenState extends State<Profile_Screen> {
  bool isGoogle = false;
  bool isFacebk = false;
  bool fireUser = false;

  final user = FirebaseAuth.instance.currentUser!;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  get firebase_user => _auth.currentUser;

  final FacebookAuth fbauth = FacebookAuth.instance;
  get fbuser => fbauth;

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
                  backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkgxcV04dhrO3ubYUg5U9g8DIzbiqLHwsHfQ&usqp=CAU"),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(15),
                  child:
                      // Text(
                      Text(
                    "Email: ",
                    style: TextStyle(
                        color: Color(0xFF273A48),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                  // style: TextStyle(
                  //     color: Color(0xFF273A48),
                  //     fontSize: 20,
                  //     fontWeight: FontWeight.bold),

                  // "Email : arainama@gmail.com",
                  //   style: TextStyle(
                  //       color: Color(0xFF273A48),
                  //       fontSize: 20,
                  //       fontWeight: FontWeight.bold),
                  // ),
                  ),
              // App_Things.getProfileButtions(
              //     Icons.privacy_tip_outlined, "Privacy"),
              // App_Things.getProfileButtions(Icons.history, "Purchase History"),
              // App_Things.getProfileButtions(
              //     Icons.help_outline, "Help & Support"),
              // App_Things.getProfileButtions(
              // Icons.settings, "Settings", _clicked),
              // App_Things.getProfileButtions(
              //     Icons.person_add_alt_outlined, "Invite a Friend"),
              // App_Things.getProfileButtions(Icons.logout, "Logout"),
              GestureDetector(
                onTap: () {
                  _showMyDialog(
                      "Privacy Policies",
                      "Read Carefully",
                      "The exact contents of a certain privacy policy will depend upon the applicable law and may need to address requirements across geographical boundaries and legal jurisdictions. Most countries have own legislation and guidelines of who is covered, what information can be collected, and what it can be used for. In general, data protection laws in Europe cover the private sector, as well as the public sector. Their privacy laws apply not only to government operations but also to private enterprises and commercial transactions.",
                      "I am agree");
                },
                child: Card(
                  elevation: 5,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Icon(Icons.privacy_tip_outlined,
                                    color: Colors.blueAccent, size: 40),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text("Privacy",
                                  style: TextStyle(fontSize: 20)),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const SecondRoute()),
                  // );
                  final Email sendEmail = Email(
                    body: 'Your main Problem :',
                    subject: 'Flutter App',
                    recipients: ['myflutter@gmail.com'],
                  );

                  await FlutterEmailSender.send(sendEmail);
                },
                child: Card(
                  elevation: 5,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Icon(Icons.history,
                                    color: Colors.blueAccent, size: 40),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text("Help & Support",
                                  style: TextStyle(fontSize: 20)),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Settings()),
                  );
                },
                child: Card(
                  elevation: 5,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Icon(Icons.settings,
                                    color: Colors.blueAccent, size: 40),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text("Settings",
                                  style: TextStyle(fontSize: 20)),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  await Share.share("Download this amazing app");
                },
                child: Card(
                  elevation: 5,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Icon(Icons.mobile_friendly_sharp,
                                    color: Colors.blueAccent, size: 40),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text("Invite a Friend",
                                  style: TextStyle(fontSize: 20)),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              // GestureDetector(
              //   onTap: () {
              //     final provider =
              //         Provider.of<GoogleSignInProvider>(context, listen: false);
              //     provider.googleLogOut();
              //     Navigator.of(context).push(MaterialPageRoute(
              //         builder: (context) => LoginSignupScreen()));
              //   },
              //   child: Card(
              //     shadowColor: Colors.black,
              //     shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(30)),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Padding(
              //           padding: const EdgeInsets.all(5.0),
              //           child: Row(
              //             children: [
              //               Padding(
              //                 padding: const EdgeInsets.all(5),
              //                 child: Padding(
              //                   padding: const EdgeInsets.only(left: 8.0),
              //                   child: Icon(Icons.logout,
              //                       color: Colors.blueAccent, size: 40),
              //                 ),
              //               ),
              //               Padding(
              //                 padding: const EdgeInsets.only(left: 15),
              //                 child: Text("Logout",
              //                     style: TextStyle(fontSize: 20)),
              //               ),
              //             ],
              //           ),
              //         ),
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Padding(
              //               padding: const EdgeInsets.only(right: 15),
              //               child: Icon(
              //                 Icons.arrow_forward_ios,
              //                 color: Colors.blueAccent,
              //               ),
              //             ),
              //           ],
              //         )
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showMyDialog(
      String title, String msg, String brief, String option) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(msg),
                Text(brief),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(option),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  showEmail() {
    if (_auth != null) {
      return Text(
        "Email: " + user.email!,
        style: TextStyle(
            color: Color(0xFF273A48),
            fontSize: 20,
            fontWeight: FontWeight.bold),
      );
    } else {
      return Text(
        "please Sign In",
        style: TextStyle(
            color: Color(0xFF273A48),
            fontSize: 20,
            fontWeight: FontWeight.bold),
      );
    }
  }

  showImage() {
    if (_auth != null) {
      return SizedBox(
          height: 130,
          width: 130,
          child: CircleAvatar(
              radius: 100, backgroundImage: NetworkImage(user.photoURL!)));
    } else {
      return SizedBox(
        height: 130,
        width: 130,
        child: CircleAvatar(
          radius: 100,
          backgroundImage: NetworkImage(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkgxcV04dhrO3ubYUg5U9g8DIzbiqLHwsHfQ&usqp=CAU"),
        ),
      );
    }
  }
}
