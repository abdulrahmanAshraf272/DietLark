import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';

TextField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white, fontFamily: kPrimaryFont),
    decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.white70,
        ),
        labelText: text,
        labelStyle: TextStyle(color: Colors.white.withOpacity(0.9))),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

Container signInSignUpButton(
    BuildContext context, bool isLogin, Function onTap) {
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
          isLogin ? 'تسجيل دخول' : 'إنشاء حساب',
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
