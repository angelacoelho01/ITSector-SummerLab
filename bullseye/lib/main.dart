import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

import 'prompt.dart';
import 'control.dart';
import 'score.dart';
import 'game_model.dart';

void main() {
  runApp(const BullsEyeApp());
}

class BullsEyeApp extends StatelessWidget {
  const BullsEyeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    return const MaterialApp(
      title: 'Bullseye',
      home: GamePage(),
    );
  }
}

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late GameModel _model;

  @override
  void initState() {
    super.initState();
    _model = GameModel(Random().nextInt(100) + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Prompt(targetValue: _model.getTarget()),
            Control(
              model: _model,
            ),
            TextButton(
              onPressed: () {
                _showAlert(context);
              },
              child: const Text(
                'Hit Me!',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            Score(totalScore: _model.getTotalScore(), round: _model.getRound())
          ],
        ),
      ),
    );
  }

  int _pointsForCurrentRound() {
    const maximumScore = 100;
    var difference = _getDifference();
    var bonus = 0;
    if (difference == 0) {
      bonus += 100;
    } else if (difference == 1) {
      bonus += 50;
    }
    return maximumScore - difference + bonus;
  }

  String _alertTitle() {
    String title;
    var difference = _getDifference();

    if (difference == 0) {
      title = 'Perfect!';
    } else if (difference < 5) {
      title = 'You almost had it!';
    } else if (difference <= 10) {
      title = 'Not bad.';
    } else {
      title = 'Are you even trying?';
    }

    return title;
  }

  int _getDifference() => return (_model.getTarget() - _model.getCurrent()).abs();

  void _showAlert(BuildContext context) {
    var okButton = TextButton(
        onPressed: () {
          Navigator.of(context).pop();
          setState(() {
            _model.addToTotalScore(_pointsForCurrentRound());
            _model.setTarget(Random().nextInt(100) + 1);
            _model.nextRound();
          });
        },
        child: const Text('Awesome!'));

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(_alertTitle()),
            content: Text('The slider\'s value is ${_model.getCurrent()}.\n'
                'You scored ${_pointsForCurrentRound()} points this round!'),
            actions: [
              okButton,
            ],
            elevation: 5, // z position
          );
        });
  }
}
