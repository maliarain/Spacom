import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FaceBook_Authentication {
  Map? _userData;

  Future getFBuser() async {
    final result =
        await FacebookAuth.i.login(permissions: ["public_profile", "email"]);

    if (result.status == LoginStatus.success) {
      final userData = await FacebookAuth.i.getUserData(
        fields: "email,name,id,picture",
      );
      _userData = userData;
    }
  }

  getDataFromFB(String things) {
    _userData?[things];
  }
}
