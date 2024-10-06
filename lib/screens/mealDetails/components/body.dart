import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/hold_values.dart';
import 'package:food_app/screens/food_details/food_details_screen.dart';
import 'package:food_app/screens/mealDetails/components/sum_bar.dart';
import 'package:food_app/size_config.dart';
import 'package:food_app/sqldb.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  SqlDb sqlDb = SqlDb();
  bool isLoading = true;
  List mealData = [];
  num caloriesSum = 0, proteinSum = 0, carbSum = 0, fatSum = 0;

  Future readData() async {
    List<Map> response = await sqlDb.readData(
        "SELECT * FROM notes WHERE mealNo = ${HoldValues.mealSelected}");
    mealData.clear();
    mealData.addAll(response);
    isLoading = false;
    //Calculate the sum of calories and macros.
    caloriesSum = 0;
    proteinSum = 0;
    carbSum = 0;
    fatSum = 0;
    for (int i = 0; i < mealData.length; i++) {
      caloriesSum += mealData[i]['calories'];
      proteinSum += mealData[i]['protein'];
      carbSum += mealData[i]['carb'];
      fatSum += mealData[i]['fat'];
    }
    if (this.mounted) {
      setState(() {});
    }
  }

  //This is the first method called when the widget is created.
  //initState is called once and only once.

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    readData();

    return Container(
      width: screenWidth,
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          DisplayTheSum(
              caloriesSum: caloriesSum.toInt(),
              proteinSum: double.parse(proteinSum.toStringAsFixed(1)),
              carbSum: double.parse(carbSum.toStringAsFixed(1)),
              fatSum: double.parse(fatSum.toStringAsFixed(1))),
          caloriesSum == 0
              ? Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.1),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/select_food.jpg',
                        width: screenWidth * 0.5,
                      ),
                      Text(
                        'أضف بعض الأكلات الى وجبتك!',
                        style: TextStyle(
                            fontFamily: kPrimaryFont,
                            color: Colors.black,
                            fontSize: 16),
                      )
                    ],
                  ),
                )
              : Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 60),
                      child: ListView.separated(
                        itemCount: mealData.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Column(
                          children: [
                            InkWell(
                              onTap: () {
                                HoldValues.amountScaleS =
                                    mealData[index]['amountType'];
                                HoldValues.calories =
                                    mealData[index]['calories'];
                                HoldValues.protein = mealData[index]['protein'];
                                HoldValues.fat = mealData[index]['fat'];
                                HoldValues.carb = mealData[index]['carb'];
                                HoldValues.foodImage =
                                    "${mealData[index]['image']}";
                                HoldValues.foodDesc =
                                    "${mealData[index]['desc']}";
                                HoldValues.foodTitle =
                                    "${mealData[index]['name']}";
                                HoldValues.foodAmount =
                                    mealData[index]['amount'];
                                HoldValues.foodId = mealData[index]['id'];
                                HoldValues.isAdding = 0;

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FoodDetails()));
                              },
                              child: Container(
                                height: 112,
                                width: screenWidth,
                                child: Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 70,
                                        width: 70,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                              alignment: Alignment.center,
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  "${mealData[index]['image']}"),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${mealData[index]['name']}",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontFamily: kPrimaryFont,
                                                fontSize: 18,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              "${mealData[index]['amount']} ${HoldValues.amountFormMethod(mealData[index]['amountType'])}",
                                              style: TextStyle(
                                                  fontFamily: kPrimaryFont,
                                                  fontSize: 12,
                                                  color: Colors.black26),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            "${mealData[index]['calories']}",
                                            maxLines: 1,
                                            style: TextStyle(
                                              fontFamily: kPrimaryFont,
                                              fontSize: 22,
                                              color: kRedColor,
                                            ),
                                          ),
                                          Text(
                                            "سعرة",
                                            style: TextStyle(
                                                fontFamily: kPrimaryFont,
                                                fontSize: 12,
                                                color: Colors.black54),
                                          ),
                                        ],
                                      ),
                                      IconButton(
                                          onPressed: () async {
                                            int response = await sqlDb.deleteData(
                                                "DELETE FROM notes WHERE id = ${mealData[index]['id']}");
                                            if (response > 0) {
                                              mealData.removeWhere((element) =>
                                                  element['id'] ==
                                                  mealData[index]['id']);
                                              setState(() {
                                                //To recalculate the sum of calories and macros.
                                                caloriesSum = 0;
                                                proteinSum = 0;
                                                fatSum = 0;
                                                carbSum = 0;
                                                for (int i = 0;
                                                    i < mealData.length;
                                                    i++) {
                                                  caloriesSum +=
                                                      mealData[i]['calories'];
                                                  proteinSum +=
                                                      mealData[i]['protein'];
                                                  carbSum +=
                                                      mealData[i]['carb'];
                                                  fatSum += mealData[i]['fat'];
                                                }
                                              });
                                            }
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        separatorBuilder: (context, index) {
                          return Divider(
                            height: 0.8,
                            color: Colors.black38,
                            indent: 30,
                            endIndent: 30,
                          );
                        },
                      ),
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
