import 'package:flutter/material.dart';
import 'package:oreo_signs/constants.dart';
import 'header.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //used to find total height and width of screen so that size.height can be used further down
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Header(size: size),
        Container(
          height: 300,
          // color: aPrimaryColour,
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
                onPressed: () {},
                child: Text(
                  'Alphabet',
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
                  onPressed: () {},
                  child: Text(
                    'Numbers',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),
                  )),
            ],
          ),
        )
      ],
    );
  }
}
