import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';

abstract class App_Things extends StatelessWidget {
  static Card getProfileButtions(
    IconData icon,
    String txt,
  ) {
    return Card(
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
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
                    child: Icon(icon,color: Colors.blueAccent,size: 40),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(txt,
                      style:
                          TextStyle(fontSize: 20)),
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
    );
  }

  static TextField getInputTextField(
      Icon icon,
      String txt,
      ) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.blueGrey,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: txt,
        hintStyle: TextStyle(color: Colors.white),
        prefixIcon: icon,
      ),
    );
  }

  static Row getTitlesforHomeScreen(
      String txtq,txt2,
      ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(txtq,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        Text(txt2,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
      ],
    );
  }

}

class App_Colors_Here {
  static const Color iconColor = Color(0xFFB6C7D1);
  static const Color activeColor = Color(0xFF09126C);
  static const Color textColor1 = Color(0XFFA7BCC7);
  static const Color textColor2 = Color(0XFF9BB3C0);
  static const Color facebookColor = Color(0xFF3B5999);
  static const Color googleColor = Color(0xFFDE4B39);
  static const Color backgroundColor = Color(0xFFECF3F9);
}
