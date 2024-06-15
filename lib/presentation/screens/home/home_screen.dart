import 'package:aplicacion_numero_dos_fljp/config/items/item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class HomeScreen extends StatelessWidget {

  static const path = '/';
  static const name = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: ListView.builder(
        itemCount: appItems.length,
        itemBuilder: (context, index) {
          final item = appItems[index];
          return ListTile(
            title: Text(item.title),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            subtitle: Text(item.subTitle),
            leading: Icon(item.icon),
            onTap: () {
              context.push(item.link);
            },
          );
        }
      ),
    );
  }
}