import 'package:Quizo/levels/easyLevel.dart';
import 'package:Quizo/levels/hardLevel.dart';
import 'package:Quizo/levels/mediumLevel.dart';
import 'package:Quizo/toolbox/Toolbox.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  about() {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/about.jpg'), fit: BoxFit.cover)),
            padding:
                const EdgeInsets.symmetric(vertical: 30.0, horizontal: 60.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(25.0), child: About()),
          );
        });
  }

  gifts() {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/gifts.jpg'), fit: BoxFit.cover)),
            padding:
                const EdgeInsets.symmetric(vertical: 30.0, horizontal: 80.0),
            child: Gifts(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            resizeToAvoidBottomPadding: false,
            body: SingleChildScrollView(
                child:
                    Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: SizedBox(
                      child: Container(
                    height: 160.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/upp.jpg'),
                            fit: BoxFit.cover)),
                    child: Center(
                      child: SizedBox(
                        height: 80.0,
                        width: 150.0,
                        child: Container(
                          decoration: BoxDecoration(color: Colors.transparent),
                          child: Center(
                              child: Text(
                            'QUIZO',
                            style: TextStyle(
                                fontFamily: 'Rockdiz',
                                fontSize: 70.0,
                                color: Colors.white),
                          )),
                        ),
                      ),
                    ),
                  ))),
              ClipRRect(
                clipBehavior: Clip.hardEdge,
                borderRadius: BorderRadius.circular(0.0),
                child: SizedBox(
                  height: 480.0,
                  width: 480.0,
                  child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              colorFilter: ColorFilter.mode(
                                  Colors.black87, BlendMode.darken),
                              image: AssetImage('assets/new.jpg'),
                              fit: BoxFit.cover)),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 50.0,
                            width: 130.0,
                            child: Container(
                              decoration:
                                  BoxDecoration(color: Colors.redAccent),
                              child: Center(
                                  child: Text(
                                'Select Level',
                                style: TextStyle(
                                    fontFamily: 'Gutter', fontSize: 20.0),
                              )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 80.0),
                            child: SizedBox(
                              width: 100.0,
                              height: 60.0,
                              child: MaterialButton(
                                splashColor: Colors.black,
                                color: Colors.lightBlue,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          child: EasyLevel(),
                                          type:
                                              PageTransitionType.leftToRight));
                                },
                                child: Row(
                                  children: <Widget>[
                                    Icon(FontAwesomeIcons.earlybirds),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        'Easy',
                                        style: TextStyle(
                                            fontFamily: 'Gutter',
                                            fontSize: 18.0),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 50.0),
                            child: SizedBox(
                              width: 110.0,
                              height: 60.0,
                              child: MaterialButton(
                                splashColor: Colors.black,
                                color: Colors.lightBlue,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          child: Mediumlevel(),
                                          type: PageTransitionType.upToDown));
                                },
                                child: Row(
                                  children: <Widget>[
                                    Icon(FontAwesomeIcons.weibo),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        'Medium',
                                        style: TextStyle(
                                            fontFamily: 'Gutter',
                                            fontSize: 16.0),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 50.0),
                            child: SizedBox(
                              width: 110.0,
                              height: 60.0,
                              child: MaterialButton(
                                splashColor: Colors.black,
                                color: Colors.lightBlue,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          child: HardLevel(),
                                          type:
                                              PageTransitionType.rightToLeft));
                                },
                                child: Row(
                                  children: <Widget>[
                                    Icon(FontAwesomeIcons.brain),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        'Hard',
                                        style: TextStyle(
                                            fontFamily: 'Gutter',
                                            fontSize: 18.0),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      )),
                ),
              ),
              ClipRRect(
                  clipBehavior: Clip.hardEdge,
                  borderRadius: BorderRadius.circular(0.0),
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: SizedBox(
                        height: 180.0,
                        child: Container(
                            height: 180.0,
                            width: 400,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/down.jpg'),
                                    fit: BoxFit.cover)),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 80.0),
                                  child: MaterialButton(
                                    color: Colors.red,
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              child: gifts(),
                                              type:
                                                  PageTransitionType.downToUp));
                                    },
                                    child: Row(
                                      children: <Widget>[
                                        Icon(Icons.card_giftcard),
                                        Text(
                                          'Gifts',
                                          style:
                                              TextStyle(fontFamily: 'Gutter'),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: MaterialButton(
                                    color: Colors.red,
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              child: about(),
                                              type:
                                                  PageTransitionType.downToUp));
                                    },
                                    child: Row(
                                      children: <Widget>[
                                        Icon(Icons.info_outline),
                                        Text(
                                          'About',
                                          style:
                                              TextStyle(fontFamily: 'Gutter'),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ))),
                  ))
            ]))));
  }
}
