import 'package:flutter_app/core/util/generate_screen.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  void initState() {
    _controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
    _controller.forward();
      _controller.repeat(reverse: true, min: 0.9);
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, NameScreen.LOGIN_SCREEN);
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:
      ScaleTransition(
        scale: _animation,
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/ic_logo.png')
            )
          ),
        ),
      )),
    );
  }
}
