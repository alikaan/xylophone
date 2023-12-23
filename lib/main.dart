import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(
    XylophoneApp()
);

class XylophoneApp extends StatelessWidget {

  void playSound({required int sound})
  {
    final player = AudioPlayer();
    player.play(AssetSource('note$sound.wav'));
  }

  Widget buildKey({required int soundCode, required String soundText, required Color soundColor}) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          playSound(sound: soundCode);
        },
        style: TextButton.styleFrom(
            backgroundColor: soundColor,
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0), // Set borderRadius to create a square shape
          ),
        ),
        child: Text(soundText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildKey(soundCode: 1, soundText: 'Do', soundColor: Colors.red),
                  buildKey(soundCode: 2, soundText: 'Re', soundColor: Colors.orange),
                  buildKey(soundCode: 3, soundText: 'Mi', soundColor: Colors.yellow),
                  buildKey(soundCode: 4, soundText: 'Fa', soundColor: Colors.green),
                  buildKey(soundCode: 5, soundText: 'Sol', soundColor: Colors.teal),
                  buildKey(soundCode: 6, soundText: 'La', soundColor: Colors.blue),
                  buildKey(soundCode: 7, soundText: 'Si', soundColor: Colors.purple),
                ],
              ),
            )
        ),
      ),
    );
  }
}
