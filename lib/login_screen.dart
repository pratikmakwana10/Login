import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:login_signup_page/src/fonts.dart';
import 'package:login_signup_page/forgot_password.dart';
import 'package:login_signup_page/home_Screen.dart';
import 'package:login_signup_page/sales_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  //final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController login = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool _isHidden = true;
  bool _isLogin = true;

  googleLogin() async {
    if (kDebugMode) {
      print("google Login method Called");
    }
    GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount? result;
    try {
       result = await googleSignIn.signIn();
      if (result == null) {
        return;
      }

     // final userData = await result.authentication;
     // final credential = GoogleAuthProvider.credential(accessToken: userData.accessToken, idToken: userData.idToken);
     // var finalResult = await FirebaseAuth.instance.signInWithCredential(credential);
   /*   print("Result $result");
      print(result.displayName);
      print(result.email);
      print(result.photoUrl);
      print(finalResult);*/
    } catch (error) {
      //print(error);
    }
    return result;
  }




  Future<void> logout() async {
    await GoogleSignIn().disconnect();
    FirebaseAuth.instance.signOut();
  }

  _passwordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  // final  result = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildCancelButton(),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Text(
                  _isLogin ? "Welcome Back!" : "Welcome",
                  style: const TextStyle(
                    fontSize: 25.5,
                    fontWeight: FontWeight.w600,
                    fontFamily: sfSemiBold,
                    color: Color(0xFF000000),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Text(
                  _isLogin
                      ? "Login to your account"
                      : "Sign Up to your account to start",
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    fontFamily: sfSemiBold,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: Text(
                  "Email",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      fontFamily: sfSemiBold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                child: TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                      hintText: "Enter email",
                      hintStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.grey.shade400,
                          fontFamily: sfRegular),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.blue),
                      )),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                child: Text(
                  "Password",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      fontFamily: sfSemiBold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                child: TextField(
                  controller: password,
                  obscureText: _isHidden ? true : false,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade400,
                        fontFamily: sfRegular),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1.5,
                          color: Color(0xffC7C7CC),
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    suffixIcon: IconButton(
                      onPressed: _passwordView,
                      icon: Icon(
                        _isHidden ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xffC7C7CC), width: 1.5),
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Enter password",
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ForPassword()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 25.0),
                      child: Text(
                        _isLogin ? "Forgot Password?" : " ",
                        style: const TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 15,
                            fontFamily: sfRegular),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 1,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF007AFF),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      // minimumSize: const Size(double.maxFinite, 54),
                    ),
                    onPressed: () {
                      if (email.text.isEmpty || password.text.isEmpty) {
                        SnackBar isEmpty = const SnackBar(
                            content: Text('Both fields are necessary.'));
                        ScaffoldMessenger.of(context).showSnackBar(isEmpty);
                      } else if (email.text.isEmpty ||
                          !RegExp(r'\S+@\S+\.\S+').hasMatch(email.text)) {
                        SnackBar notValid = const SnackBar(
                            content: Text('Please enter valid email.'));
                        ScaffoldMessenger.of(context).showSnackBar(notValid);
                      } else if (password.text.isEmpty ||
                          password.text.length < 6) {
                        SnackBar validPassword = const SnackBar(
                            content: Text(
                                'Password must contains at least 6 character.'));
                        ScaffoldMessenger.of(context)
                            .showSnackBar(validPassword);
                      }
                   /*   print(email);
                      print(password);*/
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: sfHeavy,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 1.5,
                    width: MediaQuery.of(context).size.width / 4,
                    color: const Color(0xFFC4C4C4),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  const Text(
                    "OR",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: sfSemiBold,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFD1D1D6),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Container(
                    height: 1.5,
                    width: MediaQuery.of(context).size.width / 4,
                    color: const Color(0xFFC4C4C4),
                  ),
                ],
              ),
              const SizedBox(
                height: 22,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 2,
                      color: Colors.grey,
                    ),
                  ),
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 1,
                  child: GestureDetector(
                    onTap: () async {
                     var result = await googleLogin();
                      // print(result);
                     // ignore: use_build_context_synchronously
                     await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen(
                                    displayName: result?.displayName,
                                    email: result.email,
                                    photoUrl: result.photoUrl,
                                  )));


                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset(
                          'images/google.png',
                          fit: BoxFit.cover,
                          height: 20,
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        const Text(
                          'Continue with Google',
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: sfSemiBold,
                              color: Colors.blue,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Purchase()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 2,
                        color: Colors.black,
                      ),
                    ),
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset(
                          "images/apple.png",
                          fit: BoxFit.contain,
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        const Text(
                          'Continue with Apple',
                          style: TextStyle(
                              fontSize: 17,
                              color: Color(
                                0xFFFFFFFF,
                              ),
                              fontWeight: FontWeight.w500,
                              fontFamily: sfSemiBold),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Center(
                child: Text(
                  "By using Contact Backup you agree to the",
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFFAEAEB2),
                      fontFamily: sfRegular),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      await launchUrl(
                        Uri.parse("https://www.google.com"),
                        mode: LaunchMode.externalApplication,
                      );
                    },
                    child: const Text(
                      textAlign: TextAlign.right,
                      "Terms of Use",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 13,
                          fontFamily: sfRegular),
                    ),
                  ),
                  const Text(
                    " and ",
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                        fontFamily: sfRegular),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await launchUrl(
                        Uri.parse("https://www.google.com"),
                        mode: LaunchMode.externalApplication,
                      );
                    },
                    child: const Text(
                      "Privacy Policy",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 13,
                          fontFamily: sfRegular),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      textAlign: TextAlign.right,
                      " Don't have an Account? ",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFFC7C7CC),
                          fontFamily: sfRegular),
                    ),
                    GestureDetector(
                      child: Text(
                        _isLogin ? 'Sign Up' : "Login",
                        style: const TextStyle(
                          fontSize: 15,
                          fontFamily: sfRegular,
                          color: Colors.blue,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _isLogin = !_isLogin;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildCancelButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0, top: 25),
      child: Align(
        alignment: Alignment.topRight,
        child: SizedBox(
          height: 20,
          child: Image.asset('images/delete.png'),
        ),
      ),
    );
  }
}
