import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';

class DisplayReferences extends StatelessWidget {
  const DisplayReferences({Key? key, required this.references})
      : super(key: key);

  final String references;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        references: references,
      ),
      appBar: buildAppBar(context),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 1,
      backgroundColor: Colors.white,
      leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black87,
          )),
      title: Text(
        "المراجع",
        style: TextStyle(
            fontFamily: kPrimaryFont, fontSize: 16, color: Colors.black87),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.references,
  }) : super(key: key);

  final String references;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          references,
          textDirection: TextDirection.ltr,
          style: TextStyle(
              fontFamily: kPrimaryFont, fontSize: 16, color: Colors.black),
        ),
      ),
    );
  }
}
