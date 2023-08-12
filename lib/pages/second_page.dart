import 'package:body_mass_calculator/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:body_mass_calculator/utilities/reusable_appbar.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key, required this.resultBMI}) : super(key: key);
  final double resultBMI;

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ReusableAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding:  EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Your Results',
                style: kBigTextStyle,
              ),
            ),
            Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
              color: Theme.of(context).primaryColor,
                  // width: double.infinity,
              child:  Text(widget.resultBMI.toStringAsFixed(2)),
            )),
            FilledButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'RE-CALCULATE YOUR BMI',
                  style: TextStyle(fontSize: 20),
                )),
          ],
        ),
      ),
    );
  }
}
