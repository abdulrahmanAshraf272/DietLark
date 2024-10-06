import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/search_page/components/body.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black87,
        ),
      ),
      body: Body(),
    );
  }
}
