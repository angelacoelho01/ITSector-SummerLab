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
          padding: EdgeInsets.all(8.0),
          child: Text('1'),
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
          padding: EdgeInsets.all(8.0),
          child: Text('100'),
        ),
      ],
    );
  }
}
