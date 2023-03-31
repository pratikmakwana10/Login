import 'dart:io';

import 'package:flutter/material.dart';
import 'package:login_signup_page/src/fonts.dart';
import 'package:login_signup_page/src/shared_prefs.dart';
import '../src/decoration.dart';
import '../src/single_Switch.dart';

class MobileData extends StatefulWidget {
  const MobileData({Key? key}) : super(key: key);


  @override
  State<MobileData> createState() => _MobileDataState();
}

class _MobileDataState extends State<MobileData> {
  bool valueM = false;
  @override
  void initState() {
    valueM = SharedPreferencesUtils.getInstance().getBool(isMobileDataOn)?? false;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.blue,
        ),
        backgroundColor: Colors.black,
        automaticallyImplyLeading: true,
        leadingWidth: Platform.isIOS ? 0 : 7,
        centerTitle: true,
        title: Row(
          children: [
            settings(context),
            buildSizedBox20(),
            textMobileData(),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0,right: 10),
        child: Column(
          children: [
            buildSizedBox(context),
            mobileDataSwitch(),
            buildSizedBox(context),
            textMobileDataRestrict(),
          ],
        ),
      ),
    );
  }

  Text textMobileData() {
    return const Text(
            "Mobile Data",
            style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          );
  }

  SizedBox buildSizedBox20() {
    return const SizedBox(
            width: 35,
          );
  }

  TextButton settings(BuildContext context) {
    return TextButton(
            child: const Text(
              'Settings',
              style: TextStyle(fontSize: 17),
            ),
            onPressed: () {
              if (SharedPreferencesUtils.getInstance()
                  .getBool(isMobileDataOn) ??
                  false) {
              }
              Navigator.pop(context, isMobileDataOn);
            },
          );
  }

  Container textMobileDataRestrict() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.only(left: 5,),
      // color: Colors.brown,
      child: Text(
                "Turn off mobile data to restrict all data to Wi-Fi,"
                "\n including email, web browsing and push notifications.",
                style: TextStyle(
                  color: Colors.grey.shade400,
                )),
    );
  }

  SizedBox buildSizedBox(BuildContext context) {
    return const SizedBox(
            height: 10,
          );
  }

  Container mobileDataSwitch() {
    return Container(
            //padding: EdgeInsets.only(left: 10,right: 10),
            decoration: AppConstants.containerBoxDecoration,
            child: Column(
              children: [
                SingleSwitch(
                  getStringvalue: '' ,
                    text: "Mobile Data",
                    onChangeWifiState: (isWifiOn) {
                      valueM = isWifiOn;
                      SharedPreferencesUtils.getInstance().set(isMobileDataOn, isWifiOn);
                      setState(() {});
                    }, isOn: SharedPreferencesUtils.getInstance().getBool(isMobileDataOn)?? false,
                ),
              ]
            ),
          );
  }

}
