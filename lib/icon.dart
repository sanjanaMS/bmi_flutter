import 'package:flutter/material.dart';
import 'constants.dart';


class TopContainer extends StatelessWidget {
  TopContainer({@required this.specify,@required this.text});
  final IconData specify;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          specify,
          size: 80.0,
        ),
        SizedBox(height: 10.0,),
        Text(
          text,
          style:klabeltext,
        ),
      ],
    );
  }
}
