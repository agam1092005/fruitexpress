// ignore_for_file: file_names, invalid_use_of_visible_for_testing_member

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'Landing Page.dart';

class SplashStartScreen extends StatefulWidget {
  const SplashStartScreen({super.key});

  @override
  State<SplashStartScreen> createState() => _SplashStartScreenState();
}

class _SplashStartScreenState extends State<SplashStartScreen> {
  // final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                transitionsBuilder: (context, animation, animationTime, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                pageBuilder: (context, animation, animationTime) {
                  // return (auth.currentUser == null) ? const LandingPage() : const HomePage();
                  return const LandingPage();
                },
              ),
            ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: const Text(
            "FRUIT EXPRESS",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
              color: Colors.black,
            ),
          )
              .animate()
              .fadeIn()
              .scale(duration: 2.seconds)
              .blurXY(delay: 1.seconds, duration: 2.seconds),
        ),
      ),
    );
  }
}
