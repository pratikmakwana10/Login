import 'dart:io';

import 'package:flutter/material.dart';
import 'package:login_signup_page/src/fonts.dart';
import 'package:login_signup_page/src/decoration.dart';
import 'package:login_signup_page/src/shared_prefs.dart';

import '../feature_model.dart';
import '../src/single_Switch.dart';


class Bluetooth extends StatefulWidget {
  const Bluetooth({Key? key}) : super(key: key);

  @override
  State<Bluetooth> createState() => _BluetoothState();
}

class _BluetoothState extends State<Bluetooth> {
  List<NetworkB> availableBluetoothNetwork = [
    NetworkB("Air-dopes 173"),
    NetworkB("Color-fit Pro"),
    NetworkB("Laptop's"),
    NetworkB("jack's bluetooth"),
  ];
  bool valueB = false;
  String ins = "Not Connected";
  String selectedBluetooth = "";
  @override
  void initState() {
    selectedBluetooth =
        SharedPreferencesUtils.getInstance().getString(btName) ?? "";
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
        leadingWidth:  Platform.isIOS ? 0 : 7,
        title: Row(
          children: [
            textButton(context),
            buildSizedBox50(),
            textBluetooth(),
          ],
        ),
      ),
      body: Column(
        children: [
          buildSizedBox(context),
          bluetoothSwitch(),
          connectionOffText(),
          myDevice(),
          buildSizedBox(context),
          availableBluetooth(context)
        ],
      ),
    );
  }

  Text textBluetooth() {
    return const Text(
            getBTStatus,
            style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          );
  }

  SizedBox buildSizedBox50() {
    return const SizedBox(
            width: 50,
          );
  }

  TextButton textButton(BuildContext context) {
    return TextButton(
              child: const Text(
                'Settings',
                style: TextStyle(fontSize: 17),
              ),
              onPressed: () {
                Navigator.pop(context);
              });
  }

  Container availableBluetooth(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: SharedPreferencesUtils.getInstance().getBool(getBTStatus) == true
          ? Column(
              children: availableBluetoothNetwork
                  .map((e) => buildBluetoothDevice(context, e))
                  .toList(),
            )
          : const SizedBox.shrink(),
    );
  }

  SizedBox buildSizedBox(BuildContext context) => const SizedBox(
        height: 10,
      );

  Container myDevice() {
    return Container(
        alignment: Alignment.centerLeft,
        child: SharedPreferencesUtils.getInstance().getBool(getBTStatus) == true
            ? Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  "MY DEVICES",
                  style: TextStyle(fontSize: 15, color: Colors.grey.shade400),
                ),
              )
            : const SizedBox());
  }

  Padding connectionOffText() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SharedPreferencesUtils.getInstance().getBool(getBTStatus) == false
          ? Text(
          "New Bluetooth connections have been turned off from Control Centre.",
          style: TextStyle(fontSize: 15, color: Colors.grey.shade400),
            )
          : const SizedBox(height: 30,),
    );
  }

  Container bluetoothSwitch() {
    return Container(
      decoration: AppConstants.containerBoxDecoration,
      child: SingleSwitch(
        text: "Bluetooth",
        onChangeWifiState: (isWifiOn) {
          valueB = isWifiOn;
          SharedPreferencesUtils.getInstance().set(getBTStatus, isWifiOn);
          if (!isWifiOn) {
            SharedPreferencesUtils.getInstance().removeString(btName);
          }
          //print(SharedPreferencesUtils.getInstance().getString(getBTStatus));
          setState(() {});
        },
        isOn:
            SharedPreferencesUtils.getInstance().getBool(getBTStatus) ?? false,
        getStringvalue:
            SharedPreferencesUtils.getInstance().getString(btName) ?? "",
      ),
    );
  }

  Widget buildBluetoothDevice(BuildContext context, NetworkB e) {
    return InkWell(
      onTap: () {
        SharedPreferencesUtils.getInstance().set(btName, e.texttitle);
        selectedBluetooth = e.texttitle;
        Navigator.pop(context, e.texttitle);
      },
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 20,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 5),
                    child: e.texttitle == selectedBluetooth
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
                  e.texttitle,
                  style: TextStyle(
                      fontSize: 15,
                      color: e.texttitle == selectedBluetooth
                          ? Colors.blue
                          : Colors.grey.shade100),
                ),


                const Spacer(),
                Text(
                  "Not Connected",
                  style: TextStyle(fontSize: 15, color: Colors.grey.shade500),
                ),
                const SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: Icon(
                    Icons.info_outline_rounded,
                    color: Colors.blue.shade800,
                    size: 25,
                  ),
                ),

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: e ==
                    availableBluetoothNetwork[
                        availableBluetoothNetwork.length - 1]
                ? const SizedBox()
                : Divider(
                    color: Colors.grey.shade700,
                    height: 1.5,
                    endIndent: 0,
                    indent: 0),
          ),
        ],
      ),
    );
  }
}
