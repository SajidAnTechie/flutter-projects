import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  Widget handleClick({Color? colorname, int? keynumber}) {
    return Expanded(
      child: TextButton(
          onPressed: () {
            final audio = AudioCache();
            audio.play("note$keynumber.wav");
          },
          style: TextButton.styleFrom(padding: EdgeInsets.all(0)),
          child: Container(
            color: colorname,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Xylophone App",
      theme: ThemeData.dark(),
      home: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                "Xylophone App",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            backgroundColor: Colors.orange[300],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              handleClick(colorname: Colors.red, keynumber: 1),
              handleClick(colorname: Colors.yellow, keynumber: 2),
              handleClick(colorname: Colors.green, keynumber: 3),
              handleClick(colorname: Colors.teal, keynumber: 4),
              handleClick(colorname: Colors.blue, keynumber: 5),
              handleClick(colorname: Colors.purple, keynumber: 6),
              handleClick(colorname: Colors.orange, keynumber: 7),
            ],
          )),
    );
  }
}
