

import 'package:flutter/cupertino.dart';

class FeatureList {
  final String image;
  final String text;

  FeatureList(this.image, this.text);
}

class OfferModel {
   String dollarRate;
   String subtitle;
   bool offerTab;
   bool buttonSelected;

  OfferModel(
      this.dollarRate, this.subtitle, this.offerTab, this.buttonSelected);
}


class FunctionModel {

  IconData icon;
  Color color;
  String titleText;



  FunctionModel(
      this.icon, this.color, this.titleText,);
}

class Network {
  String text;


  Network(this.text);
}
class NetworkB {
  String textTitle;

  NetworkB(this.textTitle);
}