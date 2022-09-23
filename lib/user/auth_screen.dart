import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:spacom/models/user_data.dart';
import 'package:spacom/screens/landing_screen.dart';
import 'package:spacom/utils/email_pass_signin.dart';
import 'package:spacom/utils/facebook_auth.dart';
import 'package:spacom/utils/google_sign_in.dart';
import '../utils/Things_We_Want.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class LoginSignupScreen extends StatefulWidget {
  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  bool isSignupScreen = true;
  bool isMale = true;
  bool isRememberMe = false;

  FirebaseAuth _auth = FirebaseAuth.instance;

  Map? _userData;

  final signun_email_controller = TextEditingController();
  final signun_pass_controller = TextEditingController();
  final signun_username_controller = TextEditingController();
  final signin_email_controller = TextEditingController();
  final signin_pass_controller = TextEditingController();

  PlatformFile? pickedFile;
  late UploadTask uploadTask;
  late String urlDownload, bookCover;
  late HttpClient http;
  late Map userProfile;

  Future uploadFile() async {
    // if (pickedFile == null) {
    //   ScaffoldMessenger.of(context)
    //       .showSnackBar(SnackBar(content: Text("Please Pick a File First..")));
    // } else
    if (signun_email_controller.text.isEmpty ||
        signun_pass_controller.text.isEmpty ||
        signun_username_controller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please Fill All Fields First..")));
    } else {
      // final bookCoverpath = 'UserData/Images/${pickedFile!.name}';
      // final bookCoverfile = File(pickedFile!.path!);
      // final coverref = FirebaseStorage.instance.ref().child(bookCoverpath);
      // uploadTask = coverref.putFile(bookCoverfile);
      // final snapshot = await uploadTask.whenComplete(() {});
      // urlDownload = await snapshot.ref.getDownloadURL();
      // print('downLoad Like: $urlDownload');

      String genderText;
      if (isMale == true) {
        genderText = "Male";
      } else {
        genderText = "Female";
      }

      UserCredential user_data = await _auth.createUserWithEmailAndPassword(
          email: signun_email_controller.text,
          password: signun_pass_controller.text);

      Map<String, dynamic> date = {
        "UserName": signun_username_controller.text,
        "UserEmail": signun_email_controller.text,
        "UserPass": signun_pass_controller.text,
        "UserGender": genderText.toString(),
        "UserID": user_data.user!.uid.toString()

        // "UserImageURL": urlDownload.toString(),
        // "UserImage": bookCover,
      };

      FirebaseFirestore.instance
          .collection("UserData")
          .doc(user_data.user!.uid)
          .set(date);

      setState(() {
        signun_email_controller.clear();
        signun_pass_controller.clear();
        signun_username_controller.clear();
        // pickedFile == null;
      });
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Main_Screen()));
    }
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: App_Colors_Here.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 300,
              child: Container(
                padding: EdgeInsets.only(top: 50, left: 20),
                color: Color(0xFF3b5999).withOpacity(.85),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "Welcome to Spacom",
                        style: TextStyle(
                          fontSize: 25,
                          letterSpacing: 2,
                          color: Colors.yellow[700],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      isSignupScreen
                          ? "Signup to Continue"
                          : "Signin to Continue",
                      style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          // Trick to add the shadow for the submit button
          buildBottomHalfContainer(true),
          //Main Contianer for Login and Signup
          AnimatedPositioned(
            duration: Duration(milliseconds: 700),
            curve: Curves.bounceInOut,
            top: isSignupScreen ? 130 : 130,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 700),
              curve: Curves.bounceInOut,
              height: isSignupScreen ? 370 : 260,
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 5),
                  ]),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "LOGIN",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: !isSignupScreen
                                        ? App_Colors_Here.activeColor
                                        : App_Colors_Here.textColor1),
                              ),
                              if (!isSignupScreen)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Colors.orange,
                                )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = true;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "SIGNUP",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: isSignupScreen
                                        ? App_Colors_Here.activeColor
                                        : App_Colors_Here.textColor1),
                              ),
                              if (isSignupScreen)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Colors.orange,
                                )
                            ],
                          ),
                        )
                      ],
                    ),
                    if (isSignupScreen) buildSignupSection(),
                    if (!isSignupScreen) buildSigninSection()
                  ],
                ),
              ),
            ),
          ),
          // Trick to add the submit button
          buildBottomHalfContainer(false),
          // Bottom buttons
          Positioned(
            top: MediaQuery.of(context).size.height - 100,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 20, left: 20, top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildFacebookTextButton(Icons.facebook_outlined,
                          "Facebook", App_Colors_Here.facebookColor),
                      buildGoogleTextButton(
                        Icons.account_circle_outlined,
                        "Google",
                        App_Colors_Here.googleColor,
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buildSigninSection() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          buildTextField(Icons.mail_outline, "info@demouri.com", false, true,
              signin_email_controller),
          buildTextField(Icons.lock_outline, "**********", true, false,
              signin_pass_controller),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: isRememberMe,
                    activeColor: App_Colors_Here.textColor2,
                    onChanged: (value) {
                      setState(() {
                        isRememberMe = !isRememberMe;
                      });
                    },
                  ),
                  Text("Remember me",
                      style: TextStyle(
                          fontSize: 12, color: App_Colors_Here.textColor1))
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Text("Forgot Password?",
                    style: TextStyle(
                        fontSize: 12, color: App_Colors_Here.textColor1)),
              )
            ],
          )
        ],
      ),
    );
  }

  Container buildSignupSection() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          buildTextField(Icons.account_circle_outlined, "User Name", false,
              false, signun_username_controller),
          buildTextField(Icons.email_outlined, "email", false, true,
              signun_email_controller),
          buildTextField(Icons.lock_outline, "password", true, false,
              signun_pass_controller),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = true;
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        margin: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                            color: isMale
                                ? App_Colors_Here.textColor2
                                : Colors.transparent,
                            border: Border.all(
                                width: 1,
                                color: isMale
                                    ? Colors.transparent
                                    : App_Colors_Here.textColor1),
                            borderRadius: BorderRadius.circular(15)),
                        child: Icon(
                          Icons.account_circle_outlined,
                          color:
                              isMale ? Colors.white : App_Colors_Here.iconColor,
                        ),
                      ),
                      Text(
                        "Male",
                        style: TextStyle(color: App_Colors_Here.textColor1),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = false;
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        margin: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                            color: isMale
                                ? Colors.transparent
                                : App_Colors_Here.textColor2,
                            border: Border.all(
                                width: 1,
                                color: isMale
                                    ? App_Colors_Here.textColor1
                                    : Colors.transparent),
                            borderRadius: BorderRadius.circular(15)),
                        child: Icon(
                          Icons.account_circle_outlined,
                          color:
                              isMale ? App_Colors_Here.iconColor : Colors.white,
                        ),
                      ),
                      Text(
                        "Female",
                        style: TextStyle(color: App_Colors_Here.textColor1),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              _showMyDialog(
                  "Privacy Policies",
                  "Read Carefully",
                  "The exact contents of a certain privacy policy will depend upon the applicable law and may need to address requirements across geographical boundaries and legal jurisdictions. Most countries have own legislation and guidelines of who is covered, what information can be collected, and what it can be used for. In general, data protection laws in Europe cover the private sector, as well as the public sector. Their privacy laws apply not only to government operations but also to private enterprises and commercial transactions.",
                  "I am agree");
            },
            child: Container(
              width: 200,
              margin: EdgeInsets.only(top: 20),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: "By pressing 'Submit' you agree to our ",
                    style: TextStyle(color: App_Colors_Here.textColor2),
                    children: [
                      TextSpan(
                        //recognizer: ,
                        text: "term & conditions",
                        style: TextStyle(color: Colors.orange),
                      ),
                    ]),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(10.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       if (pickedFile == null) ...[
          //         Text(
          //           // overflow: TextOverflow.fade,
          //           // maxLines: 1,
          //           softWrap: true,
          //           "Please Pick a Book Cover ...",
          //           // style: TextStyle(fontSize: 15, color: Colors.white),
          //         ),
          //       ] else if (pickedFile != null) ...[
          //         Text(
          //           // overflow: TextOverflow.fade,
          //           // maxLines: 1,
          //           softWrap: true,
          //           "File: ${pickedFile?.name}",
          //           // style: TextStyle(fontSize: 15, color: Colors.white),
          //         ),
          //       ],
          //       ElevatedButton(
          //           onPressed: () {
          //             selectFile();
          //           },
          //           child: Text("Pick Image"))
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }

  TextButton buildFacebookTextButton(
    IconData icon,
    String title,
    Color backgroundColor,
  ) {
    return TextButton(
      onPressed: () async {
        final result = await FacebookAuth.i
            .login(permissions: ["public_profile", "email"]);

        if (result.status == LoginStatus.success) {
          final userData = await FacebookAuth.i.getUserData(
            fields: "email,name,id,picture",
          );

          setState(() async {
            String fbname, fbemail, fbpicture, fbuid;
            _userData = userData;
            fbname = _userData?["name"];
            fbemail = _userData?["email"];
            fbpicture = _userData?["picture"]["data"]["url"];

            UserCredential user_data =
                await _auth.createUserWithEmailAndPassword(
                    email: fbemail, password: "randompass");

            Map<String, dynamic> date = {
              "UserName": fbname,
              "UserEmail": fbemail,
              "UserPicture": fbpicture,
            };

            FirebaseFirestore.instance
                .collection("UserData")
                .doc(user_data.user!.uid)
                .set(date);
          });

          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Main_Screen()));
        }
      },

// Google Sign In Method Here.....

      // final provider =
      //     Provider.of<GoogleSignInProvider>(context, listen: false);
      // provider.googleSignin();

//Facebook Sign IN Method Here ......
      // final result = await FacebookAuth.i
      //     .login(permissions: ["public_profile", "email"]);

      // if (result.status == LoginStatus.success) {
      //   final userData = await FacebookAuth.i.getUserData(
      //     fields: "email,name",
      //   );

      //   setState(() {
      //     _userData = userData;
      //   });
      // }

      style: TextButton.styleFrom(
          side: BorderSide(width: 1, color: Colors.grey),
          minimumSize: Size(145, 40),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          primary: Colors.white,
          backgroundColor: backgroundColor),
      child: Row(
        children: [
          Icon(
            icon,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            title,
          )
        ],
      ),
    );
  }

  TextButton buildGoogleTextButton(
    IconData icon,
    String title,
    Color backgroundColor,
  ) {
    return TextButton(
      onPressed: () {
        final provider =
            Provider.of<GoogleSignInProvider>(context, listen: false);
        provider.googleSignin().whenComplete(() async {
          // String? guname, guemail, gupicture;

          // guname = provider.googleSignIn.currentUser!.displayName;
          // guemail = provider.googleSignIn.currentUser!.email;
          // gupicture = provider.googleSignIn.currentUser!.photoUrl;

          // UserCredential user_data = await _auth.createUserWithEmailAndPassword(
          //     email: guemail, password: "randompass");

          // Map<String, dynamic> date = {
          //   "UserName": guname,
          //   "UserEmail": guemail,
          //   "UserPicture": gupicture,
          // };

          // FirebaseFirestore.instance
          //     .collection("UserData")
          //     .doc(user_data.user!.uid)
          //     .set(date);

          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Main_Screen()));
        });
      },

