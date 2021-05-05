import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/inputpage.dart';
import 'package:bmi_calculator/newwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({this.bmi,this.high,this.inter});
  final String bmi;
  final String high;
  final String inter;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR'
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kresultstyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: NewWidget(
              colour: kwidColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Text(high,
                   style: kstyle,
                   ),
                   Text(
                     bmi,
                     style: kbmitextstyle,
                   ),
                   Text(
                     inter,
                     textAlign:TextAlign.center,
                     style: ktextstyle,
                   ),

                 ],

              ),

            ),

          ),
          GestureWidget(textdata: 'RE-CALCULATE',onTap: (){
            Navigator.pop(context);
          },),

        ],
      ),
    );
  }
}
