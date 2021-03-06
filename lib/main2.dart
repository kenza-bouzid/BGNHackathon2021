import 'package:flutter/material.dart';
import 'constants.dart';
import 'LearningViews.dart';
import 'Models.dart';
import 'TestingViews.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var a = new ChapterUnit(unit: "A",unitID: "a",image: "asign.png",tips: "");
    var b = new ChapterUnit(unit: "B",unitID: "b",image: "asign.png",tips: "");
    var exampleChapter = Chapter(title: "Alphabet",units: [a,b]);

    return MaterialApp(
      title: 'OreoSign App',
      home: Scaffold(
        appBar: AppBar(title: Text("OreoSign")),
        body: Padding(padding:EdgeInsets.all(10),child: TestView(chapter: exampleChapter,returnHome: ()=>{print("returned home")},moveToTest: ()=>{print("moved to test")}))
      )
    );
  }
}
