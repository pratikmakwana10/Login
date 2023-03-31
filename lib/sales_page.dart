import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:login_signup_page/feature_model.dart';
import 'package:login_signup_page/login_screen.dart';
import 'src/fonts.dart';

class Purchase extends StatefulWidget {
  const Purchase({Key? key}) : super(key: key);

  @override
  State<Purchase> createState() => _PurchaseState();
}

class _PurchaseState extends State<Purchase> {
  bool isSelected = true;

  List<FeatureList> featureList = [
    FeatureList("images/logo-1.png", "Backup your Contacts automatically"),
    FeatureList("images/Vector-2.png", "Merge an infinite number of Contacts"),
    FeatureList("images/Vector-3.png", "Import from & Export to cloud storage"),
    FeatureList("images/Vector-4.png", "Birthday reminders of your Contacts")
  ];

  List<OfferModel> offerList = [
    OfferModel("\$2.99/Weekly", "First 3 days free", false, false),
    OfferModel("\$11.99/Monthly", "First 3 days free", false, false),
    OfferModel("\$39.99/Yearly", "First 3 days free", true, true),
  ];
  List<String> filterList = [];

  //List<int> number = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
          children: [
        buildBannerView(context),
        buildContactBackUpRow(),
        buildFeatureList(),
        buildSizedBox(),
        buildSizedBox_10(20),
        priceListviewBuilder(),
        buildElevatedButton(context),
        buildText(),
        buildSizedBox_2(),
        buildLastRow(),
        Column(
          children: [
            Container(

              padding: const EdgeInsets.all(10),
              height: 250,
              decoration: const BoxDecoration(),
              child: ListView.builder(
                  //  _AnimatedMovies = AllMovies.where((i) => i.isAnimated).toList();

                  itemCount: featureList.length,
                  itemBuilder: (BuildContext context, int index) {
                    var con = featureList[index].text.contains("Contacts");
                    if (con == true) {
                      filterList.add(con.toString());
                      if (kDebugMode) {
                        print(filterList);
                      }
                    } else {}
                    //print(con);
                    return Container(
                      padding: const EdgeInsets.only(left: 10),
                      decoration: const BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      height: 50,
                      width: double.maxFinite,
                      child: Center(child: Text(featureList[index].text)),
                    );
                  }),
            )
          ],
        ),
      ]),
    ));
  }

  /* void filterContact(BuildContext context,int index){
    for(var i = 0 ; i < featureList.length ; i++){
      print(i);
    }
    // List<FeatureList> filter = featureList;
    // List<String> fruits = ['apple', 'banana', 'orange'];
    List<FeatureList> filteredList = featureList
        .where((e) => e.text == "Contacts")
        .toList();
    print(filteredList);

  }*/
  Container filterContacts(String text, int index) {

    return Container(
      padding: const EdgeInsets.all(10),
      height: 50,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
          child: Text(
        text,
        style: const TextStyle(
            fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
      )),
    );
  }

  SizedBox buildSizedBox_2() => const SizedBox(
        height: 20,
      );

  Widget buildFeatureList() {
    /**
     *  Do not call the same method repeatedly for the same view.
     *  Make a list of data and iterate the items in a loop.
     */
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Column(

        children: featureList
            .map((e) => buildFeaturesRow(
                  e.text,
                  e.image,
                ))
            .toList(),
      ),
    );
  }

  SizedBox buildSizedBox() => const SizedBox(
        height: 10,
      );

  Padding buildContactBackUpRow() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 20,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Contact Backup ",
            style: TextStyle(
              fontSize: 25,
              fontFamily: sfHeavy,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF633A8),
              borderRadius: BorderRadius.circular(5),
            ),
            /**
             * TODO: Why to use static height and width when we can manage the space with Padding.
             */
            height: 30,
            width: 45,
            child: const Center(
              child: Text(
                "PRO",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontFamily: sfSemiBold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Stack buildBannerView(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          /**
           *  See if we can manage the view without assigning the height.
           */
          // height: MediaQuery.of(context).size.height / 3,
          width: MediaQuery.of(context).size.width,
          /**
           *  Using height and Box-fit.fill, the image will get stretched or shark depending on the height.
           */
          child: Image.asset('images/banner.png', fit: BoxFit.fitWidth),
        ),
        Positioned(
          top: 50,
          right: 25,
          height: 30,
          width: 30,
          child: GestureDetector(
            /**
             *  Create separate methods for click events like the one below
             */
            onTap: () {
              navigateLogin(context);
            },
            child: Container(
              alignment: Alignment.topRight,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.3),
                  shape: BoxShape.circle),
              child: Image.asset('images/close_btn.png'),
            ),
          ),
        ),
      ],
    );
  }

  Padding buildLastRow() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Privacy  |",
            style: TextStyle(fontFamily: sfUltraLight),
          ),
          Text("  Subscription Info  |",
              style: TextStyle(fontFamily: sfUltraLight)),
          Text("  Restore", style: TextStyle(fontFamily: sfUltraLight)),
        ],
      ),
    );
  }

  Text buildText() {
    return const Text(
      "Payment automatically initiated for next subscription",
      style: TextStyle(fontFamily: sfRegular, fontWeight: FontWeight.w400),
    );
  }

  Padding buildElevatedButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, top: 5, bottom: 15),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF007AFF),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          minimumSize: const Size(double.maxFinite, 55),
        ),
        onPressed: () {
          // filterContact(context,featureList.length);
          navigateLogin(context);
        },
        child: const Text(
          "Try free and subscribe",
          style: TextStyle(
              fontSize: 18, fontFamily: sfHeavy, color: Color(0xFFFFFFFF)),
        ),
      ),
    );
  }

  SizedBox priceListviewBuilder() {
    return SizedBox(
      height: 210,
      width: double.maxFinite,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: offerList.length,
        itemBuilder: (BuildContext context, int index) {
          return buildOfferContainer(offerList[index]);
        },
      ),
    );
  }

  buildOfferContainer(OfferModel offerItem) {
    /**
     *  Name the method based on its purpose.
     */
    return GestureDetector(
      onTap: () {
        var clickedButton = offerItem;

        for (var offer in offerList) {
          if (clickedButton == offer) {
            offer.buttonSelected = true;
            if (kDebugMode) {
              print(offer.buttonSelected);
            }
          } else {
            offer.buttonSelected = false;
          }
        }
        setState(() {});
      },
      child: Container(
        margin:
            const EdgeInsets.only(left: 20.0, right: 20.0, top: 6, bottom: 6),
        decoration: BoxDecoration(
            border: Border.all(
                color: offerItem.buttonSelected == true
                    ? const Color(0xFF007AFF)
                    : Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Column(
                  children: [
                    Text(
                      offerItem.dollarRate,
                      style: const TextStyle(fontSize: 15, fontFamily: sfHeavy),
                    ),
                    const Text(
                      "First 3 days free",
                      // offerList.subtitle,
                      style: TextStyle(
                          fontFamily: sfSemiBold, color: Color(0xFFC7C7CC)),
                    ),
                  ],
                ),
              ),
              offerItem.offerTab == true
                  ? Container(
                      height: 26,
                      width: 67,
                      margin: const EdgeInsets.only(bottom: 29),
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFB800),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(
                            10,
                          ),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: const Center(
                          child: Text(
                        " 65% off",
                        style: TextStyle(fontFamily: sfSemiBold),
                      )))
                  : const SizedBox.shrink(),
              SizedBox(
                height: 25,
                width: 28,
                child: Align(
                  alignment: Alignment.center,
                  child: Icon(
                      offerItem.buttonSelected
                          ? Icons.check_circle
                          : Icons.radio_button_unchecked_sharp,
                      color: offerItem.buttonSelected
                          ? const Color(0xFF007AFF)
                          : Colors.grey.shade400),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void navigateLogin(BuildContext context) {
  Navigator.pop(
    context,
    MaterialPageRoute(builder: (context) => LoginPage()),
  );
}

Widget buildFeaturesRow(String text, String image) {
  return Padding(
    padding: const EdgeInsets.only(top: 2.5, bottom: 2.5),
    child: Row(
      children: [
        // mainAxisAlignment: MainAxisAlignment.center,
        /*  SizedBox(
            width: MediaQuery.of(context).size.width / 8,
          ),*/
        SizedBox(
          height: 20,
          width: 20,
          child: Image.asset(
            image,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 17,
            fontFamily: sfRegular,
            color: Color(0xFF50555C),
          ),
        ),
      ],
    ),
  );
}

SizedBox buildSizedBox_10(int height) {
  return const SizedBox();
}
