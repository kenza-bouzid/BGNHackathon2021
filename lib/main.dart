import 'dart:ui';

import 'package:flutter/material.dart';
import 'Constants.dart';
import 'Models.dart';
import 'LearningViews.dart';
import 'TestingViews.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OreoSign',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'OreoSign'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  static var a = new ChapterUnit(unit: "A",unitID: "a",image: "asign.png",tips: "");
  static var b = new ChapterUnit(unit: "B",unitID: "b",image: "asign.png",tips: "");
  static var c = new ChapterUnit(unit: "C",unitID: "c",image: "asign.png",tips: "");
  static var alphabet = Chapter(title: "Alphabet",units: [a,b,c]);
  
  static var one = new ChapterUnit(unit: "A",unitID: "a",image: "asign.png",tips: "");
  static var two = new ChapterUnit(unit: "B",unitID: "b",image: "asign.png",tips: "");
  static var three = new ChapterUnit(unit: "C",unitID: "c",image: "asign.png",tips: "");
  static var numbers = Chapter(title: "Numbers",units: [a,b,c]);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;
  // bool showContent = false;
  var index = 0;
  Widget learnLabelView() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(children: [
        SizedBox(height: 10),
        Align(
            alignment: Alignment.centerLeft,
            child: Text("Learn Sign Language",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: aTextColour, fontWeight: FontWeight.bold)
                // style: bold,
                )),
        SizedBox(height: 10),
        Align(
            alignment: Alignment.centerLeft,
            child: Text("Complete the sessions below to learn how to sign!",
                style: TextStyle(
                  fontSize: 20,
                ))),
        SizedBox(height: 20),
      ]),
    );
  }

  Widget testLabelView() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(children: [
        SizedBox(height: 10),
        Align(
            alignment: Alignment.centerLeft,
            child: Text("Test Your Knowledge",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: aTextColour, fontWeight: FontWeight.bold)
                // style: bold,
                )),
        SizedBox(height: 10),
        Align(
            alignment: Alignment.centerLeft,
            child:
                Text("Complete the quizzes below to see how much you've learnt",
                    style: TextStyle(
                      fontSize: 20,
                    ))),
        SizedBox(height: 20),
        // LearnUnitView(unit: chapter.units[currentUnit]),

        //use the code below if buttons need to be injected alongwith the text:

        // SizedBox(height: 40),
        // ConstrainedBox(
        //     constraints: BoxConstraints.tightFor(width: 300, height: 60),
        //     child: ElevatedButton(
        //       child: Text('Got It!',
        //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        //       onPressed: () {},
        //     )),
        // SizedBox(height: 10)
      ]),
    );
  }
  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        leading: IconButton(
          icon: Icon(Icons.home_filled),
          onPressed: () {
            setState(() {
              index = 0;
            });
          },
        ),
      ),
      body: Column(children: [
        getView(),
        Container(
          height: 400,
          // color: aPrimaryColour,
          padding: EdgeInsets.only(
            bottom: aDefualtPadding,
            top: 30 + aDefualtPadding,
            left: 50 + aDefualtPadding,
            right: 50 + aDefualtPadding,
          ),
          child: Column(
            children: <Widget>[
              // Spacer(),
              SizedBox(height: 50),
              FlatButton(
                padding: EdgeInsets.only(
                  bottom: aDefualtPadding,
                  top: aDefualtPadding,
                  left: 50 + aDefualtPadding,
                  right: 50 + aDefualtPadding,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: aSecondaryColour,
                onPressed: () {
                  pushToLearnMaybe(index == 1 ? true : false, MyHomePage.alphabet);
                },
                child: Text(
                  MyHomePage.alphabet.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(height: 50),
              FlatButton(
                  padding: EdgeInsets.only(
                      bottom: aDefualtPadding,
                      top: aDefualtPadding,
                      left: 50 + aDefualtPadding,
                      right: 50 + aDefualtPadding),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: aSecondaryColour,
                  onPressed: () {
                    pushToLearnMaybe(index == 1 ? true : false, MyHomePage.numbers);
                  },
                  child: Text(
                    MyHomePage.numbers.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),
                  )),
            ],
          ),
        )
        // Text("Alphabet"), //setView(true)
        // Text("Numbers") //setView(false)
      ]),
      // body: Center(
      //   // Center is a layout widget. It takes a single child and positions it
      //   // in the middle of the parent.
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       Text(
      //         'Content injected here:',
      //       ),
      //       showContent == true
      //           ? new AlertDialog(
      //               title: new Text('Test Hide And Show'),
      //             )
      //           : new Text(""),
      // Text(
      //   '$_counter',
      //   style: Theme.of(context).textTheme.headline4,
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
            // left: aDefualtPadding + 10,
            // right: aDefualtPadding + 10,
            // bottom: aDefualtPadding,
            ),
        height: 130,
        // decoration: BoxDecoration(color: Colors.white, boxShadow: [
        //   BoxShadow(
        //     offset: Offset(0, -10),
        //     blurRadius: 35,
        //     color: aPrimaryColour.withOpacity(0.38),
        //   )
        // ]),
        child: Row(
          children: <Widget>[
            FlatButton(
                padding: EdgeInsets.only(
                  bottom: 10 + aDefualtPadding,
                  top: 10 + aDefualtPadding,
                  left: 55 + aDefualtPadding,
                  right: 55 + aDefualtPadding,
                ),
                color: aPrimaryColour,
                // shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(10)),
                onPressed: () {
                  setState(() {
                    index = 1;
                  });
                },
                child: Text(
                  'Learn',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                )),
            Spacer(),
            FlatButton(
                padding: EdgeInsets.only(
                  bottom: 10 + aDefualtPadding,
                  top: 10 + aDefualtPadding,
                  left: 55 + aDefualtPadding,
                  right: 55 + aDefualtPadding,
                ),
                color: aPrimaryColour,
                // shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(10)),
                onPressed: () {
                  setState(() {
                    index = 2;
                  });
                },
                child: Text('Test',
                    style: TextStyle(fontSize: 18, color: Colors.white))),
            //IconButton(icon: Icon(Icons.access_alarm), onPressed: () {})
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void pushTo(Widget view){
    Navigator.push(context,
      MaterialPageRoute(builder: (context) => view)
    );
  }

  void pushToLearnMaybe(bool learn,Chapter chapter){
    if(learn){
      //learn
      pushTo(
        Scaffold(
            appBar: AppBar(title: Text("OreoSign")),
            body: Padding(padding:EdgeInsets.all(10),child: LearnView(chapter: chapter,returnHome: ()=>{print("returned home")},moveToTest: ()=>{print("moved to test")}))
        )
      );
    }
    else{
      //test
      pushTo(
        Scaffold(
            appBar: AppBar(title: Text("OreoSign")),
            body: Padding(padding:EdgeInsets.all(10),child: TestView(chapter: chapter,returnHome: ()=>{print("returned home")},moveToTest: ()=>{print("moved to test")}))
        )
      );
    }
  }

  Widget getView() {
    if (index == 1) {
      return learnLabelView();
    } else if (index == 2) {
      return testLabelView();
    } else if (index == 0) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          SizedBox(height: 10),
          Align(
              alignment: Alignment.centerLeft,
              child: Text("Welcome, select Test or Learn to get started",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(color: aTextColour, fontWeight: FontWeight.bold)
                  // style: bold,
                  )),
          SizedBox(height: 10),
          // Align(
          //     alignment: Alignment.centerLeft,
          //     child: Text(
          //       "Complete the sessions below to learn how to sign!",
          //     )),
          SizedBox(height: 20),
        ]),
      );
    }
  }

  // void setView(bool learnViewShown) {
  //   setState(() {
  //     if (learnViewShown) {
  //       index = 0;
  //     } else {
  //       index = 1;
  //     }
  //   });
  // }
}
