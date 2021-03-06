import 'package:flutter/material.dart';


/*
void main() {

  var exampleUnit = new ChapterUnit(unit:"A",unitID: "A",image: "asign.png",tips: "1. Make a fist\n2. Release your thumb");
  var exampleChapter = new Chapter(title: "Alphabet",units:[exampleUnit]);

  runApp(MaterialApp(home: LearnView(chapter: exampleChapter)));
}
*/

//A group of units
class Chapter{

  Chapter({this.title,this.units});

  //The minimum word descriptor of this chapter
  String title;
  //A collection of units
  List<ChapterUnit> units;

}

//The learning and testing material for a specific unit in a chapter
class ChapterUnit{

  ChapterUnit({this.unit,this.unitID,this.image,this.tips});
  //The specific unit to be learned e.g: a word, a number, an emotion
  String unit;
  //The representation of this unit for api use
  String unitID;
  //Path to image in assets
  String image;
  //Tips,seperated by \n to indicate new lines
  String tips;
}

class LearnView extends StatelessWidget{
  var normal = TextStyle(fontSize: 18,fontWeight: FontWeight.normal);
  var bold =  TextStyle(fontSize: 25,fontWeight: FontWeight.bold);

  LearnView({this.chapter});

  final Chapter chapter;
  int currentUnit = 0;

  Widget inSessionView(){
    return
    Column(children: [
            SizedBox(height: 10),
            Align(alignment: Alignment.centerLeft,child:Text("Learning: ${chapter.title}",style: bold,)),
            SizedBox(height: 10),
            Align(alignment: Alignment.centerLeft,child:Text("Example ${currentUnit+1} of 26",style: normal)),
            SizedBox(height: 20),
            LearnUnitView(unit: chapter.units[currentUnit]),
            SizedBox(height: 40),
            ConstrainedBox(
            constraints: BoxConstraints.tightFor(width: 300, height: 60),
            child: ElevatedButton(
              child: Text('Got It!',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
              onPressed: () {},
            )),
            SizedBox(height: 10)
          ]
    );
  }

  Widget sessionCompleted(){
    return 
    Column(children: [
      SizedBox(height: 30),
      Align(alignment: Alignment.center,child:Text("You learnt all the signs in this chapter!",style:normal)),
      SizedBox(height: 30),
      Align(alignment: Alignment.center,child:Text("${chapter.title}",style:TextStyle(fontSize: 40,fontWeight: FontWeight.bold))),
      SizedBox(height: 10),
      Align(alignment: Alignment.center,child:Text("Completed 🥳",style:normal)),
      SizedBox(height: 50),
      ConstrainedBox(
            constraints: BoxConstraints.tightFor(width: 300, height: 60),
            child: ElevatedButton(
              child: Text('Test Me!',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
              onPressed: () {},
            )
      ),
      SizedBox(height: 30),
      ConstrainedBox(
            constraints: BoxConstraints.tightFor(width: 300, height: 60),
            child: ElevatedButton(
              child: Text('Done',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
              onPressed: () {},
            )
      )
    ]);
  }

  Widget getView(){
    if(true){
      return inSessionView();
    }
    else{
      return sessionCompleted();
    }
  }

  Widget build(BuildContext context){
    return
    Scaffold(
      appBar: AppBar(title: Text("OreoSign")),
      body: Padding(padding:EdgeInsets.all(10),child: getView())
    );
  }
}

class LearnUnitView extends StatelessWidget{

  var normal = TextStyle(fontSize: 18,fontWeight: FontWeight.normal);
  var bold =  TextStyle(fontSize: 25,fontWeight: FontWeight.bold);

  LearnUnitView({this.unit});

  final ChapterUnit unit;

  Widget build(BuildContext context){
    return 
    Column(children: [
      Align(alignment: Alignment.center,child:Text("This is how we sign the letter...",style:normal)),
      Align(alignment: Alignment.center,child:Text("\"${ unit.unit }\"",style:TextStyle(fontSize: 40,fontWeight: FontWeight.bold))),
      SizedBox(height: 50),
      Image.asset('assets/images/${unit.image}'),
      SizedBox(height: 50),
      Align(alignment: Alignment.centerLeft,child:Text("Tips",style:bold)),
      SizedBox(height: 10),
      Align(alignment: Alignment.centerLeft,child:Text("${unit.tips}",style:normal)),
    ]);
  }
}
