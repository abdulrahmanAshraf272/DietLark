import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_app/hold_values.dart';
import 'package:food_app/models/ads_test/interstitial_ad_model.dart';

//the colors used in the app
const kPrimaryColor = Color(0xFF84AB5C);
const kTextColor = Color(0xFF202E2E);
const kTextLightColor = Color(0xFF7286A5);
const kRedColor = Color(0xFFD82D40);
const kRedColor2 = Color(0xFFaf2b3a);
const kDarkGreen = Color(0xFF5E6E0E);
const kGrayColor = Color(0xFFF8F8F8);
const kGray2 = Color(0xFFf2f2f2);
const blackColor = Color(0xFF323232);
const kLightRedColor = Color(0xFFFBF7F7);
const kDescriptionColor = Color(0xFF443F3F);

//try this red
const kRedColor3 = Color(0xFFDA3C4D);

const int animationDuration = 1600;

//////try this theme//////
///number 1
const colorTheme1 = Color(0xFF1e3d59);
const colorTheme2 = Color(0xFFaf2b3a); //you can change the degree of red
const colorTheme3 = Color(0xFF68933d);

///number 2
const colorTheme4 = Color(0xFF1e3d59);
const colorTheme6 = Color(0xFFf5f0e1);
const colorTheme5 = Color(0xFFff6e40);

///number 3
const colorTheme7 = Color(0xFF1b1924);
const colorTheme8 = Color(0xFFb5c1b4);
const colorTheme9 = Color(0xFFdcd9c6);

///number 4
const colorTheme10 = Color(0xFF1d354d);
const colorTheme11 = Color(0xFFed9148);
const colorTheme12 = Color(0xFFe9e1d4);

//////== color packages for text ==///////
const firstColorPackage1 = Color(0xFF1e3d59);
const firstColorPackage2 = Color(0xFFf5f0e1);
const firstColorPackage3 = Color(0xFFff6e40);

const secondColorPackage1 = Color(0xFF1b1924);
const secondColorPackage2 = Color(0xFFb5c1b4);
const secondColorPackage3 = Color(0xFFdcd9c6);

const thirdColorPackage1 = Color(0xFFb85043);
const thirdColorPackage2 = Color(0xFFe6e8d2);
const thirdColorPackage3 = Color(0xFFa7beae);

const forthColorPackage1 = Color(0xFF132226);
const forthColorPackage2 = Color(0xFF525b56);
const forthColorPackage3 = Color(0xFFbe9063);

const fifthColorPackage1 = Color(0xFF03353e);
const fifthColorPackage2 = Color(0xFFa79c93);
const fifthColorPackage3 = Color(0xFFc1403d);

const sixthColorPackage1 = Color(0xFFf2aa4c);
const sixthColorPackage2 = Color(0xFF101820);

const seventhColorPackage1 = Color(0xFFffc500);
const seventhColorPackage2 = Color(0xFF1f313b);

const logoColor = Color(0xFFffc13d);
const myDietGreenColor = Color(0xFF334632);
const oldSplashColor = Color(0xFF1e3d59);
const logobackgroundColor = Color(0xFF1e3d59);

//the fonts
const String kPrimaryFont = "TheSansPlain";
const String kSecondaryFont = "CairoBold";
const String kFontDGSahabah = "DGSahabah";
// the amount scales.
const int gramAmount = 1;
const int mediumAmount = 2;
const int sponAmount = 3;
const int cupAmount = 4;
const int mealsAmount = 5;
//display amount scale.
const String gramString = "جرام";
const String mediumString = "متوسطة الحجم";
const String sponString = "معلقة كبيرة";
const String cupString = "كوب";
const String mealString = "وجبة";

//the Diets Types.
const int BALANCED_DIET = 1;
const int KETO_DIET = 2;
const int LOW_CARB_DIET = 3;

//the Goal Selected.
const int LOSS_WEIGHT = 1;
const int GAIN_WEIGHT = 2;
const int MAINTAIN_WEIGHT = 3;

//the Gender.
const int MALE = 1;
const int FEMALE = 1;

const kDefaultTextStyle = TextStyle(fontSize: 28, fontFamily: kSecondaryFont);

const kDesFontStyle = TextStyle(fontFamily: kPrimaryFont, fontSize: 16);

const kDefaultShadow =
    BoxShadow(offset: Offset(0, 4), blurRadius: 4, color: Colors.black26);

const kTextColor2 = Color(0xFF12153D);
const kTextLightColor2 = Color(0xFF9A9BB2);

const String descriptoinTry =
    "قد يساهم تناول لحم البقر أيضًا في زيادة قوة جهاز المناعة، ممّا قد يؤدي إلى زيادة قدرة الجسم على مقاومة الأمراض، إضافةً إلى دوره في مساعدة أنسجة الجسم على الشفاء والالتئام بسرعة عند الإصابة بالجروح، ويعود ذلك بشكلٍ رئيسٍ إلى احتوائه على الزنك الّذي يساهم في توفير هذه الفوائد.";

