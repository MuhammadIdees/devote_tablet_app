import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {

  CustomCard({Key key, this.corner, this.height, this.child, this.width}) : super(key: key);

  final Widget child, corner;
  final double width, height;

  @override
  Widget build(BuildContext context) {

    return Material(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: cardDecoration(),
            child: Container(
                width: width,
                height: height,
                child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: corner,
                        ),
                      ),
                ),
              ),

          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(180.0), topRight: Radius.circular(20.0), bottomLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
            ),
            child: Container(
              width: width + 2,
              height: height + 2,
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}

// Decoration used to make it look like a card
BoxDecoration cardDecoration(){
  return BoxDecoration(
    border: Border.all(color: Color(0x33E0DFDD)),
    color: Color(0xFF4B9F6F),
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
    boxShadow: [
      BoxShadow(
        color: Color(0x33000000),
        offset: Offset(0.0, 3.0),
        blurRadius: 6.0,
      ),
    ],
  );
}