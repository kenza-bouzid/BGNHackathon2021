import 'package:flutter/material.dart';
import 'Models.dart';

class LearnView extends StatefulWidget{
  LearnView({this.chapter,this.returnHome,this.moveToTest});
  final Chapter chapter;

  Function returnHome;
  Function moveToTest;

  createState() => LearnViewState();
}

class LearnViewState extends State<LearnView>{
  var normal = TextStyle(fontSize: 18,fontWeight: FontWeight.normal);
  var bold =  TextStyle(fontSize: 25,fontWeight: FontWeight.bold);

  int currentUnit = 0;
  bool completed = false;

  Widget inSessionView(){
    
    Widget progressButton = ConstrainedBox(
            constraints: BoxConstraints.tightFor(width: 300, height: 60),
            child: ElevatedButton(
              child: Text('Got It!',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
              onPressed: () {progress();},
            ));

    Widget previousButton = ConstrainedBox(
            constraints: BoxConstraints.tightFor(width: 300, height: 60),
            child: ElevatedButton(
              child: Text('Previous',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
              onPressed: () {previous();},
            ));

    Widget getButtons(){
      if(currentUnit == 0){
        return progressButton;
      }
      else{
        return Column(children: [
          progressButton,
          SizedBox(height: 20),
          previousButton
        ]);
      }
    }

    return
    Column(children: [
            SizedBox(height: 10),
            Align(alignment: Alignment.centerLeft,child:Text("Learning: ${widget.chapter.title}",style: bold,)),
            SizedBox(height: 10),
            Align(alignment: Alignment.centerLeft,child:Text("Example ${currentUnit+1} of 26",style: normal)),
            SizedBox(height: 20),
            LearnUnitView(unit: widget.chapter.units[currentUnit]),
            SizedBox(height: 40),
            getButtons(),
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
      Align(alignment: Alignment.center,child:Text("${widget.chapter.title}",style:TextStyle(fontSize: 40,fontWeight: FontWeight.bold))),
      SizedBox(height: 10),
      Align(alignment: Alignment.center,child:Text("Completed 🥳",style:normal)),
      SizedBox(height: 50),
      ConstrainedBox(
            constraints: BoxConstraints.tightFor(width: 300, height: 60),
            child: ElevatedButton(
              child: Text('Test Me!',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
              onPressed: () {widget.moveToTest();},
            )
      ),
      SizedBox(height: 30),
      ConstrainedBox(
            constraints: BoxConstraints.tightFor(width: 300, height: 60),
            child: ElevatedButton(
              child: Text('Done',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
              onPressed: () {widget.returnHome();},
            )
      )
    ]);
  }

  Widget getView(){
    if(!completed){
      return inSessionView();
    }
    else{
      return sessionCompleted();
    }
  }

  @override
  Widget build(BuildContext context){
    return Padding(padding:EdgeInsets.all(10),child: getView());
  }

  void progress(){
    setState(() {
      if(currentUnit+1 < widget.chapter.units.length){
        currentUnit+=1;
      }
      else if(currentUnit >= widget.chapter.units.length-1){
        completed = true;
      }
    });
  }

  void previous(){
    setState(() {
      if(currentUnit > 0){
        currentUnit-=1;
      }
    });
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
