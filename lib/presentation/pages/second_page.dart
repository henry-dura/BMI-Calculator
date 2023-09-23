import 'package:body_mass_calculator/logic/cubits/calculate_cubit.dart';
import 'package:body_mass_calculator/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:body_mass_calculator/presentation/widgets/reusable_appbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);


  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ReusableAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Your Results',
                style: kBigTextStyle,
              ),
            ),
            Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  color: Theme
                      .of(context)
                      .primaryColor,
                  // width: double.infinity,
                  child: BlocBuilder<CalculateCubit, double>(
                    builder: (context, state) {
                      String displayHeading;
                      String displayText;
                      String bmiRange;
                      Color colorType;
                      if(state < 18.5){
                        displayHeading = 'Underweight';
                        displayText =  'You are in the underweight range.\n Improve your diet !!!!';
                        bmiRange = 'UnderWeight BMI Range: \n Below 18.5 kg/m2';
                        colorType = Colors.red;
                      }else if(state >= 18.5 && state <= 24.9 ){
                        displayHeading = 'Normal';
                        displayText =  'You are in the healthy BMI range.\n Good job !!!!';
                        bmiRange = 'Normal BMI Range: \n 18.5 - 24.9 kg/m2';
                        colorType = Colors.green;
                      }else if(state >= 25 && state <= 29.9){
                        displayHeading = 'Overweight';
                        displayText =  'You are in the overweight range.\n Hit the Gym !!!!';
                        bmiRange = 'OverWeight BMI Range:\n  25 - 29.9 kg/m2';
                        colorType = Colors.blue;
                      }else{
                        displayHeading = 'Obese';
                        displayText =  'You are in the obese range.\n Seek medical help !!!!';
                        bmiRange = 'Obese BMI Range:\n  Above 29.9 kg/m2';
                        colorType = Colors.red;
                      }
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                        Text(displayHeading.toUpperCase(),style: TextStyle(color: colorType,fontSize: 30),),
                        Text(state.toStringAsFixed(2),style: const TextStyle(fontSize: 90,fontWeight: FontWeight.w900),),
                        Text(bmiRange,style: kSmallTextStyle,textAlign: TextAlign.center,) ,
                        Text(displayText,style: kSmallTextStyle,textAlign: TextAlign.center,),
                      ],);
                    },
                  ),
                )),
            FilledButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'RE-CALCULATE YOUR BMI',
                  style: TextStyle(fontSize: 20),
                )),
          ],
        ),
      ),
    );
  }
}
