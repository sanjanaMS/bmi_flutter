import 'package:flutter/material.dart';

class NewWidget extends StatelessWidget {
  NewWidget({ @required this.colour,this.cardChild,this.gest1,});
  final Color colour;
  final Widget cardChild;
  final Function gest1;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gest1,
      child: Container(
        margin: EdgeInsets.all(15),
        child: cardChild,
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadiusDirectional.circular(5),
        ),

      ),
    );
  }
}

