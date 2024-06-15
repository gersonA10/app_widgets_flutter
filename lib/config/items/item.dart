import 'package:flutter/material.dart';

class Item {

  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const Item({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon,
  });

}

  const appItems = <Item>[

    Item(
      title: 'Botones', 
      subTitle: 'Ver variedad de botones en FLutter',
      link: '/botones', 
      icon: Icons.smart_button_outlined,
    ),
     Item(
      title: 'Cards', 
      subTitle: 'Conocer a mas detalle las cards',
      link: '/cards', 
      icon: Icons.card_membership_rounded,
    ),

  ];