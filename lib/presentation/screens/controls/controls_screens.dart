import 'package:flutter/material.dart';


enum Transportation {car, plane, boat, submarine }



class ControlsScreen extends StatefulWidget {
  static const path = '/controls';
  static const name = 'controls';
  const ControlsScreen({super.key});

  @override
  State<ControlsScreen> createState() => _ControlsScreenState();
}



class _ControlsScreenState extends State<ControlsScreen> {


  bool isDeveloper = true;
  bool breakfast = false;
  Transportation selectTransportation = Transportation.car;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Controls Screen'),
      ),
      body: ListView(
        children: [
          SwitchListTile.adaptive(
            title: const Text('Developer Mode'),
            subtitle: const Text('On Developer mode will allow'),
            value: isDeveloper, 
            onChanged: (value){
              setState(() {
                isDeveloper = !isDeveloper;
              });
            },
          ),
          
          ExpansionTile(
            title:  Text('Vehiculo de Transporte'),
            subtitle:  Text('Vehiculo seleecionado: $selectTransportation'),
            children: [
              RadioListTile(
                title: const Text('By Car'),
                subtitle: const Text("Viajar por carro"),
                value: Transportation.car, 
                groupValue: selectTransportation, 
                onChanged: (value){
                  setState(() {
                    selectTransportation = Transportation.car;
                  });
                },
              ),
              RadioListTile(
                title: const Text('By Boat'),
                subtitle: const Text("Viajar por bote"),
                value: Transportation.boat,
                groupValue: selectTransportation, 
                onChanged: (value){
                  setState(() {
                    selectTransportation = Transportation.boat;
                  });
                },
              ),
              RadioListTile(
                title: const Text('By Plane'),
                subtitle: const Text("Viajar por avion"),
                value: Transportation.plane,
                groupValue: selectTransportation, 
                onChanged: (value){
                  setState(() {
                    selectTransportation = Transportation.plane;
                  });
                },
              ),
              RadioListTile(
                title: const Text('By Submarine'),
                subtitle: const Text("Viajar por submarino"),
                value: Transportation.submarine,
                groupValue: selectTransportation, 
                onChanged: (value){
                  setState(() {
                    selectTransportation = Transportation.submarine;
                  });
                },
              ),
            ],
          ),

          CheckboxListTile.adaptive(
            title: const Text('Breakfast'),
            subtitle: const Text('Breakfast?'),
            value: breakfast, 
            onChanged: (value){
              setState(() {
              breakfast = !breakfast;
                
              });
            },
          ),
        ],
      ),
    );
  }
}