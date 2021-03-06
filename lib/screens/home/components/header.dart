import 'package:flutter/material.dart';
import 'package:oreo_signs/constants.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      //usingsize.height * 0.2 makes container cover 20% of the screen
      height: size.height * 0.1,
      // color: Colors.black,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: aDefualtPadding + 10,
              right: aDefualtPadding + 25,
              bottom: 20 + aDefualtPadding,
            ),
            height: size.height * 0.2 - 27,
            decoration: BoxDecoration(
              color: aPrimaryColour,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Row(
              children: <Widget>[
                Text(
                  'Welcome to OreoSign!',
                  style: Theme.of(context).textTheme.headline5.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Icon(
                  Icons.accessibility_new_sharp,
                  size: 40,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
