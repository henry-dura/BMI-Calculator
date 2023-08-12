import 'package:body_mass_calculator/utilities/constants.dart';
import 'package:flutter/material.dart';

class ReusableContainer extends StatelessWidget {
  const ReusableContainer({
    super.key,
    required this.content,
    this.bg = kContainerColor,
    this.onpress ,
  });
  final Widget content;
  final Color bg;
  final onpress;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onpress,
        child: Container(
          child: content,
          // padding: EdgeInsets.symmetric(vertical:2),
          margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(
                20.0), // Specify the border radius here
          ),
        ),
      ),
    );
  }
}
