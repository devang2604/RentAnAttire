import 'dart:async';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:loginpage/pages/collectionglimpse.dart';
import 'package:lottie/lottie.dart';
import 'package:nice_buttons/nice_buttons.dart';

class IntroPage extends StatefulWidget {
  IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage>
    with SingleTickerProviderStateMixin {
  late List<AnimatedTextExample> _examples;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _examples = animatedTextExamples(onTap: () {
      print('Tap Event');
    });
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut.flipped,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FadeTransition(
        opacity: _animation,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/logo.png",
              width: 250,
              height: 100,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white),
              height: 200.0,
              width: double.infinity,
              child: Center(
                key: const ValueKey('Typer'),
                child: _examples[0].child,
              ),
            ),
            Lottie.asset('assets/fashion.json', width: 200),
            NiceButtons(
              stretch: false,
              progress: true,
              gradientOrientation: GradientOrientation.Vertical,
              onTap: (finish) {
                print('On tap called');
                Timer(Duration(seconds: 2), () {
                  finish();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CollectionGlimpse(),
                    ),
                  );
                });
              },
              child: const Text(
                'Explore The Fashion',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedTextExample {
  final String label;
  final Color? color;
  final Widget child;

  AnimatedTextExample({
    required this.label,
    required this.color,
    required this.child,
  });
}

List<AnimatedTextExample> animatedTextExamples({VoidCallback? onTap}) =>
    <AnimatedTextExample>[
      AnimatedTextExample(
        label: 'Typer',
        color: Colors.white,
        child: AnimatedTextKit(
          animatedTexts: [
            TyperAnimatedText(
              'Rent, Repeat, Return',
              textStyle: const TextStyle(
                fontSize: 28.0,
                fontFamily: 'Niconne',
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              speed: Duration(milliseconds: 250),
            ),
          ],
          onTap: onTap,
          totalRepeatCount: 1,
        ),
      ),
    ];
