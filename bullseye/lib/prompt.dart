import 'package:flutter/material.dart';
import 'text_styles.dart';

class Prompt extends StatelessWidget {
  final int targetValue;

  const Prompt({Key? key, required this.targetValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'PUT THE BULSEYE AS CLOSE AS YOU CAN TO',
          style: LabelTextStyle.bodyText1(context),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('$targetValue'),
        ),
      ],
    );
  }
}
