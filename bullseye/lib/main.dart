import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'prompt.dart';
import 'control.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Prompt(targetValue: 100),
            const Control(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    print('Start over!');
                  },
                  child: const Text('Start Over'),
                ),
                const Text('Score: '),
                const Text('99999'),
                const Text('Round: '),
                const Text('999'),
                TextButton(
                  onPressed: () {
                    print('Info!');
                  },
                  child: const Text('Info'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
