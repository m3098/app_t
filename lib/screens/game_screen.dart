import 'dart:async';

import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/router/router.dart';

import '../stuff/global.dart';
import '../stuff/music_observer.dart';
import '../widgets/tile.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final int rows = 5 + dif;
  final int cols = 5 + dif;
  late List<List<int>> grid;
  late Timer _timer;
  Duration _remainingTime = Duration(minutes: (3 - dif));

  bool isFirst = true;

  @override
  void initState() {
    super.initState();

    resetGame();
    _startTimer();
  }

  void _startTimer() {
    if (!isFirst && _timer.isActive) {
      _timer.cancel();
    }
    isFirst = false;
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (_remainingTime.inSeconds <= 0) {
        context.replace('/game_over');
        timer.cancel();
      } else {
        setState(() {
          _remainingTime = _remainingTime - Duration(seconds: 1);
        });
      }
    });
  }

  void resetGame() {
    if (isAudio) {
      FlameAudio.play('titlestart.mp3');
    }
    setState(() {
      grid = List.generate(rows, (row) {
        return List.generate(cols, (col) {
          if (row == 0 || col == 0) {
            return 0;
          }
          return 1;
        });
      });
      _remainingTime = Duration(minutes: (3 - dif)); // Сброс таймера
    });
    _startTimer(); // Перезапуск таймера
  }

  void _onTileTap(int row, int col) {
    if (grid[row][col] != 0) {
      if (isAudio) {
        FlameAudio.play('crick.mp3');
      }
      setState(() {
        grid[row][col] = (grid[row][col] % 5) + 1;
      });
    }
  }

  String _formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes);
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height / 5,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/image_smallbg.png'),
                fit: BoxFit.cover,
                alignment: Alignment.bottomCenter,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width - 80,
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: cols,
              ),
              itemCount: rows * cols,
              itemBuilder: (context, index) {
                final row = index ~/ cols;
                final col = index % cols;
                if (row + col == 0) {
                  return SizedBox();
                }
                return Tile(
                  value: grid[row][col],
                  onTap: grid[row][col] != 0
                      ? () => _onTileTap(row, col)
                      : () {
                          if (isAudio) {
                            FlameAudio.play('humm.mp3');
                          }
                          _remainingTime -= Duration(seconds: 10);
                        },
                );
              },
            ),
          ),
          Stack(
            children: [
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationZ(3.14),
                child: Container(
                  height: MediaQuery.sizeOf(context).height / 5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/image_smallbg.png'),
                      fit: BoxFit.cover,
                      alignment: Alignment
                          .bottomCenter, // это обеспечит, что нижняя часть картинки будет видна
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          'assets/images/timer.png',
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'timer',
                              style: GoogleFonts.share(
                                  color: Colors.white.withOpacity(0.6),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 32,
                            ),
                            Text(
                              '${_formatTime(_remainingTime)}',
                              style: GoogleFonts.share(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: resetGame,
                      child: Image.asset(
                        'assets/images/button_restart.png',
                        height: 50,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
