import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() => runApp(LogoApp());

class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }
}
class LogoWidget extends StatelessWidget{
  Widget build(context)=> Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    child: FlutterLogo(),
  );
}

class GrowTransition extends StatelessWidget{
  GrowTransition({this.child, this.animation});
  final Widget child;
  final Animation<double> animation;

  Widget build(context)=> Center(
    child: AnimatedBuilder(
      animation: animation,
      builder: (context, child)=>Container(
        height: animation.value,
        width: animation.value,
        child: child,
      ),
      child: child),
    );
    
}
class LogoApp extends StatefulWidget {
  LogoAppState createState() => LogoAppState();
}

class LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
..addStatusListener((status){
  if (status==AnimationStatus.completed){
    controller.reverse();
  }
  else if(status==AnimationStatus.dismissed){
    controller.forward();
  }
})
..addStatusListener((state)=> print('$state'));

    controller.forward();
  }

  @override
  Widget build(context) => AnimatedLogo(animation: animation);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
