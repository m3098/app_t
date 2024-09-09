import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_app/router/router.dart';

import '../stuff/music_observer.dart';
import '../widgets/gradient_button.dart';

class GameOptionsScreen extends StatefulWidget {
  const GameOptionsScreen({super.key});

  @override
  State<GameOptionsScreen> createState() => _GameOptionsScreenState();
}

class _GameOptionsScreenState extends State<GameOptionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SwitchListTile(
              title: Text(
                'AUDIO',
                style: TextStyle(fontSize: 18),
              ),
              value: isAudio,
              onChanged: (bool value) {
                setState(() {
                  isAudio = value;
                });
              },
              secondary: Icon(
                isAudio ? Icons.volume_up : Icons.volume_off,
                color: isAudio ? Colors.green : Colors.red,
              ),
            ),
            SwitchListTile(
              title: Text(
                'MUSIC',
                style: TextStyle(fontSize: 18),
              ),
              value: isMusic,
              onChanged: (bool value) {
                setState(() {
                  isMusic = value;
                  if (isMusic) {
                    FlameAudio.bgm.play('main.mp3');
                  } else {
                    FlameAudio.bgm.stop();
                  }
                });
              },
              secondary: Icon(
                isMusic ? Icons.music_note : Icons.music_off,
                color: isMusic ? Colors.green : Colors.red,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GradientButton(
                  text: 'go back'.toUpperCase(),
                  onPressed: () {
                    context.pop();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
