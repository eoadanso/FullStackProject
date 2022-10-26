import 'package:flutter/material.dart';
import 'package:proper_project/Util/colors.dart';
import 'package:proper_project/responsive/mobile_screen_layout.dart';
import 'package:proper_project/responsive/responsive_layout_screen.dart';
import 'package:proper_project/responsive/web_screen_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor
      ),
      home: const ResponsiveLayout(mobileScreenLayout: MobileScreenLayout() , webScreenLayout: WebScreenLayout(),)
    );
  }
}

