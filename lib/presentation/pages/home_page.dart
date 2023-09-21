import 'package:body_mass_calculator/business_logic/cubits/ageCubit/age_cubit.dart';
import 'package:body_mass_calculator/business_logic/cubits/calculateCubit/calculate_cubit.dart';
import 'package:body_mass_calculator/business_logic/cubits/heightCubit/height_cubit.dart';
import 'package:body_mass_calculator/business_logic/cubits/weightCubit/weight_cubit.dart';
import 'package:flutter/material.dart';
import '../widgets/reusable_appbar.dart';
import '../widgets/reusable_container.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/constants.dart';
import '../widgets/first_container_contents.dart';
import '../widgets/second_container_contents.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


enum Gender { male, female }

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


   late int _currentHeight;
   late int _currentWeight;


  Color genderMaleContainerColor = kGenderActiveContainerColor;
  Color genderFemaleContainerColor = kContainerColor;

  // Color genderContainerContentColor = kGenderContentInactive;

  void genderActive(Gender gender) {
    setState(() {
      gender == Gender.male
          ? genderMaleContainerColor = kGenderActiveContainerColor
          : genderMaleContainerColor = kContainerColor;
      gender == Gender.female
          ? genderFemaleContainerColor = kGenderActiveContainerColor
          : genderFemaleContainerColor = kContainerColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppBar(),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ReusableContainer(
                    bg: genderMaleContainerColor,
                    content: const FirstContainerContent(
                      iconName: FontAwesomeIcons.mars,
                      gender: 'MALE',
                    ),
                    onpress: () {
                      genderActive(Gender.male);
                    },
                  ),
                  ReusableContainer(
                    bg: genderFemaleContainerColor,
                    content: const FirstContainerContent(
                      iconName: FontAwesomeIcons.venus,
                      gender: 'FEMALE',
                      // iconColor: genderContainerContentColor,
                    ),
                    onpress: () {
                      genderActive(Gender.female);
                    },
                  )
                ],
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
                      BlocBuilder<HeightCubit, HeightState>(
                        builder: (context, state) {
                          _currentHeight = state.height;
                          return Text(state.height.toString(), style: kBigTextStyle);
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
                    child: BlocBuilder<HeightCubit, HeightState>(
                      builder: (context, state) {
                        return Slider.adaptive(
                            value: state.height.toDouble(),
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
                      displayValue: BlocBuilder<WeightCubit, WeightState>(
                        builder: (context, state) {
                          _currentWeight = state.weight;
                          return Text(
                            state.weight.toString(),
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
                      displayValue: BlocBuilder<AgeCubit, AgeState>(
                        builder: (context, state) {
                          return Text(
                            state.age.toString(),
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
                  BlocProvider.of<CalculateCubit>(context).calculate(_currentHeight, _currentWeight);
                  Navigator.pushNamed(context, '/second');
                },
                child: const Text(
                  'CALCULATE YOUR BMI',
                  style: TextStyle(fontSize: 20),
                )),
          ],
        ),
      ),
    );
  }
}
