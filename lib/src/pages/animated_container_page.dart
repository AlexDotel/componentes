import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {

  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();

}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {


  double _ancho = 50.0;
  double _alto = 50.0;
  Color _color = Colors.blue; 
  
  BorderRadiusGeometry _radio = BorderRadius.circular(5.0);


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Animated Container'),
        actions: <Widget>[

           Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: CircleAvatar(
              child: Icon(Icons.play_circle_outline)
              
            ),
          )

        ],
      ),

      body: Center(

        child: AnimatedContainer(
          duration: Duration( milliseconds: 1000 ),
          curve: Curves.fastLinearToSlowEaseIn,
          height: _alto,
          width: _ancho,
          decoration: BoxDecoration(

            color: _color,
            borderRadius: _radio
           
          ),
          
          
          
        ),

      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: _transformar
      ),
      
    );
  }

  void _transformar(){

    final ram = Random();
    
    setState(() {
      
      _alto = ram.nextInt(300).toDouble();
      _ancho = ram.nextInt(300).toDouble();
      _radio = BorderRadius.circular(ram.nextInt(50).toDouble());
      _color = Color.fromRGBO(ram.nextInt(255), ram.nextInt(255), ram.nextInt(255), 1);

    });

  }
}