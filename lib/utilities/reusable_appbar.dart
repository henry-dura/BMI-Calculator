import 'package:flutter/material.dart';
import 'package:body_mass_calculator/utilities/constants.dart';

class ReusableAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ReusableAppBar({
    super.key,
  });
  Size get preferredSize => AppBar().preferredSize;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('BMI CALCULATOR',style: kAppBarText,),
      centerTitle: true,
    );
  }
}