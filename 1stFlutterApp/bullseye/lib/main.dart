import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

import 'prompt.dart';
import 'control.dart';
import 'score.dart';
import 'game_model.dart';
import 'hit_me_button.dart';
import 'styled_button.dart';

void main() {
  runApp(const BullsEyeApp());
}

class BullsEyeApp extends StatelessWidget {
  const BullsEyeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
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
    _model = GameModel(_getRandomTargetValue());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage('images/background.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 48.0),
                child: Prompt(targetValue: _model.getTarget()),
              ),
              Control(
                model: _model,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: HitMeButton(
                  text: 'HIT ME',
                  onPressed: () {
                    _showAlert(context);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Score(
                    totalScore: _model.getTotalScore(),
                    round: _model.getRound(),
                    onStartOver: _restart),
              )
            ],
          ),
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

  int _getDifference() => (_model.getTarget() - _model.getCurrent()).abs();

  int _getRandomTargetValue() => Random().nextInt(100) + 1;

  void _restart() {
    setState(() {
      _model.setTotalScore(GameModel.scoreStart);
      _model.setRound(GameModel.roundStart);
      _model.setCurrent(GameModel.sliderStart);
      _model.setTarget(_getRandomTargetValue());
    });
  }

  void _showAlert(BuildContext context) {
    var okButton = StyledButton(
        icon: Icons.close,
        onPressed: () {
          Navigator.of(context).pop();
          setState(() {
            _model.addToTotalScore(_pointsForCurrentRound());
            _model.setTarget(_getRandomTargetValue());
            _model.nextRound();
          });
        });
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