const double kDefaultPadding = 20.0;

const TextStyle QtextStyle =
    TextStyle(fontFamily: kFontDGSahabah, fontSize: 20);

/// == Min and Max age, height, weight ==///
const int minHeight = 50;
const int maxHeight = 250;
const int minAge = 8;
const int maxAge = 105;
const double minWeight = 10;
const double maxWeight = 350;

/// == The diets types macros percentage == ///
const double BALANCED_PP = 0.25;
const double BALANCED_CP = 0.40;
const double BALANCED_FP = 0.35;

const double LOW_CARB_PP = 0.25;
const double LOW_CARB_CP = 0.20;
const double LOW_CARB_FP = 0.55;

const double KETO_PP = 0.20;
const double KETO_CP = 0.05;
const double KETO_FP = 0.75;

const double proteinPerWeightNum = 1.6;

/// == Shared preferances keys ==///
const String KEY_FIRST_NAME = "firstName";
const String KEY_SECOND_NAME = "secondName";
const String KEY_GENDER = "gender";
const String KEY_AGE = "age";
const String KEY_WEIGHT = "weight";
const String KEY_HEIGHT = "height";
const String KEY_ACTIVITY = "activity";
const String KEY_GOAL = "goal";
const String KEY_DIET_TYPE = "dietType";
const String KEY_CALORIES_MAIN = "caloriesMain";
const String KEY_CALORIES_INTAKE = "caloriesIntake";
const String KEY_PROTEIN_INTAKE = "proteinIntake";
const String KEY_CARB_INTAKE = "carbIntake";
const String KEY_FAT_INTAKE = "fatIntake";
const String KEY_HAVE_DIET = "haveDiet";
const String KEY_FIRST_TIME_USE = "firstTimeUse";
const String KEY_PREMIUM = "premium";
const String KEY_ACCOUNT_NAME = 'userAccount';

//////// == meals time == /////////
const String KEY_MEAL1_ACTIVE = "meal1active";
const String KEY_MEAL1_HOUR = "meal1hour";
const String KEY_MEAL1_MIN = "meal1min";

const String KEY_MEAL2_ACTIVE = "meal2active";
const String KEY_MEAL2_HOUR = "meal2hour";
const String KEY_MEAL2_MIN = "meal2min";

const String KEY_MEAL3_ACTIVE = "meal3active";
const String KEY_MEAL3_HOUR = "meal3hour";
const String KEY_MEAL3_MIN = "meal3min";

const String KEY_MEAL4_ACTIVE = "meal4active";
const String KEY_MEAL4_HOUR = "meal4hour";
const String KEY_MEAL4_MIN = "meal4min";
const String KEY_SUGGESTION = 'suggestion';
const String KEY_RATE_COUNTER = 'rateCounter';

const String balanced_diet_subtitle =
    "هو نظام غذائي يحتوي على جميع العناصر الغذائية من بروتين وكربوهيدرات ودهون صحية و يعتمد بشكل الأساسي على حساب السعرات للوصول لهدفك.";
const String keto_diet_subtitle =
    "يهدف هذا النظام الغذائي إلى استخدام الدهون كمصدر طاقة للجسم بدلًا من سكر الجلوكوز المتواجد في الكربوهيدرات.";
const String lowCarb_diet_subtitle =
    "هو نظام غذائي يهدف إلى الحد من تناول الكربوهيدرات, لجعل مستويات السكر في الدم  تميل إلى الاستقرار، وتقل مستويات الهرمون المسؤول عن تخزين الدهون.";
const String carbCycle_diet_subtitle =
    "هو نظام غذائي يعتمد على انك تقوم بأخذ كمية قليلة من الكربوهيدرات و بتالي يقوم الجسم بطرد المياه الزائدة المخزنة فيه.";
const String psmf_diet_subtitle =
    "هو من أخطر الأنظمة الغذائية ولكنه يعد أحد أسرع الأنظمة الغذائية في تحقيق فقدان الوزن مقارنة مع غيره من الأنظمة الغذائية.";
const String fasting_diet_subtitle =
    "يساعد الصيام المتقطع على خسارة الوزن ودهون البطن، دون الحاجة إلى التقليل من السعرات الحرارية بشكل كبير، ولكن من خلال تحفيز حرق دهون الجسم المخزنة من أجل الحصول على الطاقة.";
const String shareText = 'جرب التطبيق';
const String appLink =
    "https://play.google.com/store/apps/details?id=com.dietlark.fitness.calorie.loseweight";

const int notiClickAdTime = 3;
const int adTimePageClose = 1;

//////- add this in constants.dart - ///////
//To remove overScroll glow
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
