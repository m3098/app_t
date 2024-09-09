import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

class MusicObserver with WidgetsBindingObserver {
  void initState() {
    WidgetsBinding.instance.addObserver(this);
  }

  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (isMusic) {
      if (state == AppLifecycleState.paused) {
        FlameAudio.bgm.stop();
      } else if (state == AppLifecycleState.resumed) {
        FlameAudio.bgm.play('main.mp3');
      }
    }
  }
}

bool isAudio = true;
bool isMusic = true;
