import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ova/home.dart';
import 'package:ova/login.dart';
import 'dart:async';
import 'package:ova/terms.dart';
import 'package:get/get.dart';
import 'language/1.dart';

final storage = GetStorage();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAZ0NaqyqdKLCFRYkqaapnJ7sWPgrubAPk",
      appId: "1:138770435296:android:d1bd7b8544c81912931485",
      messagingSenderId: "138770435296",
      projectId: "myotp-ff01c",
      storageBucket: "myotp-ff01c.appspot.com",
    ),
  );
  await GetStorage.init();
  runApp(GetMaterialApp(
    translations: LocalString(),
    locale: const Locale('en', 'US'),
    debugShowCheckedModeBanner: false,
    home: SplashScreen1Sub(),
  ));
}

class SplashScreen1Sub extends StatefulWidget {
  @override
  _SplashScreen1SubState createState() => _SplashScreen1SubState();
}

class _SplashScreen1SubState extends State<SplashScreen1Sub>
    with TickerProviderStateMixin {
  double _fontSize = 2;
  double _containerSize = 1.5;
  double _textOpacity = 0.0;
  double _containerOpacity = 0.0;

  late AnimationController _controller;
  late Animation<double> animation1;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    animation1 = Tween<double>(begin: 40, end: 20).animate(CurvedAnimation(
        parent: _controller, curve: Curves.fastLinearToSlowEaseIn))
      ..addListener(() {
        setState(() {
          _textOpacity = 1.0;
        });
      });

    _controller.forward();
    Timer(const Duration(seconds: 2), () {
      setState(() {
        _fontSize = 1.06;
      });
    });

    Timer(const Duration(seconds: 2), () {
      setState(() {
        _containerSize = 2;
        _containerOpacity = 1;
      });
    });

    Timer(const Duration(seconds: 4), () {
      setState(() {
        Navigator.push(
            context,
            PageTransition1(
              storage.read('term') == null
                  ? Terms()
                  : storage.read('login') == null
                      ? Login()
                      : MyHomePage(),
            ));
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Stack(
        children: [
          Column(
            children: [
              AnimatedContainer(
                  duration: const Duration(milliseconds: 2000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: _height / _fontSize),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 1000),
                opacity: _textOpacity,
                child: Text(
                  'Online Voting App',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: animation1.value,
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 2000),
              curve: Curves.fastLinearToSlowEaseIn,
              opacity: _containerOpacity,
              child: AnimatedContainer(
                  duration: const Duration(milliseconds: 2000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: _width / _containerSize,
                  width: _width / _containerSize,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image.asset('image/logo1.png', fit: BoxFit.cover)),
            ),
          ),
        ],
      ),
    );
  }
}

class PageTransition1 extends PageRouteBuilder {
  final Widget page;

  PageTransition1(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(milliseconds: 2000),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
              curve: Curves.fastLinearToSlowEaseIn,
              parent: animation,
            );
            return Align(
              alignment: Alignment.bottomCenter,
              child: SizeTransition(
                  sizeFactor: animation, child: page, axisAlignment: 0),
            );
          },
        );
}
