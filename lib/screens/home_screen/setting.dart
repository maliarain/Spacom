import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool valueofBtn = true;
  bool _switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Common",
                  style: TextStyle(color: Colors.blueAccent, fontSize: 20),
                ),
              ),
              switch_thing("Enable custom theme", Icons.format_paint),
              switch_thing("Notifications", Icons.ring_volume),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Auto",
                  style: TextStyle(color: Colors.blueAccent, fontSize: 20),
                ),
              ),

              switch_thing("Auto Payment", Icons.payment),
              switch_thing("Auto Navigation", Icons.map),
              switch_thing("Recommendation", Icons.recommend),

              // SettingsList(
              //   sections: [
              //     SettingsSection(
              //       title: Text('Common'),
              //       tiles: <SettingsTile>[
              //         // SettingsTile.navigation(
              //         //   leading: Icon(Icons.language),
              //         //   title: Text('Language'),
              //         //   value: Text('English'),
              //         // ),
              //         SettingsTile.switchTile(
              //           onToggle: (value) {},
              //           initialValue: true,

              //           leading: Icon(Icons.format_paint),
              //           title: Text('Enable custom theme'),
              //         ),
              //         SettingsTile.switchTile(
              //           onToggle: (value) {},
              //           initialValue: false,
              //           leading: Icon(Icons.ring_volume),
              //           title: Text('Notifications'),
              //         ),
              //       ],
              //     ),
              //     SettingsSection(
              //       title: Text("Auto"),
              //       tiles: <SettingsTile>[
              //         SettingsTile.switchTile(
              //           onToggle: (value) {},
              //           initialValue: true,
              //           leading: Icon(Icons.payment),
              //           title: Text('Auto Payment'),
              //         ),
              //         SettingsTile.switchTile(
              //           onToggle: (value) {},
              //           initialValue: false,
              //           leading: Icon(Icons.map),
              //           title: Text('Auto Navigation'),
              //         ),
              //         SettingsTile.switchTile(
              //           onToggle: (value) {},
              //           initialValue: true,
              //           leading: Icon(Icons.recommend),
              //           title: Text('Recommendation'),
              //         ),
              //       ],
              //     )
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }

  switch_thing(String title, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              icon,
              size: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 25),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: CupertinoSwitch(
            value: _switchValue,
            onChanged: (value) {
              setState(() {
                _switchValue = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
