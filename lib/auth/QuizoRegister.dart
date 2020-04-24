import 'package:Quizo/auth/QuizoAuthService.dart';
import 'package:flutter/material.dart';
import 'package:Quizo/auth/QuizoLogIn.dart';



class QuizoRegister extends StatefulWidget {
  @override
  _QuizoRegisterState createState() => _QuizoRegisterState();
}

class _QuizoRegisterState extends State<QuizoRegister> {
  final AuthService _authService = AuthService();
  final _formkey = GlobalKey<FormState>();
  double opacityLevel = 0.0;

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 1 ? 0.0 : 1.0);
  }

  String email = '';
  String password = '';
  String error = '';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? QuizoLogIn()
        : Scaffold(
            resizeToAvoidBottomPadding: false,
            body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/loginback1.jpg',),
                      fit: BoxFit.fitHeight)),
              padding:
                  const EdgeInsets.only(top: 150.0, left: 50.0, right: 50.0),
              child: Form(
                key: _formkey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                        height: 100.0,
                        child: RichText(
                          text: TextSpan(
                            text: 'Create a free account ',
                            style: TextStyle(
                                fontFamily: 'Prestage',
                                color: Colors.black,
                                fontSize: 16.0),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'And score high to compete ',
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Enter Email',
                          hintStyle: TextStyle(fontFamily: 'Prestage')),
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Password ',
                          hintStyle: TextStyle(fontFamily: 'Prestage')),
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    MaterialButton(
                      child: Image.asset(
                        'icons/login.png',
                        height: 50.0,
                      ),
                      onPressed: () async {
                        if (_formkey.currentState.validate()) {
                          setState(() => loading = true);
                          dynamic result = await _authService
                              .registerWithEmailAndPassword(email, password);
                          if (result == null) {
                            setState(() => error = 'please use a valid email');
                            loading = false;
                          }
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    Text(
                      error,
                      style: TextStyle(fontFamily: 'Prestage'),
                    ),
                   
                    SizedBox(
                      height: 1.0,
                      width: 150.0,
                      child: Divider(
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: AnimatedOpacity(
                        opacity: opacityLevel,
                        duration: Duration(seconds: 1),
                        child: SizedBox(
                          width: 300.0,
                          height: 100.0,
                          child: Center(
                            child: Text(
                              'Hello Mr.Rocket! I know you have got great generel knowledge.Why do you wait? Showcase your remedies here! Answer the questions! Best of luck!',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Prestage',
                                  fontSize: 16.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 1.0, left: 250.0),
                      child: FloatingActionButton(
                        backgroundColor: Colors.lightBlueAccent,
                        child: Image.asset(
                          'icons/confused.png',
                          height: 100.0,
                        ),
                        onPressed: _changeOpacity,
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}
