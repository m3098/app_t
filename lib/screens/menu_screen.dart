import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/router/router.dart';
import 'package:test_app/widgets/gradient_button.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/images/f${Random().nextInt(5)}.png'),
            Text(
              'GAME NAME',
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
                      text: 'START'.toUpperCase(),
                      onPressed: () {
                        context.push('/game');
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GradientButton(
                      text: 'change difficulty'.toUpperCase(),
                      onPressed: () {
                        context.push('/dif');
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GradientButton(
                      text: 'options'.toUpperCase(),
                      onPressed: () {
                        context.push('/options');
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GradientButton(
                      text: 'exit'.toUpperCase(),
                      onPressed: () {
                        exit(0);
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
