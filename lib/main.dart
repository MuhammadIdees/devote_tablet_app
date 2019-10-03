import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:devote_app/login_screen.dart';

Future main() async{
  // to keep the horizontal orientation of the tablet
  await SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
  // to remove top and bottom bar
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(new DevoteApp());
}

class DevoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      home: Scaffold(
        backgroundColor: Color(0xFFF7F9FB),
        //body: LoginScreen()
        body: LoginScreen(),
      ),
    );
  }
}
