import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:quickalert/quickalert.dart';

class Cash extends StatelessWidget {
  const Cash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int cardSelected = 0;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black.withOpacity(0.7),
                  size: 20,
                )),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20, left: 20, bottom: 20),
            child: Column(
              children: [
                Container(
                    height: screenHeight * 0.27,
                    child: Image.asset("assets/images/cash.jpg"))
              ],
            ),
          ),
          Text(
            "الدفع نقدا",
            style: TextStyle(fontFamily: kSecondaryFont, fontSize: 18),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AutoSizeText(
              "استمتع بالنسخة الكاملة من خلال الاشتراك في الباقة الشهرية او السنوية ويمكنك الغاء الاشتراك في اي وقت",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: kPrimaryFont,
                  fontSize: 14,
                  color: Colors.black.withOpacity(0.7)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "اختر خطة الدفع المناسبة لك",
            style: TextStyle(fontFamily: kSecondaryFont, fontSize: 14),
            textAlign: TextAlign.right,
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      cardSelected = 2;
                    });
                  },
                  child: Container(
                    height: 110,
                    width: screenWidth * 0.40,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 10)
                        ],
                        border: Border.all(
                            color: cardSelected == 2
                                ? Colors.black
                                : Colors.transparent)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "الباقة الشهرية",
                          style: TextStyle(
                              fontFamily: kSecondaryFont, fontSize: 14),
                        ),
                        Divider(
                          endIndent: 10,
                          indent: 10,
                        ),
                        Text(
                          "\$7.00 / شهرياً",
                          style:
                              TextStyle(fontFamily: kPrimaryFont, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      cardSelected = 1;
                    });
                  },
                  child: Container(
                    height: 110,
                    width: screenWidth * 0.40,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 10)
                        ],
                        border: Border.all(
                            color: cardSelected == 1
                                ? Colors.black
                                : Colors.transparent)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "الباقة السنوية",
                          style: TextStyle(
                              fontFamily: kSecondaryFont, fontSize: 14),
                        ),
                        Divider(
                          endIndent: 10,
                          indent: 10,
                        ),
                        Text(
                          "\$60.00 / سنوياً",
                          style:
                              TextStyle(fontFamily: kPrimaryFont, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Spacer(),
          Button()
        ],
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, top: 10, right: 20, left: 20),
      child: InkWell(
        onTap: () {
          QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              title: 'حدث خطأ',
              text:
                  'نأسف لحدوث هذا الخطأ و سيتم اصلاحه وتفعيل عملية الدفع في اقرب وقت',
              confirmBtnColor: Colors.black,
              confirmBtnText: "حسناً");
        },
        child: Container(
          width: screenWidth,
          padding: EdgeInsets.only(left: 20, right: 20),
          alignment: Alignment.center,
          height: 60,
          decoration: BoxDecoration(
            color: Color(0xFF212121),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            "اشترك الآن",
            style: TextStyle(
                fontFamily: kPrimaryFont, color: Colors.white, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
