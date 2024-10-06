import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/size_config.dart';

class HeaderWithSearchBox extends StatelessWidget {
  const HeaderWithSearchBox({
    Key? key,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight * 0.25,
      child: Stack(children: [
        Container(
          padding: EdgeInsets.only(
              right: kDefaultPadding,
              left: kDefaultPadding,
              bottom: kDefaultPadding + 36),
          height: SizeConfig.screenHeight * 0.25 - 27,
          decoration: BoxDecoration(
            color: kRedColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36)),
          ),
          child: Row(
            children: [
              AutoSizeText(
                "أكتشف السعرات الحرارية\nوالقيمة الغذائية للأطعمة",
                style: TextStyle(
                  fontFamily: kPrimaryFont,
                  fontSize: 25,
                  color: Colors.white,
                ),
                maxLines: 2,
              ),
            ],
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            height: 54,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Colors.black12.withOpacity(0.15))
                ]),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                  onChanged: (value) {},
                  decoration: InputDecoration(
                      hintText: "مثال: البيض , صدور الدجاج",
                      hintStyle: TextStyle(
                          color: kRedColor.withOpacity(0.5),
                          fontFamily: kPrimaryFont),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none),
                )),
                SvgPicture.asset(
                  "assets/icons/search.svg",
                  color: kRedColor.withOpacity(0.5),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
