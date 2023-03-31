import 'package:flutter/material.dart';

class SingleSwitch extends StatefulWidget {
  SingleSwitch(
      {Key? key,
      required this.text,
      required this.onChangeWifiState,
      required this.isOn,
      required this.getStringvalue,
     })
      : super(key: key);
  String text;
  Function(bool) onChangeWifiState;
  bool isOn;
  String getStringvalue;
  @override
  State<SingleSwitch> createState() => _SingleSwitchState();
}

class _SingleSwitchState extends State<SingleSwitch> {
  bool? _value;

  @override
  void initState() {
    _value = widget.isOn;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            widget.text,
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
        Spacer(),
        Switch.adaptive(
          value: _value!,
          onChanged: (newValue) {
            _value = newValue;
            widget.onChangeWifiState(newValue);
            // widget.onChangeWifiState(newValue);
            // widget.onChangeWifiState(newValue);
            setState(() {});
          },
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
