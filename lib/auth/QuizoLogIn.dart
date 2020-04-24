import 'package:Quizo/ui/QuizoHomePage.dart';
import 'package:flutter/material.dart';
import 'package:Quizo/auth/QuizoAuthService.dart';



class QuizoLogIn extends StatefulWidget {
  @override
  _QuizoLogInState createState() => _QuizoLogInState();
}

class _QuizoLogInState extends State<QuizoLogIn> {
  final AuthService _authService = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;
  String email = '';
  String password = '';
  String error = '';
  bool selected = false;
  double opacityLevel = 0.0;

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 1 ? 0.0 : 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? HomePage()
        : Scaffold(
            resizeToAvoidBottomInset: false,
            resizeToAvoidBottomPadding: false,
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    colorFilter:
                        ColorFilter.mode(Colors.black12, BlendMode.darken),
                    image: AssetImage('assets/loginback1.jpg'),
                    fit: BoxFit.fitHeight),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 100.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                    child: SizedBox(
                        height: 50.0,
                        child: RichText(
                          text: TextSpan(
                            text: 'L ',
                            style: TextStyle(
                                fontFamily: 'Prestage',
                                color: Colors.yellowAccent,
                                fontSize: 26.0),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'O ',
                                  style: TextStyle(color: Colors.green)),
                              TextSpan(
                                  text: 'G',
                                  style: TextStyle(color: Colors.lightBlue)),
                              TextSpan(
                                  text: ' I',
                                  style: TextStyle(color: Colors.white)),
                              TextSpan(
                                  text: ' N',
                                  style: TextStyle(color: Colors.red)),
                            ],
                          ),
                        )),
                  ),
                  SizedBox(
                    width: 140.0,
                    height: 10.0,
                    child: Divider(
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 60.0, left: 60.0, right: 60.0, bottom: 0.0),
                    child: SizedBox(
                      height: 260.0,
                      child: Form(
                        key: _formkey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  hintText: 'Email',
                                  hintStyle: TextStyle(
                                      fontFamily: 'Prestage',
                                      color: Colors.white)),
                              validator: (val) =>
                                  val.isEmpty ? 'Enter a email' : null,
                              onChanged: (val) {
                                setState(() => email = val);
                              },
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                      fontFamily: 'Prestage',
                                      color: Colors.white)),
                              validator: (val) => val.length < 6
                                  ? 'Enter a password 6+ chars long '
                                  : null,
                              onChanged: (val) {
                                setState(() => password = val);
                              },
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              error,
                              style: TextStyle(
                                  fontFamily: 'Prestage', color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80.0,
                    child: Column(
                      children: <Widget>[
                        MaterialButton(
                          splashColor: Colors.transparent,
                          onPressed: () async {
                            {
                              if (_formkey.currentState.validate()) {
                                setState(() => loading = true);
                                dynamic result = await _authService
                                    .signInWithEmailAndPassword(
                                        email, password);
                                if (result == null)
                                  setState(() => error =
                                      'Could not sign in with those credentials');
                                loading = false;
                              }
                            }
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 150.0, top: 00.0),
                            child: Row(
                              children: <Widget>[
                                Image.asset(
                                  'icons/login.png',
                                  height: 50.0,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
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
                              text: 'Oh hey there ',
                              style: TextStyle(
                                  fontFamily: 'Prestage',
                                  color: Colors.white,
                                  fontSize: 16.0),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Rocket!.',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16.0)),
                                TextSpan(
                                    text:
                                        "You know that? The last game was quite fun! Wasn't it? But this time the objectives are a level above,Hope you can manage them.Have a surreal and best play boy ;)",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16.0)),
                              ],
                            ),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 00.0, left: 300.0),
                    child: FloatingActionButton(
                      backgroundColor: Colors.transparent,
                      child: Image.asset(
                        'icons/confused.png',
                        height: 100.0,
                      ),
                      onPressed: _changeOpacity,
                    ),
                  ),
                  //In case of adding functionality of social media plugins
                  /*SizedBox(
                    height: 0.0,width: 180.0,
                    child: Divider(color: Colors.black,)),
                
                SizedBox(
                  height: 50.0,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left:60.0),
                        child: MaterialButton(
                          splashColor: Colors.blue,
                          onPressed: (){},
                          child: Icon(EvaIcons.facebook),
                        ),
                      ),
                      MaterialButton(
                        splashColor: Colors.red,
                        onPressed: (){},
                        child: Icon(EvaIcons.google),
                      ),
                      MaterialButton(
                        splashColor: Colors.white,
                        onPressed: (){},
                        child: Icon(EvaIcons.linkedin),
                      ),

                    ],
                  ),
                )*/
                ],
              ),
            ));
  }
}
