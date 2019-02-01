import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main()=> runApp(LogoApp());

class LogoApp extends StatefulWidget{
  LogoAppState createState() => LogoAppState();
}

class LogoAppState extends State<LogoApp>  with SingleTickerProviderStateMixin{

  Animation<double> animation;
  AnimationController controller;
  
  @override
  void initState(){
    super.initState();
  }
  Widget build(context){
    return Center(
      child: Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    height: 200,
    width: 200,
    child: FlutterLogo(),
     ),
      );
  }

}