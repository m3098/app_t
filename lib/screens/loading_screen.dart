import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/stuff/music_observer.dart';

import '../widgets/rotation_animated_switcher.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  loading() async {
    await Future.delayed(Duration(seconds: 2));
    await FlameAudio.audioCache.loadAll([
      'crick.mp3',
      'humm.mp3',
      'select.mp3',
      'titlestart.mp3',
      'warn.mp3',
    ]);
    FlameAudio.bgm.play('main.mp3');
    MusicObserver().initState();

    context.go('/menu');
  }

  @override
  void initState() {
    loading();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotatingImageSwitcher(),
            SizedBox(
              height: 50,
            ),
            Text(
              'LOADING...',
              style: GoogleFonts.share(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ],
        )),
      ),
    );
  }
}
