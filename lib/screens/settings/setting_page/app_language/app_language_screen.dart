import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';

class AppLanguage extends StatelessWidget {
  const AppLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'اللغة',
          style: TextStyle(
              fontFamily: kPrimaryFont, color: Colors.black87, fontSize: 18),
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

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text(
                'العربية',
                style: TextStyle(fontSize: 16, fontFamily: kPrimaryFont),
              ),
              Spacer(),
              Icon(
                Icons.check_box,
                color: Colors.green,
              )
            ],
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          'سيتم توفير اللغة الإنجليزية قريباً',
          style: TextStyle(fontFamily: kPrimaryFont),
        )
      ],
    );
  }
}
