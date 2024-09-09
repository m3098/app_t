import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../stuff/global.dart';
import '../widgets/gradient_button.dart';

class DifOptionsScreen extends StatelessWidget {
  const DifOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'change\ndifficulty'.toUpperCase(),
              textAlign: TextAlign.center,
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
                      text: 'EASY'.toUpperCase(),
                      onPressed: () {
                        dif = 0;
                        context.pop();
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GradientButton(
                      text: 'MEDIUM'.toUpperCase(),
                      onPressed: () {
                        dif = 1;
                        context.pop();
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GradientButton(
                      text: 'HARD'.toUpperCase(),
                      onPressed: () {
                        dif = 2;
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
