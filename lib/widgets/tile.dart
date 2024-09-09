import 'package:flutter/material.dart';

import '../stuff/global.dart';

class Tile extends StatefulWidget {
  final int value;
  final VoidCallback? onTap;

  const Tile({Key? key, required this.value, this.onTap}) : super(key: key);

  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceOut,
    );
  }

  @override
  Widget build(BuildContext context) {

    final imagePath = 'assets/images/f${widget.value}.png';

    return GestureDetector(
      onTap: () {
        _controller.forward().then((_) {
          _controller.reverse();
        });
        if (widget.onTap != null) {
          widget.onTap!();
        }
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: 1 + _animation.value * 0.1, // Увеличение плитки при нажатии
            child: Container(
              margin: EdgeInsets.all(12),

              child: Center(
                child: Image.asset(imagePath),
              ),
            ),
          );
        },
      ),
    );
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}