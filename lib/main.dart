import 'package:api_covid/widget/data_covid.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'Pages/Home_Page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homePage(),
    );
  }
}
