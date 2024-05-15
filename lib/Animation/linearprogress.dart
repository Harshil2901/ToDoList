import 'package:flutter/material.dart';

class LineProgress extends StatefulWidget {
  final Color color;
  final double value;
  const LineProgress({super.key, required this.color, required this.value});

  State<LineProgress> createState() => _LineProgressState();
}

class _LineProgressState extends State<LineProgress>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _animation = Tween(begin: 0.0, end: 0.01).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: _animation.value + widget.value.toDouble() / 10,
      valueColor: AlwaysStoppedAnimation(widget.color),
      backgroundColor: Colors.purple,
    );
  }
}
