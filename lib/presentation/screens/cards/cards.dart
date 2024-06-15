import 'dart:math';

import 'package:flutter/material.dart';

const cards = <Map<String, dynamic>>{
  {'elevation': 0.0, 'label': 'Elevation 0'},
  {'elevation': 1.0, 'label': 'Elevation 1'},
  {'elevation': 2.0, 'label': 'Elevation 2'},
  {'elevation': 3.0, 'label': 'Elevation 3'},
  {'elevation': 4.0, 'label': 'Elevation 4'},
  {'elevation': 5.0, 'label': 'Elevation 5'},
};


class CardsScreen extends StatelessWidget {

  static const path = '/cards';
  static const name = 'cards';
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards Screen'),
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              ...cards.map((card) {
                return CardType1(
                  elevation: card['elevation'],
                  label: card['label'],
                );
              }),
          
              ...cards.map((carta) => CardType2(elevation: carta['elevation'], label: carta['label'])),
              ...cards.map((carta) => CardType3(elevation: carta['elevation'], label: carta['label'])),
              ...cards.map((carta) => CardType4(elevation: carta['elevation'], label: carta['label'])),
          
              const SizedBox(height: 80,)
            ],
          ),
        ),
      ),
    );
  }
}

class CardType1 extends StatelessWidget {
  
  final double elevation;
  final String label;

  const CardType1({
    super.key,
    required this.elevation,
    required this.label
  });

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert))),
            Text(label)
          ],
        ),
      ),
    );
  }
}

class CardType2 extends StatelessWidget {
  
  final double elevation;
  final String label;

  const CardType2({
    super.key,
    required this.elevation,
    required this.label
  });

  @override
  Widget build(BuildContext context) {
    return  Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all( Radius.circular(5)),
        side: BorderSide(
          color: Colors.black
        ),
      ),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert))),
            Text('$label - outline')
          ],
        ),
      ),
    );
  }
}


class CardType3 extends StatelessWidget {
  
  final double elevation;
  final String label;

  const CardType3({
    super.key,
    required this.elevation,
    required this.label
  });

  @override
  Widget build(BuildContext context) {
    return  Card(
      color: Colors.indigo,
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert))),
            Text('$label - Filled', style: const TextStyle(color: Colors.white),)
          ],
        ),
      ),
    );
  }
}

class CardType4 extends StatelessWidget {
  
  final double elevation;
  final String label;

  const CardType4({
    super.key,
    required this.elevation,
    required this.label
  });

  @override
  Widget build(BuildContext context) {
    return  Card(
      clipBehavior: Clip.hardEdge,
      elevation: elevation,
      child: Stack(
        children: [
          Image.network(
            'https://picsum.photos/id/${elevation.toInt()}/600/350',
            height: 340,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20))
              ),
              child: IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert),),
            ),
          )
        ],
      )
    );
  }
}