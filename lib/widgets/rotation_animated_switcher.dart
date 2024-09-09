import 'dart:async';

import 'package:flutter/material.dart';

class RotatingImageSwitcher extends StatefulWidget {
  @override
  _RotatingImageSwitcherState createState() => _RotatingImageSwitcherState();
}

class _RotatingImageSwitcherState extends State<RotatingImageSwitcher>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  int _currentImageIndex = 0;
  List<String> _images = [
    'assets/images/f0.png',
    'assets/images/f1.png',
    'assets/images/f2.png',
    'assets/images/f3.png',
    'assets/images/f4.png',
    'assets/images/f5.png'
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat();

    Timer.periodic(Duration(milliseconds: 200), (Timer timer) {
      setState(() {
        _currentImageIndex = (_currentImageIndex + 1) % _images.length;
      });
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller!,
      builder: (context, child) {
        return Transform.rotate(
          angle: _controller!.value * 2.0 * 3.14159,
          child: Image.asset(
            _images[_currentImageIndex],
            width: 100,
            height: 100,
          ),
        );
      },
    );
  }
}
