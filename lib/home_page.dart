import 'package:flutter/material.dart';
import 'reusable_container.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.mars,
                      size: 60,
                    ),
                    Text(
                      'MALE',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF6D7187)),
                    )
                  ],
                ),
              ),
              ReusableContainer(
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.venus,
                      size: 60,
                    ),
                    Text(
                      'FEMALE',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF6D7187)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        const ReusableContainer(
          content: Text('one'),
        ),
        const Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ReusableContainer(
                content: Text('one'),
              ),
              ReusableContainer(
                content: Text('one'),
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 60,
          margin: const EdgeInsets.symmetric(
            vertical: 15,
          ),
          color: Colors.red,
        ),
      ],
    );
  }
}
