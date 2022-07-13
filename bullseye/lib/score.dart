import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  final int totalScore;
  final int round;

  const Score({Key? key, required this.totalScore, required this.round})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextButton(
          onPressed: () {
            print('Start over!');
          },
          child: const Text('Start Over'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[const Text('Score: '), Text('$totalScore')],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: const <Widget>[Text('Round: '), Text('999')],
          ),
        ),
        TextButton(
          onPressed: () {
            print('Info!');
          },
          child: const Text('Info'),
        )
      ],
    );
  }
}
