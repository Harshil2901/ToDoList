import 'package:flutter/material.dart';

class Progress_Avatar extends StatefulWidget {
  const Progress_Avatar({Key? key}) : super(key: key);

  @override
  State<Progress_Avatar> createState() => _Progress_AvatarState();
}

class _Progress_AvatarState extends State<Progress_Avatar>
    with SingleTickerProviderStateMixin {
  Animation<double>? _animation;
  AnimationController? _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = Tween(begin: 0.0, end: 0.4).animate(_controller!)
      ..addListener(() {
        setState(() {});
      });

    _controller!.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 210),
      width: 110,
      height: 110,
      child: Stack(
        children: [
          CircularProgressIndicator(
            value: _animation!.value,
            strokeWidth: 4,
            valueColor: AlwaysStoppedAnimation(Color(0xFFFF00FF)),
            backgroundColor: Colors.grey.withOpacity(0.2),
          ),
          const Center(
              child: CircleAvatar(
                  radius: 45.0,
                  backgroundImage: AssetImage("assets/Avatar.png"))),
        ],
      ),
    );
  }
}
