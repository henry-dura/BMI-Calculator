import 'package:body_mass_calculator/logic/cubits/age_cubit.dart';
import 'package:body_mass_calculator/logic/cubits/calculate_cubit.dart';
import 'package:body_mass_calculator/logic/cubits/gender_select_cubit.dart';
import 'package:body_mass_calculator/logic/cubits/height_cubit.dart';
import 'package:body_mass_calculator/logic/cubits/weight_cubit.dart';
import 'package:flutter/material.dart';
import '../widgets/reusable_appbar.dart';
import '../widgets/reusable_container.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../constants/constants.dart';
import '../widgets/first_container_contents.dart';
import '../widgets/second_container_contents.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    late int currentHeight;
    late int currentWeight;
    return Scaffold(
      appBar: const ReusableAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: BlocBuilder<GenderSelectCubit, List<Color>>(
                builder: (context, color) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ReusableContainer(
                        bg: color[0],
                        content: const FirstContainerContent(
                          iconName: FontAwesomeIcons.mars,
                          gender: 'MALE',
                        ),
                        onpress: () {
                          BlocProvider.of<GenderSelectCubit>(context).changeColor(kGenderActiveContainerColor, kContainerColor);
                        },
                      ),
                      ReusableContainer(
                        bg: color[1],
                        content: const FirstContainerContent(
                          iconName: FontAwesomeIcons.venus,
                          gender: 'FEMALE',
                          // iconColor: genderContainerContentColor,
                        ),
                        onpress: () {
                          BlocProvider.of<GenderSelectCubit>(context).changeColor(kContainerColor, kGenderActiveContainerColor);
                        },
                      )
                    ],
                  );
                },
              ),
            ),
            ReusableContainer(
              content: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'HEIGHT',
                    style: kSmallTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      BlocBuilder<HeightCubit, int>(
                        builder: (context, state) {
                          currentHeight = state;
                          return Text(state.toString(),
                              style: kBigTextStyle);
                        },
                      ),
                      const Text(
                        'cm',
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                        thumbColor: Colors.red,
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: const Color(0x57A0A2B2),
                        thumbShape:
                        const RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayColor: Colors.red.withOpacity(0.22)),
                    child: BlocBuilder<HeightCubit, int>(
                      builder: (context, state) {
                        return Slider.adaptive(
                            value: state.toDouble(),
                            max: 200,
                            min: 100,
                            // divisions: 10,
                            onChanged: (double val) =>
                                BlocProvider.of<HeightCubit>(context)
                                    .currentHeight(val.toInt())
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ReusableContainer(
                    content: SecondContainerContent(
                      heading: 'WEIGHT',
                      displayValue: BlocBuilder<WeightCubit, int>(
                        builder: (context, state) {
                          currentWeight = state;
                          return Text(
                            state.toString(),
                            style: kBigTextStyle,
                          );
                        },
                      ),
                      cubit: BlocProvider.of<WeightCubit>(context),
                    ),
                  ),
                  ReusableContainer(
                    content: SecondContainerContent(
                      heading: 'AGE',
                      displayValue: BlocBuilder<AgeCubit, int>(
                        builder: (context, state) {
                          return Text(
                            state.toString(),
                            style: kBigTextStyle,
                          );
                        },
                      ),
                      cubit: BlocProvider.of<AgeCubit>(context),
                    ),
                  )
                ],
              ),
            ),
            FilledButton(
                onPressed: () {
                  BlocProvider.of<CalculateCubit>(context).calculate(
                      currentHeight, currentWeight);
                  Navigator.pushNamed(context, '/second');
                },
                child: const Text(
                  'CALCULATE YOUR BMI',
                  style: TextStyle(fontSize: 20),
                )),
          ],
        ),
      ),
    );;
  }
}


