import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class CalculateCubit extends Cubit<double> {
  CalculateCubit() : super(0.0);

  void calculate(int height,int weight){
    double heightInMeters = height / 100;
    emit (weight / pow(heightInMeters, 2));
  }


}


// double calculateBMI() {
//   double heightInMeters = height / 100;
//   return (weight / pow(heightInMeters, 2));
// }