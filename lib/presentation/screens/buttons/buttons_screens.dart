import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';



class ButtonsScreen extends StatelessWidget {
  static const path = '/botones';
  static const name = 'botones';
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 10,
            children: [
              ElevatedButton(onPressed: (){}, child: const Text("Elevated Button")),
              const ElevatedButton(onPressed: null, child: Text("Elevated Disable")),

              ElevatedButton.icon(onPressed: (){}, icon: const Icon(Icons.ac_unit_rounded), label: const Text('Elevated Icon'),),
              FilledButton(onPressed: (){}, child: const Text('Filled'),),
              FilledButton.icon(onPressed: (){}, icon: const Icon(Icons.aspect_ratio), label: const Text('Filled'),),

              OutlinedButton(onPressed: (){}, child: const Text("Outline"),),
              OutlinedButton.icon(onPressed: (){},icon: const Icon(Icons.outlined_flag_rounded), label: const Text("Outline"),),

              TextButton(onPressed: (){}, child: const Text('Text')),
              TextButton.icon(onPressed: (){}, icon: const Icon(Icons.safety_check), label: const Text('Text')),

              IconButton(onPressed: (){}, icon: const Icon(Icons.app_registration)),
              IconButton(
                onPressed: (){}, 
                icon: const Icon(Icons.app_registration), 
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.indigo),
                  iconColor: MaterialStatePropertyAll(Colors.white)
                ),
              ),

              const CustomButton()
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        child: const Icon(Icons.arrow_back_ios_new, color: Colors.white,),
        onPressed: (){
          context.pop();
        },
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: Colors.amber,
        child: InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Hello World'),
          ),
        ),
      ),
    );
  }
}