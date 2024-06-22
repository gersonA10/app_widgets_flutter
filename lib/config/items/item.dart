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
  Item(
    title: 'SnackBars',
    subTitle: 'Snackbar widgets',
    link: '/snackbar',
    icon: Icons.info_outline,
  ),
   Item(
    title: 'Animated Widget',
    subTitle: 'Animated widgets',
    link: '/animated',
    icon: Icons.animation_rounded,
  ),
    Item(
    title: 'Introduction Screen',
    subTitle: 'Introduction Screen',
    link: '/introduction',
    icon: Icons.people_alt_sharp,
  ),
   Item(
    title: 'Controls Screen',
    subTitle: 'Controls Screen',
    link: '/controls',
    icon: Icons.control_camera_sharp,
  ),
];
