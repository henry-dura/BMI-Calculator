import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'utilities/reusable_appbar.dart';

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
        appBarTheme: const AppBarTheme(color: Color(0xFF0E112E)),
        scaffoldBackgroundColor:  const Color(0xFF0E112E),
        primaryColor: const Color(0xFF272B4C),
          filledButtonTheme:FilledButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(Colors.red),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              ),
            ),
          ),
      ),

      home: const SafeArea(
          child: Scaffold(
            appBar: ReusableAppBar(),
            body: Padding(
              padding:  EdgeInsets.all(12.0),
              child: HomePage(),
            ),
          )),
    );
  }
}



