import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/premium_pages/cash/cash_screen.dart';
import 'package:food_app/screens/premium_pages/share/share_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:auto_size_text/auto_size_text.dart';

class CashOrShare extends StatelessWidget {
  const CashOrShare({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.close_sharp,
                    color: Colors.black.withOpacity(0.5),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
              child: Column(
                children: [
                  Container(
                    width: screenWidth * 0.6,
                    child: Lottie.asset(
                      'assets/icons/premium.json',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "استمتع بالنسخة الكاملة الان",
                    style: TextStyle(fontFamily: kFontDGSahabah, fontSize: 22),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  features("القيمة الغذائية ل230 اكلة مختلفة"),
                  features("اهم العناصر الغذائية ومصادر كل عنصر منها"),
                  features("محرك البحث السريع لقاعدة بيانات الاكلات"),
                  features("دليل المكملات الغذائية"),
                  features("اكثر من 150 وصفة وجبات لذيذة وصحية"),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "اختر طريقة التفعيل التي تفضلها",
                    style: TextStyle(fontFamily: kPrimaryFont),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 160,
                    child: Stack(
                      children: [
                        Positioned(
                          right: 0,
                          left: 0,
                          bottom: 0,
                          child: ActiveOptionCard(
                            image: "assets/images/share.jpg",
                            title: "مشاركة التطبيق",
                            subtitle:
                                "شارك التطبيق مع 4 من اصدقائك وساعدهم للإعتناء بصحتهم واكتشاف كل يوم معلومة جديدة و مفيدة.",
                            press: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ShareApp())),
                          ),
                        ),
                        Positioned(
                          left: 20,
                          top: 0,
                          child: Container(
                            height: 22,
                            width: 75,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Color(0xFFffac14),
                                borderRadius: BorderRadius.circular(20)),
                            child: AutoSizeText(
                              "لفترة محدودة",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 11),
                              minFontSize: 6,
                              maxLines: 1,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  ActiveOptionCard(
                    image: "assets/images/cash.jpg",
                    title: "الدفع نقدا",
                    subtitle:
                        "استمتع بالنسخة الكاملة وبدون اي اعلانات من خلال الاشتراك في الباقة الشهرية او السنوية",
                    press: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Cash())),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget features(String txt) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Image.asset(
            "assets/images/check_mark.png",
            width: 20,
          ),
          SizedBox(
            width: 3,
          ),
          Text(
            txt,
            style: TextStyle(fontFamily: kPrimaryFont, fontSize: 13),
          )
        ],
      ),
    );
  }
}

class ActiveOptionCard extends StatelessWidget {
  const ActiveOptionCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.press,
  });

  final String image, title, subtitle;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black.withOpacity(0.5), width: 0.8),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Image.asset(image),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, top: 15, bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      title,
                      style:
                          TextStyle(fontFamily: kSecondaryFont, fontSize: 15),
                    ),
                    Expanded(
                      child: AutoSizeText(
                        subtitle,
                        style: TextStyle(
                            fontFamily: kPrimaryFont,
                            fontSize: 12,
                            color: Colors.black.withOpacity(0.7)),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
