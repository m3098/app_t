import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/router/router.dart';

import '../widgets/gradient_button.dart';

class GameOverScreen extends StatelessWidget {
  const GameOverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/images/f${Random().nextInt(5)}.png'),
            Text(
              'GAME OVER',
              style: GoogleFonts.share(
                  color: Colors.black,
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GradientButton(
                      text: 'GO BACK'.toUpperCase(),
                      onPressed: () {
                        context.pop();
                      }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
