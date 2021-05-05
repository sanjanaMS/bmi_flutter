
import 'dart:math';


class Results_Page {
  Results_Page({this.height,this.weight});
  final int height;
  final int weight;
  double _bmi;
  String calculateBMI(){
     _bmi=weight/pow(height/100,2);
    String bm=_bmi.toStringAsFixed(1);
    return bm;
  }
  String result(){
    if(_bmi>=25){
      return 'OVERWEIGHT';
    }else if(_bmi>18){
      return 'NORMAL';
    }else{
      return 'UNDERWEIGHT';
    }
  }

  String interpretation(){
    if(_bmi>=25){
      return 'You are overweight,excercise daily to stay healthy';
    }else if(_bmi>18){
      return 'You have a normal BMI keep it up!';
    }else{
      return 'YOU are underweight,eat more!';
    }
  }

}