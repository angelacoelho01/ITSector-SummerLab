import 'package:flutter/material.dart';

import 'game_model.dart';

class Control extends StatefulWidget {
  final GameModel model;

  const Control({Key? key, required this.model}) : super(key: key);

  @override
  State<Control> createState() => _ControlState();
}

class _ControlState extends State<Control> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(left: 90.0),
          child: Text(
            '1',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Slider(
            value: widget.model.getCurrent().toDouble(),
            onChanged: (newValue) {
              setState(() {
                widget.model.setCurrent(newValue.toInt());
              });
            },
            min: 1.0,
            max: 100.0,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 90.0),
          child: Text(
            '100',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
