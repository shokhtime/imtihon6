import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imtihon6/ui/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(context, CupertinoPageRoute(builder: (ctx) {
        return const HomeScreen();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Monex",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
