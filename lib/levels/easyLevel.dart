import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:page_transition/page_transition.dart';
import 'package:Quizo/ui/QuizoHomePage.dart';

class EasyLevel extends StatefulWidget {
  @override
  _EasyLevelState createState() => _EasyLevelState();
}

class _EasyLevelState extends State<EasyLevel> {
  help() {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 60.0, vertical: 30.0),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/splash.jpg'), fit: BoxFit.cover)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: SizedBox(
                height: 100.0,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.white, Colors.white60])),
                  child: Center(
                    child: Text(
                      'Hey there buddy ! These words looks jumbled,Arent they? Yes thats what the level is .Hey can you guess the right word and match them with their respective color? All the best!',
                      style: TextStyle(fontFamily: 'Gutter'),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  final Map<String, bool> score = {};

  //Main que and answers
  final Map choice = {
    'gtseebvale': Colors.green,
    'werflousn': Colors.yellow,
    'lyncdire': Colors.red,
    'gomarild flerow': Colors.orange,
    'aipddyrroctus': Colors.white,
    'lackb ordba': Colors.black,
    'rinjbal': Colors.purple,
    'ysk': Colors.lightBlue
  };
  int refresh = 0;
  AudioCache _audioCache = AudioCache();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          MaterialButton(
            onPressed: () => help(),
            child: Image.asset('icons/confused.png'),
          )
        ],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
                context,
                PageTransition(
                    child: HomePage(), type: PageTransitionType.downToUp));
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          'Score ${score.length} / 8',
          style: TextStyle(fontFamily: 'Gutter', color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(
          Icons.refresh,
          color: Colors.white,
        ),
        onPressed: () {
          setState(() {
            score.clear();
            refresh++;
          });
        },
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 805.0,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/easyback1.png'),
                  fit: BoxFit.cover)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: choice.keys.map((easy) {
                  return Draggable<String>(
                    data: easy,
                    child: Easy(
                        place:
                            score[easy] == true ? 'Dropped it clean!' : easy),
                    feedback: Easy(
                      place: easy,
                    ),
                    childWhenDragging: Easy(
                      place: 'Be confident',
                    ),
                  );
                }).toList(),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    choice.keys.map((emoji) => _buildDragtarget(emoji)).toList()
                      ..shuffle(Random(refresh)),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDragtarget(landed) {
    return DragTarget<String>(
      builder: (BuildContext context, List<String> incoming, List rejected) {
        if (score[landed] == true) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(25.0),
            child: Container(
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage('icons/trophy.png'))),
              height: 80,
              width: 100.0,
              alignment: Alignment.center,
            ),
          );
        } else {
          return ClipRRect(
            borderRadius: BorderRadius.circular(25.0),
            child: Container(
              color: choice[landed],
              height: 80.0,
              width: 100.0,
            ),
          );
        }
      },
      onWillAccept: (data) => data == landed,
      onAccept: (data) {
        setState(() {
          score[landed] = true;
        });
        _audioCache.play('success.mp3');
      },
      onLeave: (data) {
        _audioCache.play('error.mp3');
      },
    );
  }
}

class Easy extends StatelessWidget {
  Easy({Key key, this.place}) : super(key: key);
  final String place;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Material(
        color: Colors.transparent,
        child: Container(
          alignment: Alignment.center,
          height: 100.0,
          padding: const EdgeInsets.all(10.0),
          child: Text(
            place,
            style: TextStyle(
                color: Colors.black, fontSize: 16.0, fontFamily: 'Bangers'),
          ),
        ),
      ),
    );
  }
}
