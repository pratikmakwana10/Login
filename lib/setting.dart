import 'package:flutter/material.dart';
import 'package:login_signup_page/src/fonts.dart';
import 'package:login_signup_page/setting_internal_screen/mobile_data.dart';
import 'package:login_signup_page/setting_internal_screen/personal_Hotspot.dart';
import 'package:login_signup_page/setting_internal_screen/wi_fi_screen.dart';
import 'package:login_signup_page/src/decoration.dart';
import 'package:login_signup_page/src/shared_prefs.dart';
import 'setting_internal_screen/bluetooth_screen.dart';
import 'feature_model.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool _value = false;

  List<FunctionModel> functionList = [
    FunctionModel(
        Icons.airplanemode_active, Colors.orange.shade700, "Airplane Mode"),
    FunctionModel(Icons.wifi, Colors.blueAccent.shade700, "Wi-Fi"),
    FunctionModel(Icons.bluetooth, Colors.blueAccent.shade700, "Bluetooth"),
    FunctionModel(Icons.cell_tower, const Color(0xFF4BB055), "Mobile Data"),
    FunctionModel(
        Icons.animation_sharp, const Color(0xFF4BB055), "Personal Hotspot")
  ];

  List<FunctionModel> functionList1 = [
    FunctionModel(Icons.notifications, Colors.red.shade700, "Notifications"),
    FunctionModel(Icons.volume_up, Colors.pinkAccent, "Sounds & Haptics"),
    FunctionModel(Icons.nights_stay, Colors.deepPurple, "Focus"),
    FunctionModel(Icons.cell_tower, Colors.deepPurpleAccent, "Screen Time"),
  ];

  String wifiNetworkName = "Not Connected";
  String bluetoothName = "Not Connected";
  bool mobileData = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              settingsText(),
              sizedBox10(10),
              searchBar(),
              sizedBox10(15),
              userInformation(context),
              sizedBox10(30),
              containerSoftwareUpdate(context),
              sizedBox10(30),
              functionsList(),
              sizedBox10(30),
              functionList2(),
              sizedBox10(30),

              Container(
                height: 50,width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.blueGrey
                ),
                child: Center(child: Text("context",style: TextStyle(color: Colors.white,fontSize: 15),)),
              )
            ],
          ),
        ),
      ),
    );
  }

  SizedBox sizedBox20() {
    return const SizedBox(
      height: 20,
    );
  }

  Padding settingsText() {
    return const Padding(
      padding: EdgeInsets.only(left: 10.0),
      child: Text(
        "Settings",
        style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.w700, color: Colors.white),
      ),
    );
  }

  SizedBox sizedBox10(double height) {
    return SizedBox(
      height: height,
    );
  }

  Widget searchBar() {
    return SizedBox(
      height: 40,
      child: TextField(
        decoration: InputDecoration(
          prefixIconConstraints: const BoxConstraints(maxWidth: 50),
          contentPadding: const EdgeInsets.only(left: 00),
          fillColor: Colors.grey.shade900,
          filled: true,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Icon(Icons.search, color: Colors.grey.shade500),
          ),
          hintText: "Search",
          hintStyle: TextStyle(
            fontSize: 18.0,
            color: Colors.grey.shade500,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  SizedBox sizedBox100() {
    return const SizedBox(height: 100);
  }

  Container userInformation(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 8.0, left: 12),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_5TBMbrhkDG_zX8U7z6rw31JfQ6QAHA952A&usqp=CAU',
                  ),
                  radius: 30,
                  // backgroundColor: Colors.brown,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "jack's",
                    style: TextStyle(
                        fontSize: 24,
                        //fontFamily: sfHeavy,
                        color: Color(0xFFEFEFEF)),
                  ),
                  Text(
                    "Apple ID, iCloud, Media & Purchases",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: buildArrowIcon(),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              color: Colors.grey.shade800,
              height: 0.5,
              width: MediaQuery.of(context).size.width - 110,
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 24,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 17,
                child: const Center(
                    child: Center(
                        child: Text(
                  "Your iPhone can't be backed up ",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ))),
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  color: Colors.red.shade700,
                  shape: BoxShape.circle,
                ),
                height: 25,
                width: 25,
                child: const Center(
                    child: Text(
                  "2",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                )),
              ),
              // Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 10.0, left: 10),
                child: buildArrowIcon(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container containerSoftwareUpdate(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 19,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 16,
            decoration: const BoxDecoration(
              //color: Colors.grey.shade900,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
            ),
            child: const Center(
                child: Center(
                    child: Text(
              "Software Update Available",
              style: TextStyle(color: Colors.white, fontSize: 17),
            ))),
          ),
          const Spacer(
            flex: 40,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.red.shade700,
              shape: BoxShape.circle,
            ),
            height: 25,
            width: 25,
            child: const Center(
                child: Text(
              "1",
              style: TextStyle(color: Colors.white, fontSize: 15),
            )),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 10.0, left: 7),
            child: buildArrowIcon(),
          )
        ],
      ),
    );
  }

  Container functionsList() {
    return Container(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      decoration: AppConstants.containerBoxDecoration,
      child: Column(
        children: functionList
            .map((e) => buildFunctionContainer(e.icon, e.color, e.titleText))
            .toList(),
      ),
    );
  }

  Container functionList2() {
    return Container(
      padding: const EdgeInsets.only(top: 7, bottom: 5),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: functionList1
            .map((e) => buildFunctionContainer(e.icon, e.color, e.titleText))
            .toList(),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      color: Colors.grey.shade900,
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
    );
  }

  Widget buildFunctionContainer(IconData icon, Color color, String text) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        if (text == "Wi-Fi") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const WiFi()),
          ).then((value) => setState(() {

          }));
        }
        if (text == "Bluetooth") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Bluetooth()),
          ).then((value) {
            /* if (value != null) {
                bluetoothName = value;
              } else {
                bluetoothName = "Not Connected";
              }*/

            setState(() {});
          });
        }

        if (text == "Mobile Data") {
          if (mounted) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MobileData()),
            ).then((value) {
              setState(() {});
            });
          }
        }
        if (icon == Icons.animation_sharp) {
          if (mounted) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Hotspot()),
            ).then((value) {
              setState(() {});
            });
          }
        }
      },
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 20,
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 30,
                ),
                Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Icon(
                      icon,
                      size: 25,
                      color: Colors.white,
                    )),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  text,
                  style: const TextStyle(color: Colors.white, fontSize: 17),
                ),
                const Spacer(),
                SizedBox(
                  child: text == "Mobile Data"
                      ? Container(
                          child: SharedPreferencesUtils.getInstance()
                                      .getBool(isMobileDataOn) ==
                                  true
                              ? Text(
                                  "Turned On",
                                  style: TextStyle(
                                      color: Colors.grey.shade400,
                                      fontSize: 17),
                                )
                              : null,
                        )
                      : const SizedBox(),
                ),
                SizedBox(
                  child: text == "Personal Hotspot"
                      ? Container(
                          child: SharedPreferencesUtils.getInstance()
                                      .getBool(isHotspotOn) ==
                                  true
                              ? Text(
                                  "Turned On",
                                  style: TextStyle(
                                      color: Colors.grey.shade400,
                                      fontSize: 17),
                                )
                              : null,
                        )
                      : const SizedBox(),
                ),
                Container(
                  child: text == "Bluetooth" || text == "Wi-Fi"
                      ? Text(
                          text == "Wi-Fi"
                              ? SharedPreferencesUtils.getInstance()
                                      .getString(wifiName) ??
                                  "Not Connected"
                              : SharedPreferencesUtils.getInstance()
                                      .getString(btName) ??
                                  "Not Connected",
                          style: TextStyle(
                              color: Colors.grey.shade400, fontSize: 17),
                        )
                      : null,
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  child: text == "Airplane Mode"
                      ? Switch.adaptive(
                          value: _value,
                          onChanged: (newValue) =>
                              setState(() => _value = newValue),
                        )
                      : null,
                ),
                Container(
                    child: text != "Airplane Mode" ? buildArrowIcon() : null),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 5),
            child: text == functionList[functionList.length - 1].titleText ||
                    text == functionList1[functionList1.length - 1].titleText
                ? const SizedBox()
                : Divider(
                    color: Colors.grey.shade800,
                    height: 1,
                    endIndent: 0,
                    indent: 27),
          ),
        ],
      ),
    );
  }

  Icon buildArrowIcon() {
    return Icon(
      Icons.arrow_forward_ios,
      size: 17,
      color: Colors.grey.shade500,
    );
  }
}
