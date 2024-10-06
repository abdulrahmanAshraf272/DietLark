import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/hold_values.dart';
import 'package:food_app/screens/make_diet/get_user_data/get_user_data_screen.dart';

class EditDiet extends StatelessWidget {
  const EditDiet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'النظام الغذائي',
          style: TextStyle(
              fontFamily: kPrimaryFont, fontSize: 18, color: Colors.black87),
        ),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black.withOpacity(0.8),
            )),
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight,
      width: screenWidth,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            color: Colors.black.withOpacity(0.1),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'العمر',
                        style:
                            TextStyle(fontFamily: kPrimaryFont, fontSize: 16),
                      ),
                      Spacer(),
                      Text(
                        '${HoldValues.USER_AGE} سنة',
                        style:
                            TextStyle(fontFamily: kPrimaryFont, fontSize: 16),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        'الطول',
                        style:
                            TextStyle(fontFamily: kPrimaryFont, fontSize: 16),
                      ),
                      Spacer(),
                      Text(
                        '${HoldValues.USER_HEIGHT} cm',
                        style:
                            TextStyle(fontFamily: kPrimaryFont, fontSize: 16),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        'الوزن',
                        style:
                            TextStyle(fontFamily: kPrimaryFont, fontSize: 16),
                      ),
                      Spacer(),
                      Text(
                        '${HoldValues.USER_WEIGHT} kg',
                        style:
                            TextStyle(fontFamily: kPrimaryFont, fontSize: 16),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        'النشاط الاسبوعي',
                        style:
                            TextStyle(fontFamily: kPrimaryFont, fontSize: 16),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Text(
                          HoldValues.USER_ACTIVITY == 1.2
                              ? "انا شخص لا امارس الرياضة"
                              : HoldValues.USER_ACTIVITY == 1.37
                                  ? "امارس الرياضي من مرتين الى 3 مرات في الاسبوع"
                                  : HoldValues.USER_ACTIVITY == 1.55
                                      ? "امارس الرياضة من 4 الى 5 مرات في الاسبوع"
                                      : HoldValues.USER_ACTIVITY == 1.72
                                          ? "امارس الرياضة من 6 الى 7 مرات في الاسبوع"
                                          : "امارس الرياضة مرتين يوميا من 6 الى 7 مرات في الاسبوع",
                          style:
                              TextStyle(fontFamily: kPrimaryFont, fontSize: 14),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        'الهدف',
                        style:
                            TextStyle(fontFamily: kPrimaryFont, fontSize: 16),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Text(
                          HoldValues.USER_GOAL == 1
                              ? "خسارة الوزن والدهون"
                              : HoldValues.USER_GOAL == 2
                                  ? "هدفي الوصول لجسم رياضي وزيادة الكتلة العضلية"
                                  : "هدفي هو الحفاظ على شكل جسمي ووزني الحالي",
                          style:
                              TextStyle(fontFamily: kPrimaryFont, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        'نوع النظام الغذائي',
                        style:
                            TextStyle(fontFamily: kPrimaryFont, fontSize: 16),
                      ),
                      Spacer(),
                      Text(
                        HoldValues.USER_DIET_TYPE == BALANCED_DIET
                            ? "الدايت المتوازن"
                            : HoldValues.USER_DIET_TYPE == KETO_DIET
                                ? "دايت الكيتو"
                                : "دايت منخفض الكربوهيدرات",
                        style:
                            TextStyle(fontFamily: kPrimaryFont, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 15),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30)),
              child: ElevatedButton(
                onPressed: () {
                  HoldValues.isEditingDiet = true;
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GetUserData()))
                      .then((value) => setState(() {
                            print('try refresh');
                          }));
                },
                child: Text(
                  'تعديل',
                  style: TextStyle(
                      fontFamily: kPrimaryFont,
                      fontSize: 16,
                      color: Colors.white),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith((state) {
                      if (state.contains(MaterialState.pressed)) {
                        return Colors.black.withOpacity(0.7);
                      }
                      return Colors.black.withOpacity(0.9);
                    }),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)))),
              )),
        ],
      ),
    );
  }
}
