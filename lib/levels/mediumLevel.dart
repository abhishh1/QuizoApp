import 'dart:async';
import 'dart:convert';
import 'package:Quizo/models/QueJson.dart';
import 'package:Quizo/ui/QuizoHomePage.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:page_transition/page_transition.dart';
import 'dart:math';

class Mediumlevel extends StatefulWidget {
  @override
  _MediumlevelState createState() => _MediumlevelState();
}

class _MediumlevelState extends State<Mediumlevel> {
  int score = 0;

  QuizoQue quiz;
  List<Results> results;
  Color c;
  Random random = Random();
  @override
  void initState() {
    super.initState();
  }

  Future<void> fetchQuestions() async {
    var res = await http.get("https://opentdb.com/api.php?amount=20");
    var decRes = jsonDecode(res.body);
    print(decRes);
    c = Colors.black;
    quiz = QuizoQue.fromJson(decRes);
    results = quiz.results;
  }

  @override
  Widget build(BuildContext context) {
    help() {
      return showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 60.0, vertical: 30.0),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/splash.jpg'),
                      fit: BoxFit.cover)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: SizedBox(
                  height: 100.0,
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white60),
                    child: Text(
                      'One level up dude!Listen,Here is some question and answer stuff.Solve them quickly and jump on the next level.Stuck?Refresh the page by hitting the refresh button for new questions.But if swapping will be more than 5,You will be out.All the best:)',
                      style: TextStyle(fontFamily: 'Gutter'),
                    ),
                  ),
                ),
              ),
            );
          });
    }

    if (score.toInt() == 5) {
      return HomePage();
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          setState(() {
            score += 1;
          });
        },
        child: Icon(
          Icons.refresh,
          color: Colors.lightBlue,
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Swapped ${score.toString()} / 5',
          style: TextStyle(fontFamily: 'Gutter', color: Colors.white),
        ),
        backgroundColor: Colors.black,
        actions: <Widget>[
          MaterialButton(
            onPressed: () => help(),
            child: Image.asset('icons/confused.png'),
          )
        ],
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.push(
                context,
                PageTransition(
                    child: HomePage(), type: PageTransitionType.leftToRight));
          },
        ),
      ),
      body: Container(
        height: 750.0,
        child: RefreshIndicator(
          color: Colors.black,
          onRefresh: fetchQuestions,
          child: FutureBuilder(
              future: fetchQuestions(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Text('Hey There! Refresh to start');
                  case ConnectionState.active:
                  case ConnectionState.waiting:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  case ConnectionState.done:
                    if (snapshot.hasError) return errorData(snapshot);
                    return questionList();
                }
                return null;
              }),
        ),
      ),
    );
  }

  Padding errorData(AsyncSnapshot snapshot) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Error: ${snapshot.error}',
          ),
          SizedBox(
            height: 20.0,
          ),
          RaisedButton(
            child: Text("Try Again"),
            onPressed: () {
              fetchQuestions();
              setState(() {});
            },
          )
        ],
      ),
    );
  }

  ListView questionList() {
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) => Card(
        color: Colors.lightBlueAccent,
        child: ExpansionTile(
          title: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  results[index].question,
                  style: TextStyle(fontSize: 16.0, fontFamily: 'Gutter'),
                ),
              ],
            ),
          ),
          children: results[index].allAnswers.map((m) {
            return AnswerWidget(results, index, m, score);
          }).toList(),
        ),
      ),
    );
  }
}

class AnswerWidget extends StatefulWidget {
  final List<Results> results;
  final int index;
  final String m;
  int score = 0;

  AnswerWidget(this.results, this.index, this.m, this.score);

  @override
  _AnswerWidgetState createState() => _AnswerWidgetState();
}

class _AnswerWidgetState extends State<AnswerWidget> {
  int score = 0;
  AudioCache _audioCache = AudioCache();
  Color c = Colors.white;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        setState(() {
          if (widget.m == widget.results[widget.index].correctAnswer) {
            _audioCache.play('success.mp3');
            score += 1;
            return totalscore();
          } else {
            c = Colors.black;
            _audioCache.play('error.mp3');
          }
        });
      },
      title: Text(
        widget.m,
        textAlign: TextAlign.center,
        style: TextStyle(color: c, fontFamily: 'Gutter'),
      ),
    );
  }

  totalscore() {
    return showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return ClipRRect(borderRadius: BorderRadius.circular(25.0),
                      child: Container(
              decoration: BoxDecoration(color: Colors.white),
              child: Text(
                'Score +  ${score.toInt()}',
                style: TextStyle(
                    fontFamily: 'Rockdiz', fontSize: 26.0, color: Colors.black),
              ),
            ),
          );
        });
  }
}
