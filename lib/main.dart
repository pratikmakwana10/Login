import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_signup_page/home_Screen.dart';
import 'package:login_signup_page/login_screen.dart';
import 'package:login_signup_page/sales_page.dart';
import 'package:login_signup_page/setting.dart';
import 'package:login_signup_page/src/shared_prefs.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SharedPreferencesUtils.getInstance().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      fontFamily: 'displayFont',
       primaryColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
      home:  LoginPage(),
    );
  }
}




