import 'dart:io';
import 'package:flutter/material.dart';
import 'package:login_signup_page/src/decoration.dart';
import 'package:login_signup_page/src/shared_prefs.dart';
import 'package:login_signup_page/src/single_Switch.dart';
import 'package:login_signup_page/src/utils.dart';
import '../src/fonts.dart';

class Hotspot extends StatefulWidget {
  const Hotspot({Key? key}) : super(key: key);

  @override
  State<Hotspot> createState() => _HotspotState();
}

class _HotspotState extends State<Hotspot> {
  bool valueP = false;
  @override
  void initState() {
    valueP =
        SharedPreferencesUtils.getInstance().getBool(isHotspotOn) ?? false;
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
        title: Container(
          padding: EdgeInsets.only(bottom: 1),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              settingButton(context),
              SizedBox(
                width: 28,
              ),
              personalHotspot(context),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            buildSizedBox1(context),
            firstText(),
            buildSizedBox1(context),
            joinSwitchWifi(context),
            buildSizedBox1(context),
            secondText(),
            buildSizedBox1(context),
            buildSizedBox1(context),
            maximizeCompatibility(),
            internetPerformanceText(),
          ],
        ),
      ),
    );
  }

  Widget personalHotspot(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      height: MediaQuery.of(context).size.height / 24,
      child: Center(
        child: const Text(
          "Personal Hotspot",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }

  SizedBox buildSizedBox1(BuildContext context) {
    return SizedBox(
      height: 20,
    );
  }

  TextButton settingButton(BuildContext context) {
    return TextButton(
      child: const Text(
        'Settings',
        style: TextStyle(fontSize: 17),
      ),
      onPressed: () {
        if (SharedPreferencesUtils.getInstance().getBool(isHotspotOn) ??
            false) {

        }
        Navigator.pop(context, isHotspotOn);
        print(isHotspotOn);

      },
    );
  }

  Padding firstText() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Text(
        "Personal Hotspot on your iPhone can provide internet access to other devices signed in to your iCloud account without requiring vou to enter the password.",
        style: TextStyle(color: Colors.grey.shade400),
      ),
    );
  }

  Padding internetPerformanceText() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
      child: Text(
        "Internet performance mav be reduced for devices connected to you're hotspot when turned on.",
        style: TextStyle(color: Colors.grey.shade400),
      ),
    );
  }

  Container maximizeCompatibility() {
    return Container(
        decoration: AppConstants.containerBoxDecoration,
        child: SingleSwitch(
          text: "Maximize Compatibility",
          onChangeWifiState: (value) {},
          isOn: false,
          getStringvalue: '',
        ));
  }

  Padding secondText() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10),
      child: Text(
        "Allow other users or devices not signed in to iCloud to look for your shared network \"Jenny's iPhone\" when you are in Personal Hotspot settings or when you turn it on in Control Centre.",
        style: TextStyle(color: Colors.grey.shade400),
      ),
    );
  }

  Container joinSwitchWifi(BuildContext context) {
    return Container(
      decoration: AppConstants.containerBoxDecoration,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            SingleSwitch(
              text: "Allow Others to Join",
              onChangeWifiState: (isWifiOn) {
                valueP = isWifiOn;
                SharedPreferencesUtils.getInstance().set(isHotspotOn, isWifiOn);
                setState(() {});
              },
              isOn: SharedPreferencesUtils.getInstance().getBool(isHotspotOn) ??
                  false,
              getStringvalue: '',
            ),
            buildLine(context),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text(
                    "Wi-Fi Password",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                  const Spacer(),
                  Text(
                    "12345678",
                    style: TextStyle(color: Colors.grey.shade400, fontSize: 17),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  buildArrowIcon(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
