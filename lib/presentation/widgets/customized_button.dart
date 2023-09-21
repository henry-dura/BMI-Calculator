import 'package:body_mass_calculator/presentation/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.icon,
    required this.onPress ,
  });
  final IconData icon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      elevation: 6,
      fillColor: kGenderActiveContainerColor,
      constraints: const BoxConstraints.tightFor(
        width: 60.0,
        height: 50.0,
      ),
      shape: const CircleBorder(),
      child: FaIcon(icon),
    );
  }
}