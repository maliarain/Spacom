// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:spacom/screens/home_screen/detials_order.dart';
import 'package:spacom/screens/home_screen/home_screen.dart';
import 'package:spacom/utils/nm_box.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

double transLimit = 1250;

class _MyWidgetState extends State<MyWidget> {
  void _showdilog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Order Status"),
            content: Text("Order Placed in Barbar Shop"),
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Back to Home"),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment"),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CreditCard(),
            NMCard(
              active: false,
              icon: Icons.cut_outlined,
              label: 'Hair Cut',
            ),
            NMCard(
              active: true,
              icon: Icons.airline_seat_recline_extra,
              label: 'Massage',
            ),
            NMCard(
              active: true,
              icon: Icons.face_outlined,
              label: 'Beard Trimming',
            ),
            // TransactionSlider(),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _showdilog,
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueAccent)),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Place an Order in ( PKR 500 )',
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TransactionSlider extends StatefulWidget {
  @override
  _TransactionSliderState createState() => _TransactionSliderState();
}

class _TransactionSliderState extends State<TransactionSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Transaction Limit',
              style: TextStyle(
                  color: fCD, fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Text(
              'PKR ' + transLimit.toStringAsFixed(0),
              style: TextStyle(
                  color: fCD, fontSize: 16, fontWeight: FontWeight.w700),
            )
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.green.shade300,
            inactiveTrackColor: fCL.withOpacity(0.25),
            trackHeight: 5,
            thumbColor: mCL,
            overlayColor: mCL.withOpacity(0.75),
          ),
          child: Slider(
            value: transLimit,
            min: 1,
            max: 3000,
            onChanged: (limitInput) {
              setState(() {
                transLimit = limitInput;
              });
            },
          ),
        )
      ],
    );
  }
}

class CreditCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: nMbox,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('VISA',
                  style: TextStyle(
                      color: fCD, fontSize: 18, fontWeight: FontWeight.w700)),
              Icon(
                Icons.more_horiz,
                color: fCD,
              ),
            ],
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('* * * *',
                  style: TextStyle(
                      color: fCD, fontSize: 18, fontWeight: FontWeight.w700)),
              Text('* * * *',
                  style: TextStyle(
                      color: fCD, fontSize: 18, fontWeight: FontWeight.w700)),
              Text('* * * *',
                  style: TextStyle(
                      color: fCD, fontSize: 18, fontWeight: FontWeight.w700)),
              Text('8014',
                  style: TextStyle(
                      color: fCD, fontSize: 18, fontWeight: FontWeight.w700)),
            ],
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Card Holder',
                      style: TextStyle(
                          color: fCL,
                          fontSize: 12,
                          fontWeight: FontWeight.w700)),
                  Text('Muhammad Ali',
                      style: TextStyle(
                          color: fCD,
                          fontSize: 18,
                          fontWeight: FontWeight.w700)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Expires',
                      style: TextStyle(
                          color: fCL,
                          fontSize: 12,
                          fontWeight: FontWeight.w700)),
                  Text('08 / 21',
                      style: TextStyle(
                          color: fCD,
                          fontSize: 18,
                          fontWeight: FontWeight.w700)),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class NMButton extends StatelessWidget {
  final bool down;
  final IconData icon;
  const NMButton({required this.down, required this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: down ? nMboxInvert : nMbox,
      child: Icon(
        icon,
        color: down ? fCD : fCL,
      ),
    );
  }
}

class NMCard extends StatelessWidget {
  final bool active;
  final IconData icon;
  final String label;
  const NMCard({required this.active, required this.icon, required this.label});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
      decoration: nMbox,
      child: Row(
        children: <Widget>[
          Icon(icon, color: fCL),
          SizedBox(width: 15),
          Text(
            label,
            style: TextStyle(
                color: fCD, fontWeight: FontWeight.w700, fontSize: 16),
          ),
          Spacer(),
          Container(
            decoration: active ? nMboxInvertActive : nMboxInvert,
            width: 70,
            height: 40,
            child: Container(
              margin: active
                  ? EdgeInsets.fromLTRB(35, 5, 5, 5)
                  : EdgeInsets.fromLTRB(5, 5, 35, 5),
              decoration: nMbtn,
            ),
          ),
        ],
      ),
    );
  }
}
