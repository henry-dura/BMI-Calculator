import 'package:flutter/material.dart';
import 'reusable_container.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'container_contents.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int height = 120;
  int weight = 50;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ReusableContainer(
                  content: FirstContainerContent(
                      iconName: FontAwesomeIcons.mars, gender: 'MALE')),
              ReusableContainer(
                  content: FirstContainerContent(
                      iconName: FontAwesomeIcons.venus, gender: 'FEMALE'))
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
                  Text(height.toString(), style: kBigTextStyle),
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
                child: Slider.adaptive(
                  value: height.toDouble(),
                  max: 500,
                  min: 20,
                  // divisions: 10,
                  onChanged: (double val) => setState(() {
                    height = val.toInt();
                  }),
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
                content:
                    SecondContainerContent(heading: 'WEIGHT', value: weight),
              ),
              ReusableContainer(
                content: SecondContainerContent(heading: 'AGE', value: age),
              )
            ],
          ),
        ),
        FilledButtonTheme(
          data: const FilledButtonThemeData(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.red),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero)))),
          child: FilledButton(
              onPressed: () {print('calculated');},
              child: const Text(
                'CALCULATE YOUR BMI',
                style: TextStyle(fontSize: 20),
              )),
        ),

      ],
    );
  }
}
