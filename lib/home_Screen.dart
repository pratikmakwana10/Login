import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_signup_page/setting.dart';

import 'src/fonts.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen(
      {Key? key,
      required this.displayName,
      required this.email,
      required this.photoUrl})
      : super(key: key);
  String displayName;
  String email;
  String photoUrl;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _signOut() async {
    await _auth.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>   Setting()),
              );

            },
          )
        ],
      ),
       //backgroundColor: Colors.blueAccent.shade700,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),

              Container(
                child: Image.network(widget.photoUrl,fit: BoxFit.cover,),
                height: 120,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.cyan),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Text(
                  widget.displayName,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Text(
                  widget.email,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF007AFF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    minimumSize: const Size(double.maxFinite, 55),
                  ),
                  onPressed: () {
                    _signOut();
                    Navigator.pop(context);



                    //NavigateLogin(context);

                  },
                  child: const Text(

                    "Logout",
                    style: TextStyle(fontSize: 22,
                        fontFamily: sfHeavy,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFFFFFFF)),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
