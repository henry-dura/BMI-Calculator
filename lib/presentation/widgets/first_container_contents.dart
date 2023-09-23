import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FirstContainerContent extends StatelessWidget {
  const FirstContainerContent(
      {super.key, required this.iconName, required this.gender, this.iconColor = kGenderContentInactive});
  final IconData iconName;
  final String gender;
  final Color iconColor;
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

