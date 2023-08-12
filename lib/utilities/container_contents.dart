import 'package:flutter/material.dart';
import 'customized_button.dart';
import 'constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:body_mass_calculator/pages/home_page.dart';

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




class SecondContainerContent extends StatefulWidget {
  SecondContainerContent({Key? key,required this.value,required this.heading}) : super(key: key);

  int value;
  final String heading;



  @override
  State<SecondContainerContent> createState() => _SecondContainerContentState();
}
class _SecondContainerContentState extends State<SecondContainerContent> {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          widget.heading,
          style: kSmallTextStyle,
        ),
        Text(
        widget.value.toString(),
          style: kBigTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomButton(icon: FontAwesomeIcons.plus,onPress:(){setState(() {
              widget.value++;
            });},),
            CustomButton(icon: FontAwesomeIcons.minus,onPress: (){setState(() {
              widget.value--;
            });},)
          ],
        )
      ],
    );;
  }
}
