import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';

Container buttonToUse(BuildContext context, Function onTap, String txt) {
  return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: ElevatedButton(
        onPressed: () {
          onTap();
        },
        child: Text(
          txt,
          style: TextStyle(
              fontFamily: kPrimaryFont, fontSize: 16, color: Colors.black87),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((state) {
              if (state.contains(MaterialState.pressed)) {
                return Colors.grey;
              }
              return Colors.white;
            }),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)))),
      ));
}
