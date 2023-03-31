import 'package:flutter/material.dart';

Icon buildArrowIcon() {
  return Icon(

    Icons.arrow_forward_ios,
    size: 17,
    color: Colors.grey.shade500,
  );
}

SizedBox buildSizedBox(BuildContext context) {
  return SizedBox(
    height: MediaQuery.of(context).size.height / 25,
  );
}


Container buildLine(BuildContext context) {
  return Container(
    height: 0.5,
    color: Colors.grey,
    width: MediaQuery.of(context).size.width,
  );
}