import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Home')),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              // Other ListTiles...
              ListTile(
                title: const Text('Calendar'),
                onTap: () async {
                  Navigator.of(context).pop();
                  await _launchNativeCalendar();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchNativeCalendar() async {
    const String calendarUrl = 'content://com.android.calendar/time/';
    if (await canLaunch(calendarUrl)) {
      await launch(calendarUrl);
    } else {
      throw 'Could not launch native calendar app';
    }
  }
}
