import 'package:body_mass_calculator/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:body_mass_calculator/utilities/reusable_appbar.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

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
                  margin: EdgeInsets.symmetric(vertical: 15),
              color: Theme.of(context).primaryColor,
                  // width: double.infinity,
              child: const Text('content'),
            )),
            FilledButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SecondPage()),
                  );
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
