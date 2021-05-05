import 'package:flutter/material.dart';
import 'newwidget.dart';
import 'icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'results.dart';
import 'results_page.dart';

enum gender {
  masculine,
  feminine,
}
int height=180;
int weight=60;
int age=19;
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  gender selectedgender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: NewWidget(
                    colour: selectedgender == gender.masculine
                        ? kwidColor
                        : knewColor,
                    cardChild: TopContainer(
                        specify: FontAwesomeIcons.mars, text: 'MALE'),
                    gest1: () {
                      setState(() {
                        selectedgender = gender.masculine;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: NewWidget(
                    colour: selectedgender == gender.feminine
                        ? kwidColor
                        : knewColor,
                    cardChild: TopContainer(
                        specify: FontAwesomeIcons.venus, text: 'FEMALE'),
                    gest1: () {
                      setState(() {
                        selectedgender = gender.feminine;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: NewWidget(
              colour: (kwidColor),
              cardChild: Column(
                children: [
                  Text(
                    'HEIGHT',
                    style: klabeltext,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kmiddle,
                      ),
                      Text(
                        'cm',
                        style: klabeltext,
                      ),

                    ],

                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor:Color(0xFFEB1555) ,
                      overlayColor:Color(0x29Eb1555) ,
                      overlayShape:RoundSliderOverlayShape(overlayRadius: 30.0),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    ),
                    child: Slider(value:height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged:(double newValue){
                        setState(() {
                          height=newValue.round();
                        });

                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: NewWidget(
                    colour: (kwidColor),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT',
                        style: klabeltext),
                        Text(weight.toString(),
                        style: kmiddle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(icon:FontAwesomeIcons.minus,onPressed:( ){setState(() {
                             weight--;
                            });} ,),
                            SizedBox(width: 10,),
                            RoundIconButton(icon: FontAwesomeIcons.plus,onPressed: (){setState(() {
                             weight++;
                            });
                            },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child:NewWidget(colour: (kwidColor),
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Age',
                        style: klabeltext,
                      ),
                      Text(
                        age.toString(),
                        style: kmiddle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(icon:FontAwesomeIcons.minus,onPressed:( ){setState(() {
                            age--;
                          });} ,),
                          SizedBox(width: 10,),
                          RoundIconButton(icon: FontAwesomeIcons.plus,onPressed: (){setState(() {
                            age++;
                          });
                          },
                          ),
                        ],
                      )
                    ],
                  ),),
                ),
              ],
            ),
          ),
          GestureWidget(textdata: 'CALCULATE',onTap:(){
            Results_Page calc=Results_Page(height: height,weight: weight);
            Navigator.push(context,
                MaterialPageRoute(builder: (context){
                  return ResultsPage(bmi: calc.calculateBMI(),high: calc.result(),inter: calc.interpretation()
                    ,);
                }));
          } ,),
        ],
      ),
    );
  }
}

class GestureWidget extends StatelessWidget {
  GestureWidget({this.textdata,this.onTap});
  final String textdata;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
        margin: EdgeInsets.only(top: 10),
        color: (kbottomContainerColor),
        child: Center(
          child: Text(  textdata,
          style: kcalculatestyle,
          ),
        ),
        width: double.infinity,
        height: kbottomContainerHeight,
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon,this.onPressed});
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(
        icon
      ),
      elevation: 0.0,
      constraints:BoxConstraints.tightFor(
        width: 45.0,
        height: 45.0,
      ),
      fillColor:Color(0xFF4C4F5e),
      shape: CircleBorder(),
        );
  }
}
