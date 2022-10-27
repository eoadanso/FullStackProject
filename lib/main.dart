import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:proper_project/Util/colors.dart';
import 'package:proper_project/responsive/mobile_screen_layout.dart';
import 'package:proper_project/responsive/responsive_layout_screen.dart';
import 'package:proper_project/responsive/web_screen_layout.dart';
import 'package:proper_project/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBMg-CZUfDuUs3OOyPtRaXFj6i5mXm1pLI",
          appId: "1:568989070936:web:9c3766f3f478cc92487c2d",
          messagingSenderId: "568989070936",
          projectId: "fullstackproject-7013b",
          storageBucket: "fullstackproject-7013b.appspot.com",
      )
    ) ;
  }
  else{
    await Firebase.initializeApp() ;
  }
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
      // home: const ResponsiveLayout(mobileScreenLayout: MobileScreenLayout() , webScreenLayout: WebScreenLayout(),)
      home: LoginScreen(),
    );
  }
}

