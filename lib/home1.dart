import 'dart:math';

import 'package:flutter/material.dart';

class Home1Page extends StatefulWidget {
  const Home1Page({super.key});

  @override
  State<Home1Page> createState() => _Home1PageState();
}

class _Home1PageState extends State<Home1Page> with TickerProviderStateMixin {
  late AnimationController _rotateController;
  late Animation _rotateAnimation;

  @override
  void initState() {
    _rotateController = AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _rotateAnimation = Tween<double>(begin: 0, end: -(pi / 2)).animate(CurvedAnimation(parent: _rotateController, curve: Curves.bounceOut));

    _rotateController.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: AnimatedBuilder(
                  animation: _rotateAnimation,
                  builder: (context, child) {
                    return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()..rotateZ(_rotateAnimation.value),
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              Colors.red,
                              Colors.red,
                              Colors.blue,
                              Colors.blue,
                            ],
                            stops: [0.0, 0.5, 0.5, 1.0],
                            end: Alignment.centerLeft,
                            begin: Alignment.centerRight,
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
