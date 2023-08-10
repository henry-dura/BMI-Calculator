import 'package:flutter/material.dart';
import 'customized_button.dart';
import 'constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FirstContainerContent extends StatelessWidget {
  const FirstContainerContent(
      {super.key, required this.iconName, required this.gender});
  final IconData iconName;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FaIcon(
          iconName,
          size: 60,
        ),
        Text(gender, style: kSmallTextStyle)
      ],
    );
  }
}


class SecondContainerContent extends StatelessWidget {
  const SecondContainerContent({
    super.key,
    required this.value,
    required this.heading,
  });

  final int value;
  final String heading;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          heading,
          style: kSmallTextStyle,
        ),
        Text(
          value.toString(),
          style: kBigTextStyle,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomButton(icon: FontAwesomeIcons.plus,),
            CustomButton(icon: FontAwesomeIcons.minus,)
          ],
        )
      ],
    );
  }
}

