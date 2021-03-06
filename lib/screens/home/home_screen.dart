import 'package:flutter/material.dart';
import 'package:oreo_signs/constants.dart';
import 'package:oreo_signs/screens/home/components/body.dart';
import 'package:oreo_signs/screens/pages/testing_screen.dart';
import 'package:oreo_signs/screens/pages/learning_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          left: aDefualtPadding + 10,
          right: aDefualtPadding + 10,
          bottom: aDefualtPadding,
        ),
        height: 130,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            offset: Offset(0, -10),
            blurRadius: 35,
            color: aPrimaryColour.withOpacity(0.38),
          )
        ]),
        child: Row(
          children: <Widget>[
            FlatButton(
                padding: EdgeInsets.only(
                  bottom: aDefualtPadding,
                  top: aDefualtPadding,
                  left: 40 + aDefualtPadding,
                  right: 40 + aDefualtPadding,
                ),
                color: aPrimaryColour,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () { Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LearningScreen()));},
                child: Text('Learn')),
            Spacer(),
            FlatButton(
                padding: EdgeInsets.only(
                  bottom: aDefualtPadding,
                  top: aDefualtPadding,
                  left: 40 + aDefualtPadding,
                  right: 40 + aDefualtPadding,
                ),
                color: aPrimaryColour,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TestingScreen()));
                },
                child: Text('Test')),
            //IconButton(icon: Icon(Icons.access_alarm), onPressed: () {})
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      // leading: Icon(
      //   Icons.archive_rounded,
      //   size: 30,
      // ),
    );
  }
}
