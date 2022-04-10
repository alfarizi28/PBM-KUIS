import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:malingkundang/page_satu.dart';

void main() {
  WidgetsFlutterBinding();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(myApp());
}

// ignore: camel_case_types
class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: pageSatu(),
    );
  }
}
