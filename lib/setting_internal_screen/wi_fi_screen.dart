import 'dart:io';

import 'package:flutter/material.dart';
import 'package:login_signup_page/src/fonts.dart';
import 'package:login_signup_page/src/decoration.dart';
import 'package:login_signup_page/src/shared_prefs.dart';
import 'package:login_signup_page/src/single_Switch.dart';
import '../feature_model.dart';

class WiFi extends StatefulWidget {
  const WiFi({Key? key}) : super(key: key);

  @override
  State<WiFi> createState() => _WiFiState();
}

class _WiFiState extends State<WiFi> {
  List<Network> availableNetwork = [
    Network(
      "Jack's",
    ),
    Network(
      "Jenny's iphone",
    ),
    Network(
      "Parth's iPhone",
    ),
    Network(
      "Mohammed's ",
    ),
    Network(
      "free wi-fi",
    ),
  ];
  bool value = false;
  String bnm = "Not Connected";
  String selectedNetwork = "";
  @override
  void initState() {
    selectedNetwork = SharedPreferencesUtils.getInstance().getString(wifiName)?? "";
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
        title: Row(
          children: [
            settingButton(context),
            buildSizedBox60(),
            textWifi(),
             const Spacer(),
            buttonEdit()
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10),
        child: Column(
          children: [
            buildSizedBox(context),
            wifiSwitch(),
            buildSizedBox(context),
            airdropText(),
            buildSizedBox50(),
            buildSizedBox(context),
            availableWiFI(context),
          ],
        ),
      ),
    );
  }

  TextButton buttonEdit() {
    return TextButton(
              onPressed: () {},
              child: const Text(
                "Edit",
                style: TextStyle(fontSize: 17),
              ));
  }

  Text textWifi() {
    return const Text(
            "Wi-Fi",
            style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          );
  }

  SizedBox buildSizedBox60() {
    return const SizedBox(
            width: 60,
          );
  }

  TextButton settingButton(BuildContext context) {
    return TextButton(
            child: const Text(
              'Settings',
              style: TextStyle(fontSize: 17),
            ),
            onPressed: () {
                Navigator.pop(context);
                print(context);
              /*if (SharedPreferencesUtils.getInstance()
                      .getBool(getWifiStatus) ??
                  false) {
                Navigator.pop(
                    context,
                    SharedPreferencesUtils.getInstance()
                            .getString(wifiName) ??
                        bnm);

              } else {
                SharedPreferencesUtils.getInstance().removeString(wifiName);
                Navigator.pop(context,bnm );
              }*/
            },
          );
  }

  Container availableWiFI(BuildContext context) {
    return Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: Colors.grey.shade900,
            ),
            child:
                SharedPreferencesUtils.getInstance().getBool(getWifiStatus) ==
                        true
                    ? Column(
                        children: availableNetwork
                            .map((e) => buildNetworkContainer(context, e))
                            .toList(),
                      )
                    : Container(),
          );
  }

  SizedBox buildSizedBox50() {
    return const SizedBox(
            width: 50,
          );
  }

  Padding airdropText() {
    return Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Container(
              child:   SharedPreferencesUtils.getInstance().getBool(getWifiStatus) ==
                  false

                  ? Text(
                      "AirDrop, AirPlay, Notify When Left Behind and improved location accuracy require Wi-Fi.",
                      style: TextStyle(color: Colors.grey.shade400),
                    )
                  : Container(
                      margin: const EdgeInsets.only(top: 30, bottom: 5),
                      alignment: Alignment.topLeft,
                      child: const Text(
                        "DEVICES",
                        style: TextStyle(color: Colors.grey, fontSize: 17),
                      ),
                    ),
            ),
          );
  }

  SizedBox buildSizedBox(BuildContext context) {
    return const SizedBox(
            height: 10,
          );
  }

  Container wifiSwitch() {
    return Container(
             padding: const EdgeInsets.only(left: 10),
            decoration: AppConstants.containerBoxDecoration,
            child: SingleSwitch(
              text: "Wi-Fi",
              onChangeWifiState: (isWifiOn) {
                value = isWifiOn;
                SharedPreferencesUtils.getInstance()
                    .set(getWifiStatus, isWifiOn);
                //print(SharedPreferencesUtils.getInstance().getString(wifiName));
                if(!isWifiOn){
                  SharedPreferencesUtils.getInstance().removeString(wifiName);
                }
                setState(() {});
              },
              isOn: SharedPreferencesUtils.getInstance()
                      .getBool(getWifiStatus) ??
                  false,
              getStringvalue:
                  SharedPreferencesUtils.getInstance().getString(wifiName) ??
                      "",
            ),
          );
  }

  Widget buildNetworkContainer(BuildContext context, Network e) {
    return InkWell(
      onTap: () {
        SharedPreferencesUtils.getInstance().set(wifiName, e.text);
        selectedNetwork = e.text;
        Navigator.pop(context, e.text);
      },
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 5),
            height: MediaQuery.of(context).size.height / 18,
            child: Row(
              children: [

                Container(
                    child: e.text == selectedNetwork
                        ? const Icon(
                            Icons.check,
                            color: Colors.blue,
                            size: 20,
                          )
                        : const SizedBox(
                            width: 20,
                          ))
                ,   const SizedBox(width: 5,),
                /* SizedBox(
                  width: 5,
                ),*/
                Text(
                  e.text,
                  style: TextStyle(
                      fontSize: 20,
                      color: e.text == selectedNetwork
                          ? Colors.blue
                          : Colors.grey.shade100),
                ),
                const Spacer(),
                const Icon(
                  Icons.lock,
                  size: 20,
                  color: Colors.grey,
                ),
                const SizedBox(
                  width: 5,
                ),
                const Icon(
                  Icons.wifi,
                  size: 20,
                  color: Colors.grey,
                ),
                const SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.info_outline_rounded,
                  color: Colors.blue.shade800,
                  size: 30,
                ),
                const SizedBox(
                  width: 5,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: e == availableNetwork[availableNetwork.length - 1]
                ? const SizedBox()
                : Divider(color: Colors.grey.shade700, height: 1.5),
          ),
        ],
      ),
    );
  }
}
