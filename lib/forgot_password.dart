import 'package:flutter/material.dart';
import 'package:login_signup_page/src/fonts.dart';
import 'package:login_signup_page/login_screen.dart';

class ForPassword extends StatelessWidget {
  const ForPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              left: 25,
              right: 25 /*bottom: MediaQuery.of(context).viewInsets.bottom*/),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildDeleteButton(context),
              buildSizedBox(50),
              SizedBox(
                height: 5,
              ),
              Text(
                "Forgot Password?",
                style: const TextStyle(
                  fontSize: 25.5,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF000000),
                  //fontFamily: 'SF UI Display',
                  fontFamily: sfHeavy,
                ),
              ),
              SizedBox(height: 5,),
              Text(
                "Don't worry. It happens to anyone."
                " \nJust enter your iPhone number and "
                "\nwe will send you a new one.",
                style: TextStyle(color: Colors.grey, fontSize: 15,fontWeight: FontWeight.w500,fontFamily: sfSemiBold),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: const Text(
                  "Email",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      fontFamily: sfSemiBold),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(2, 10, 2, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Enter email",
                      hintStyle: TextStyle(
                          fontSize: 15,
                          fontFamily: sfRegular,
                          color: Colors.grey.shade400),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Color(0xFFE5E5EA)),
                      )),
                ),
              ),
              // SizedBox(
              //   height: 350,
              // ),
              Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF007AFF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  minimumSize: const Size(double.maxFinite, 55),
                ),
                onPressed: () {
                  Navigator.pop(
                    context,
                    MaterialPageRoute(builder: (context) =>  LoginPage()),
                  );
                },
                child: const Text(

                  "Send",
                  style: TextStyle(fontSize: 22,
                      fontFamily: sfHeavy,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFFFFFFF)),
                ),
              ),
              Container(height: 15,),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox buildSizedBox(int height) {
    return SizedBox(

            );
  }

  GestureDetector buildDeleteButton(BuildContext context) {
    return GestureDetector(
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 0.0, top: 20),
                  child: SizedBox(
                    child: Image.asset('images/delete.png'),
                    height: 20,
                  ),
                ),
              ),
              onTap: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(builder: (context) =>  LoginPage()),
                );
              },
            );
  }
}
