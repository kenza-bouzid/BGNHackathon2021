import 'package:flutter/material.dart';
import 'Models.dart';


class TestView extends StatefulWidget{
  final Chapter chapter;

  Function returnHome;
  Function moveToTest;

  TestView({this.chapter,this.returnHome,this.moveToTest});

  createState() => TestViewState();
}

class TestViewState extends State<TestView>{
  Color green = const Color.fromRGBO(0, 128, 0, 1);
  Color blue = const Color.fromRGBO(0, 0, 250, 1);

  var normal = TextStyle(fontSize: 18,fontWeight: FontWeight.normal);
  var bold =  TextStyle(fontSize: 25,fontWeight: FontWeight.bold);

  int currentUnit = 0;
  int correctAnswers = 2;
  final double passMark = 0.5;

  bool completed =  false;

  void progress(){
    //Set State
    setState(() {
      if(currentUnit+1 < widget.chapter.units.length){
        currentUnit+=1;
      }
      else{
        completed = true;
      }
    });
  }

  Widget getView(){
    if(!completed){
      //In Session
      return 
      Column(children: [
        SizedBox(height: 10),
        Align(alignment: Alignment.centerLeft,child:Text("Testing: ${widget.chapter.title}",style: bold,)),
        SizedBox(height: 10),
        Align(alignment: Alignment.centerLeft,child:Text("Question ${currentUnit+1} of 26",style: normal)),
        SizedBox(height: 20),
        new TestUnitView(unit: widget.chapter.units[currentUnit],progress:()=>{progress()})
      ]);
    }
    else{
      //Completed
      return
      Column(children: [
            Align(alignment: Alignment.center,child:Text("you answered ${correctAnswers}/${widget.chapter.units.length} correctly",style:normal)),
            SizedBox(height: 10),
            Align(alignment: Alignment.center,child:Text(passMark*widget.chapter.units.length.toDouble() < correctAnswers ? "You Passed" : "Try Again",style:TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: passMark*widget.chapter.units.length.toDouble() < correctAnswers ? green : blue))),
            SizedBox(height: 40),
            SizedBox(height: 50),
            ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 300, height: 60),
                  child: ElevatedButton(
                    child: Text('Do it again',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                    onPressed: () {},
                  )
            ),
            SizedBox(height: 30),
            ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 300, height: 60),
                  child: ElevatedButton(
                    child: Text('Next Question',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                    onPressed: () {
                      
                    },
                  )
            )
          ]
    );
    }
  }

  Widget build(BuildContext context){
    return Padding(padding:EdgeInsets.all(10),child: getView());
  }
}

class TestUnitView extends StatefulWidget{

  TestUnitView({this.unit,this.progress});

  final ChapterUnit unit;
  Function progress;

  createState() => TestUnitViewState();
}

class TestUnitViewState extends State<TestUnitView>{
  Color green = const Color.fromRGBO(0, 128, 0, 1);
  Color red = const Color.fromRGBO(250, 0, 0, 1);

  var normal = TextStyle(fontSize: 18,fontWeight: FontWeight.normal);
  var bold =  TextStyle(fontSize: 25,fontWeight: FontWeight.bold);

  bool correct;

  Widget answerReviewView(bool correct){
    return
    Column(children: [
            Align(alignment: Alignment.center,child:Text("Your answer was",style:normal)),
            SizedBox(height: 10),
            Align(alignment: Alignment.center,child:Text(correct ? "Correct" : "Incorrect",style:TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: correct ? green : red))),
            SizedBox(height: 40),
            SizedBox(height: 50),
            ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 300, height: 60),
                  child: ElevatedButton(
                    child: Text('Do it again',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                    onPressed: () {resetAnswer();},
                  )
            ),
            SizedBox(height: 30),
            ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 300, height: 60),
                  child: ElevatedButton(
                    child: Text('Next Question',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                    onPressed: () {
                      resetAnswer();
                      setState(() {
                        widget.progress();
                      });
                    },
                  )
            )
          ]
    );
  }

  Widget inSessionView(){
    return
    Column(children: [
      Align(alignment: Alignment.center,child:Text("Sign the letter...",style:normal)),
      SizedBox(height: 10),
      Align(alignment: Alignment.center,child:Text("\"${ widget.unit.unit }\"",style:TextStyle(fontSize: 40,fontWeight: FontWeight.bold))),
      SizedBox(height: 40),
      ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 300, height: 60),
                  child: ElevatedButton(
                    child: Text('Take Picture',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                    onPressed: () {checkAnswer();},
                  )
      )
    ]);
  }

  void checkAnswer(){
    setState(() {
      correct = true;
    });
  }

  void resetAnswer(){
    setState(() {
      correct = null;
    });
  }

  void repeatQuestion(){
    setState(() {
      correct = null;
    });
  }

  Widget getView(){
    if(correct == null){
      return inSessionView();
    }
    else{
      if(correct){
        return answerReviewView(true);
      }
      else{
        return answerReviewView(false);
      }
    }
  }

  Widget build(BuildContext context){
    return getView();//answerReviewView(true);
  }

}