// Google Sign In Method Here.....
      // final provider =
      //     Provider.of<GoogleSignInProvider>(context, listen: false);
      // provider.googleSignin();
//Facebook Sign IN Method Here ......
      // final result = await FacebookAuth.i
      //     .login(permissions: ["public_profile", "email"]);
      // if (result.status == LoginStatus.success) {
      //   final userData = await FacebookAuth.i.getUserData(
      //     fields: "email,name",
      //   );
      //   setState(() {
      //     _userData = userData;
      //   });
      // }

      style: TextButton.styleFrom(
          side: BorderSide(width: 1, color: Colors.grey),
          minimumSize: Size(145, 40),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          primary: Colors.white,
          backgroundColor: backgroundColor),
      child: Row(
        children: [
          Icon(
            icon,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            title,
          )
        ],
      ),
    );
  }

  Widget buildBottomHalfContainer(bool showShadow) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 700),
      curve: Curves.bounceInOut,
      top: isSignupScreen ? 440 : 320,
      right: 0,
      left: 0,
      child: Center(
        child: Container(
          height: 90,
          width: 90,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                if (showShadow)
                  BoxShadow(
                    color: Colors.black.withOpacity(.3),
                    spreadRadius: 1.5,
                    blurRadius: 10,
                  )
              ]),
          child: !showShadow
              ? Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.orangeAccent, Colors.redAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(.3),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 1))
                      ]),
                  child: GestureDetector(
                    onTap: () async {
                      if (isSignupScreen == true) {
                        uploadFile();
                      } else {
                        _auth.signInWithEmailAndPassword(
                            email: signin_email_controller.text,
                            password: signin_pass_controller.text);

                        if (signin_email_controller.text.isNotEmpty ||
                            signin_pass_controller.text.isNotEmpty) {
                          // logging in user with email and password
                          await _auth.signInWithEmailAndPassword(
                            email: signin_email_controller.text,
                            password: signin_pass_controller.text,
                          );
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Main_Screen()));

                          // const snackBar = SnackBar(
                          //   content: Text('Success'),
                          // );
                          // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else {
                          const snackBar = SnackBar(
                            content: Text('Please enter all the fields'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      }

                      //SignUP Method Here

                      // AuthenticationHelper()
                      //     .signUp(
                      //         email: signun_email_controller.text,
                      //         password: signun_pass_controller.text)
                      //     .then((result) {
                      //   if (result == null) {
                      //     Navigator.pushReplacement(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) => Main_Screen()));
                      //   } else {
                      //     Scaffold.of(context).showSnackBar(SnackBar(
                      //       content: Text(
                      //         result,
                      //         style: TextStyle(fontSize: 16),
                      //       ),
                      //     ));
                      //   }
                      // });

                      //Login Method Here

                      // AuthenticationHelper()
                      //     .signIn(
                      //         email: signin_email_controller.text,
                      //         password: signin_pass_controller.text)
                      //     .then((result) {
                      //   if (result == null) {
                      //     Navigator.pushReplacement(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) => Main_Screen()));
                      //   } else {
                      //     Scaffold.of(context).showSnackBar(SnackBar(
                      //       content: Text(
                      //         result,
                      //         style: TextStyle(fontSize: 16),
                      //       ),
                      //     ));
                      //   }
                      // });

                      // Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => Main_Screen()));
                    },
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                )
              : Center(),
        ),
      ),
    );
  }

  Widget buildTextField(IconData icon, String hintText, bool isPassword,
      bool isEmail, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: App_Colors_Here.iconColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: App_Colors_Here.textColor1),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: App_Colors_Here.textColor1),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          contentPadding: EdgeInsets.all(10),
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14, color: App_Colors_Here.textColor1),
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
}

// facebookSignIn() async {
// //Facebook Sign IN Method Here .......................
//   final result =
//       await FacebookAuth.i.login(permissions: ["public_profile", "email"]);
//   if (result.status == LoginStatus.success) {
//     final userData = await FacebookAuth.i.getUserData(
//       fields: "email,name",
//     );
//     // _userData = userData;
//   }
// }
// mygoogleSignIn(BuildContext context) {
//   // Google Sign In Method Here....
//   final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
//   provider.googleSignin();
// }
