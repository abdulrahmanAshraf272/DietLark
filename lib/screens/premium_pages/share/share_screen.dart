import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:food_app/screens/premium_pages/share_done/share_done_screen.dart';
import 'package:share_plus/share_plus.dart';

class ShareApp extends StatelessWidget {
  const ShareApp({super.key});

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

//We must add the Widget help us to observe here
class _BodyState extends State<Body> with WidgetsBindingObserver {
  bool doneSharing = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Adding observer to listen if the app in background or closed
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //Close the observer
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed) {
      //resume called after inactive and after pause , and i want to navigate only after paused.
      print("================== resumed =======================");
      if (doneSharing) {
        Navigator.pushReplacementNamed(context, "/shareDone");
      }
    } else if (state == AppLifecycleState.inactive) {
      print("====================== inactive ===================");
    } else if (state == AppLifecycleState.paused) {
      print("================= paused ==================");
      doneSharing = true;
    }
  }

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
                    child: Image.asset("assets/images/share.jpg"))
              ],
            ),
          ),
          Text(
            "مشاركة التطبيق",
            style: TextStyle(fontFamily: kSecondaryFont, fontSize: 18),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AutoSizeText(
              "شارك التطبيق مع 4 من اصدقائك وساعدهم للإعتناء بصحتهم واكتشاف كل يوم معلومة جديدة و مفيدة.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: kPrimaryFont,
                  fontSize: 14,
                  color: Colors.black.withOpacity(0.7)),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "التزم بالخطوات التالية ليتم التفعيل بشكل صحيح",
              style: TextStyle(fontFamily: kSecondaryFont, fontSize: 14),
              textAlign: TextAlign.right,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                width: screenWidth,
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    steps("1- أضغط على زر مشاركة"),
                    steps("2- أختر التطبيق الذي تريد المشاركة من خلاله"),
                    steps("3- أختر عدد 4 من أصدقائك"),
                    steps("4- اضغط على زر ارسال"),
                    steps("5- سيتم التحقق من عملية الارسال وتفعيل الحساب"),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15, right: 20, left: 20),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFF212121)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () async {
                      await Share.share("$shareText\n $appLink");
                    },
                    child: Container(
                      width: screenWidth,
                      padding: EdgeInsets.only(left: 20, right: 20),
                      alignment: Alignment.center,
                      height: 60,
                      decoration: BoxDecoration(
                        //color: Color(0xFF212121),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "مشاركة",
                        style: TextStyle(
                            fontFamily: kPrimaryFont,
                            color: Colors.white,
                            fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding steps(String txt) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        txt,
        style: TextStyle(fontFamily: kPrimaryFont, fontSize: 13),
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
      padding: const EdgeInsets.only(bottom: 15, right: 20, left: 20),
      child: InkWell(
        onTap: () async {
          await Share.share('check out my website https://example.com');
          //Navigator.push(context, MaterialPageRoute(builder: (context) => ShareDone()));
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
            "مشاركة",
            style: TextStyle(
                fontFamily: kPrimaryFont, color: Colors.white, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
