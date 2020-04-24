import 'dart:async';
import 'package:Quizo/ui/Quizoinitial.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:page_transition/page_transition.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        (){Navigator.push(context, PageTransition(child: ShowPage(),type: PageTransitionType.rightToLeftWithFade));});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
      width: 400.0,
      decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(Colors.black87, BlendMode.darken),
              image: AssetImage(
                'assets/splash.jpg',
              ),
              fit: BoxFit.cover)),
      child: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 250.0),
          child: RichText(
              text: TextSpan(
                text: 'Q ',
                style: TextStyle(
                    fontFamily: 'Bangers',
                    color: Colors.green,
                    fontSize: 60.0),
                children: <TextSpan>[
                  TextSpan(
                      text: 'U ', style: TextStyle(color: Colors.lightBlue)),
                  TextSpan(text: 'I ', style: TextStyle(color: Colors.red)),
                  TextSpan(text: 'Z ', style: TextStyle(color: Colors.yellow)),
                  TextSpan(text: 'O', style: TextStyle(color: Colors.pink)),
                ],
              ),
            ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: SpinKitFadingFour(
            color: Colors.redAccent,
          ),
        )
      ]),
    )));
  }
}
