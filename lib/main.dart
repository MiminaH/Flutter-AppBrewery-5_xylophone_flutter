import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(MaterialApp(home: WelcomeScreen()));
int noteNum = 1;
String screenName;

List noteDetails;

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text('Choose Your Sound:',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 35))),
        body: SafeArea(
            child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ButtonTheme(
                    minWidth: 200,
                    height: 70,
                    buttonColor: Colors.grey[300],
                    child: RaisedButton(
                        onPressed: () {
                          screenName = 'Piano';
                          noteDetails = [
                            ['C Note', 'note1.wav'],
                            ['D Note', 'note2.wav'],
                            ['E Note', 'note3.wav'],
                            ['F Note', 'note4.wav'],
                            ['G Note', 'note5.wav'],
                            ['A Note', 'note6.wav'],
                            ['B Note', 'note7.wav']
                          ];
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => XylophoneApp()));
                        },
                        child: Text('Piano',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)))),
                SizedBox(
                  height: 20,
                ),
                ButtonTheme(
                  minWidth: 200,
                  height: 70,
                  buttonColor: Colors.grey[300],
                  child: RaisedButton(
                      onPressed: () {
                        screenName = 'Effects';
                        noteDetails = [
                          ['Witch Laugh', '1) Witches Laugh.wav'],
                          ['Ovation', '2) Ovation.wav'],
                          ['Boo', '3) Crowd Boo.wav'],
                          ['Ta Da', '4) Ta Da.wav'],
                          ['Cheering', '5) Cheering.wav'],
                          ['Cha Ching', '6) Cha Ching.wav'],
                          ['Scream', '7) Falling Off Scream.wav']
                        ];
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => XylophoneApp()));
                      },
                      child: Text('Effects',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold))),
                )
              ]),
        )));
  }
}

class XylophoneApp extends StatelessWidget {
  void playSound(String fileName) {
    final player = AudioCache();
    player.play(fileName);
  }

  Expanded buildKey(String fileName, Color colorInp, String noteName) {
    return Expanded(
        child: FlatButton(
            color: colorInp,
            onPressed: () {
              playSound(fileName);
            },
            child: Text(noteName,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[850],
                    fontSize: 20))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(screenName,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 35)),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.black,
                  tooltip: 'Navigate back to Welcome Screen',
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ]),
        body: SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
              buildKey(noteDetails[0][1], Colors.red, noteDetails[0][0]),
              buildKey(noteDetails[1][1], Colors.orange, noteDetails[1][0]),
              buildKey(noteDetails[2][1], Colors.yellow, noteDetails[2][0]),
              buildKey(noteDetails[3][1], Colors.green, noteDetails[3][0]),
              buildKey(noteDetails[4][1], Colors.teal, noteDetails[4][0]),
              buildKey(noteDetails[5][1], Colors.blue, noteDetails[5][0]),
              buildKey(noteDetails[6][1], Colors.purple, noteDetails[6][0]),
            ])));
  }
}
