import 'package:flutter/material.dart';

class ReusableContainer extends StatelessWidget {
  const ReusableContainer({
    super.key,
    required this.content,
  });
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: content,
        // padding: EdgeInsets.symmetric(vertical:2),
        margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(
              20.0), // Specify the border radius here
        ),
      ),
    );
  }
}
