import 'package:flutter/material.dart';
import 'package:news_app/screens/Home.dart';
import 'package:news_app/screens/news_detail.dart';
import 'package:news_app/screens/notification.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

