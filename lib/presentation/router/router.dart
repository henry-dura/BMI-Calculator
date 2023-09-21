
import 'package:flutter/material.dart';

import '../pages/home_page.dart';
import '../pages/second_page.dart';



final Map <String,WidgetBuilder> router = {

'/': (context)=>HomePage(),

'/second': (context)=> const SecondPage(),

};