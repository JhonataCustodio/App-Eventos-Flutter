import 'package:flutter/material.dart';
import 'package:localizeja/root_page.dart';
import 'package:localizeja/auth.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'LocalizeJA',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primaryColor: Colors.black,
      ),
      home: new RootPage(auth: new Auth()),
    );
  }
}
