import 'package:Quizo/auth/QuizoLogIn.dart';
import 'package:Quizo/auth/QuizoRegister.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class ShowPage extends StatefulWidget {
  @override
  _ShowPageState createState() => _ShowPageState();
}

class _ShowPageState extends State<ShowPage> {
  bool selected = false;
  double opacityLevel = 0.0;

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 1 ? 0.0 : 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
            image: AssetImage('assets/mainback.jpg'),
            fit: BoxFit.fitHeight),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 50.0,
          ),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(left: 150.0, top: 100.0),
              child: Row(
                children: <Widget>[
                  MaterialButton(
                    height: 20.0,
                    minWidth: 50.0,
                    splashColor: Colors.transparent,
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.upToDown,
                          child: QuizoRegister(),
                        ),
                      );
                    },
                    child: Image.asset(
                      'icons/books.png',
                      height: 80.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 20.0, bottom: 20.0),
            child: SizedBox(
                height: 50.0,
                child: RichText(
                  text: TextSpan(
                    text: 'New? ',
                    style: TextStyle(
                        fontFamily: 'Prestage',
                        color: Colors.black,
                        fontSize: 16.0),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Tap ',
                          style: TextStyle(
                              color: Colors.deepOrangeAccent, fontSize: 16.0)),
                      TextSpan(
                          text: 'to ',
                          style:
                              TextStyle(color: Colors.white, fontSize: 16.0)),
                      TextSpan(
                          text: 'register',
                          style: TextStyle(
                              color: Colors.lightBlue, fontSize: 16.0)),
                    ],
                  ),
                )),
          ),
          AnimatedOpacity(
            opacity: opacityLevel,
            duration: Duration(seconds: 1),
            child: Center(
              child: SizedBox(
                  width: 300.0,
                  height: 100.0,
                  child: RichText(
                    text: TextSpan(
                      text: 'Greetings! My name is ',
                      style: TextStyle(
                          fontFamily: 'Gutter',
                          color: Colors.white,
                          fontSize: 14.0),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'quinto.',
                            style:
                                TextStyle(color: Colors.black, fontSize: 14.0)),
                        TextSpan(
                            text:
                                'Welcome to Quizo.A fun and interactive quiz game app.Seek your IQ and answer the questions to gain points! If you are new to Quizo,register for free.Else,log in to answer new questions :)',
                            style:
                                TextStyle(color: Colors.white, fontSize: 14.0)),
                      ],
                    ),
                  )),
            ),
          ),
          SizedBox(
            width: 150.0,
            height: 10.0,
            child: Divider(
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 200.0,
            child: Column(
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    text: 'Already ',
                    style: TextStyle(
                        fontFamily: 'Prestage',
                        color: Colors.lightBlue,
                        fontSize: 18.0),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'have ',
                          style: TextStyle(color: Colors.greenAccent)),
                      TextSpan(
                          text: 'an', style: TextStyle(color: Colors.white)),
                      TextSpan(
                          text: ' account?',
                          style: TextStyle(color: Colors.black)),
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.downToUp,
                            child: QuizoLogIn()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 150.0, top: 30.0),
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          'icons/login.png',
                          height: 50.0,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 10.0),
                  child: SizedBox(
                    child: Center(
                      child: Text(
                        'Login',
                        style:
                            TextStyle(fontFamily: 'Prestage', fontSize: 18.0),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100.0, left: 300.0),
            child: FloatingActionButton(
              backgroundColor: Colors.transparent,
              child: Image.asset(
                'icons/confused.png',
                height: 100.0,
              ),
              onPressed: _changeOpacity,
            ),
          ),
        ],
      ),
    ));
  }
}
