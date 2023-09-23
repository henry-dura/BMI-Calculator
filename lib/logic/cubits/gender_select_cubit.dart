import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:body_mass_calculator/constants/constants.dart';




class GenderSelectCubit extends Cubit<List<Color>> {
  GenderSelectCubit() : super([kGenderActiveContainerColor,kContainerColor]);

  void changeColor(Color maleColor,Color femaleColor)=>emit([maleColor,femaleColor]);
}
