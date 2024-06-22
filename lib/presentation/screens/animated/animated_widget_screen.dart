import 'dart:math';

import 'package:flutter/material.dart';


class AnimatedWidget extends StatefulWidget {

  static const path = '/animated';
  static const name = 'animated';

  const AnimatedWidget({super.key});

  @override
  State<AnimatedWidget> createState() => _AnimatedWidgetState();
}

class _AnimatedWidgetState extends State<AnimatedWidget> {


  double width = 50;
  double height = 50;
  Color color = Colors.green;
  double borderRadius = 10.0;

  changShape(){
    final random = Random();

      width = random.nextInt(300) + 120;
      height = random.nextInt(300) + 120;
      borderRadius  = random.nextInt(100) + 20;
      color = Color.fromRGBO(
       random.nextInt(255), //red
       random.nextInt(255), //green
       random.nextInt(255), //blue
       1 //opacity
      );
      setState(() {});
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Widget'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.elasticOut,
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius < 0 ? 0 : borderRadius)
          ),
          
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //Animar Boton
          changShape();
        },
         child: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}