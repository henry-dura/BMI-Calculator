import 'package:body_mass_calculator/business_logic/cubits/calculateCubit/calculate_cubit.dart';
import 'package:body_mass_calculator/presentation/constants/constants.dart';
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
                      if(state < 18.5){
                        displayHeading = 'You are Underweight';
                        displayText =  'UNDERWEIGHT';
                      }else{
                        displayHeading = 'You nklelel;';
                        displayText =  'UNDER';
                      }
                      return Column(children: [
                        Text(displayHeading),
                        Text(state.toStringAsFixed(2)),
                        Text(displayText),
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
