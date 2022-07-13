import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    _model = GameModel(50);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Prompt(targetValue: 100),
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

  void _showAlert(BuildContext context) {
    var okButton = TextButton(
        onPressed: () {
          Navigator.of(context).pop();
          print('Awesome pressed!');
        },
        child: const Text('Awesome!'));

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Hello there!'),
            content: Text('The slider\'s value is ${_model.getCurrent()}!'),
            actions: [
              okButton,
            ],
            elevation: 5, // z position
          );
        });
  }
}
