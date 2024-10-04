import 'package:flutter/material.dart';

class Animdo extends StatefulWidget {
  const Animdo({super.key});

  @override
  State<Animdo> createState() => _AnimdoState();
}

class _AnimdoState extends State<Animdo> {
  double _buttonRadius = 100.0;
  final Tween<double> _backgroundScale= Tween<double>( begin: 0.0, end: 1.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            _pageBackground(),
            _circularAnimationButton()

          ],
        ),
      ),
    );
  }

  Widget _pageBackground(){
    return TweenAnimationBuilder(
      curve: Curves.easeInOutQuad,
      tween:_backgroundScale ,
      duration: Duration(seconds: 2),
      builder: (_context,double _scale,_child){
        return Transform.scale(
          scale: _scale,
          child: _child,
        );
      },
      child: Container(
        color: Colors.blue,
      ),
    );

  }

  Widget _circularAnimationButton(){
    return Center(
      child: GestureDetector(
        onTap: (){
          setState(() {
            _buttonRadius += _buttonRadius== 200 ? -100 : 100;
          });
        } ,
        child: AnimatedContainer(
          child: Center( child: Text('Tap, Tap'),),

          width: _buttonRadius,
          height: _buttonRadius,
          decoration:   BoxDecoration( color: Colors.purple,
              borderRadius: BorderRadius.circular(_buttonRadius)), duration: const Duration(seconds: 2),

        ),
      ),
    );

  }
}
