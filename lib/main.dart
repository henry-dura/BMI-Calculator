import 'constants.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(color: Color(0xFF0E112E)),
        scaffoldBackgroundColor:  Color(0xFF0E112E),
        primaryColor: Color(0xFF272B4C),
      ),
      home: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text('BMI CALCULATOR',style: kAppBarText,),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: HomePage(),
            ),
          )),
    );
  }
}

