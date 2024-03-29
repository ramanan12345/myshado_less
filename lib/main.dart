import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainApp(),
    );
  }
}

class MainApp extends StatefulWidget {
  @override
  MainAppState createState() => MainAppState();
}

class MainAppState extends State<MainApp> with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(seconds: 8),
      vsync: this,
    )..repeat();
  }

  Animatable<Color> background = TweenSequence<Color>([
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: Colors.blueAccent,
        end: Colors.greenAccent,
      ),
    ),
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: Colors.greenAccent,
        end: Colors.pinkAccent,
      ),
    ),
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: Colors.pinkAccent,
        end: Colors.orangeAccent,
      ),
    ),
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: Colors.orangeAccent,
        end: Colors.blueAccent,
      ),
    ),
  ]);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return Scaffold(
            body: Container(
                constraints: BoxConstraints.expand(),
                color: background.evaluate(AlwaysStoppedAnimation(animationController.value)),
                child: Center(
                  child: Text(
                    'Background Color  CREATED BY MEwith Animation in Flutter',
                    style: TextStyle(color: Colors.white, fontSize: 42, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                )),
          );
        });
  }
}
