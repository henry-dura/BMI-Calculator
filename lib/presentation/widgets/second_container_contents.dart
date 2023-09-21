import 'package:body_mass_calculator/business_logic/cubits/weightCubit/weight_cubit.dart';
import 'package:flutter/material.dart';
import 'customized_button.dart';
import '../constants/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:body_mass_calculator/business_logic/cubits/weightCubit/weight_cubit.dart';


class SecondContainerContent extends StatelessWidget {
  SecondContainerContent({Key? key,required this.heading,required this.displayValue, required this.cubit}) : super(key: key);
  final String heading;
  Widget displayValue;
  final cubit;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          heading,
          style: kSmallTextStyle,
        ),
        displayValue,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomButton(icon: FontAwesomeIcons.plus,onPress:(){cubit.increase();}),
            CustomButton(icon: FontAwesomeIcons.minus,onPress: (){cubit.decrease();})
          ],
        )
      ],
    );
  }
}
