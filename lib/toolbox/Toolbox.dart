import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: <Widget>[
          Image.asset(
            'icons/book.png',
            height: 50.0,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'Quizo Beta',
              style: TextStyle(fontFamily: 'Prestage', fontSize: 22.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Quizo is exclusively designed to make all the IQ activities fun.The Three different levels are intended as per level of difficulty.All the terminology used under Quizo is private and protected.The basic motion posters are under the policy of the company.Enough now ,Lets have a round? All the best :)',
              style: TextStyle(fontFamily: 'Gutter', color: Colors.amber),
            ),
          )
        ],
      ),
    );
  }
}

class Gifts extends StatefulWidget {
  @override
  _GiftsState createState() => _GiftsState();
}

class _GiftsState extends State<Gifts> {
  gift1() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(color: Colors.pink),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: SizedBox(
                child: Image.asset(
                  'icons/gift4.png',
                  height: 200.0,
                ),
              ),
            ),
          );
        });
  }

  gift2() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(color: Colors.transparent),
            child: SizedBox(
              child: Image.asset(
                'icons/gift5.png',
                height: 200.0,
              ),
            ),
          );
        });
  }

  gift3() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(color: Colors.orange),
            child: SizedBox(
              child: Image.asset(
                'icons/gift6.png',
                height: 200.0,
              ),
            ),
          );
        });
  }

  gift4() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(color: Colors.lightBlue),
            child: SizedBox(
              child: Image.asset(
                'icons/gift7.png',
                height: 200.0,
              ),
            ),
          );
        });
  }

  gift5() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(color: Colors.red),
            child: SizedBox(
              child: Image.asset(
                'icons/gift8.png',
                height: 200.0,
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(50.0),
      child: Container(
        height: 320.0,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.lightBlue, Colors.red])),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 58.0),
              child: MaterialButton(
                  onPressed: () => gift2(),
                  child: Image.asset(
                    'icons/gift.png',
                    height: 60.0,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Row(
                children: <Widget>[
                  MaterialButton(
                      onPressed: () => gift4(),
                      child: Image.asset(
                        'icons/gift1.png',
                        height: 60.0,
                      )),
                  MaterialButton(
                      onPressed: () => gift1(),
                      child: Image.asset(
                        'icons/gift1.png',
                        height: 60.0,
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Row(
                children: <Widget>[
                  MaterialButton(
                      onPressed: () => gift2(),
                      child: Image.asset(
                        'icons/gift2.png',
                        height: 60.0,
                      )),
                  MaterialButton(
                      onPressed: () => gift3(),
                      child: Image.asset(
                        'icons/gift2.png',
                        height: 60.0,
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Row(
                children: <Widget>[
                  MaterialButton(
                      onPressed: () => gift4(),
                      child: Image.asset(
                        'icons/gift.png',
                        height: 60.0,
                      )),
                  MaterialButton(
                      onPressed: () => gift5(),
                      child: Image.asset(
                        'icons/gift.png',
                        height: 60.0,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
