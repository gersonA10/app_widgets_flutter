import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {

  static const name = 'progress';
  static const path = '/progress';
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicators'),
      ),

      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        children: [
          const Text("Circular Progress Indicator"),
          const SizedBox(height: 10,),
          const CircularProgressIndicator(
            strokeWidth: 2,
            backgroundColor: Colors.black45,
          ),
           const SizedBox(height: 10,),
           const Text("Circular - Lineal Progress Indicator - Controlado"),

           StreamBuilder(
            stream: Stream.periodic(const  Duration(milliseconds: 300), (value){
              return (value * 2) / 100; // 0.0 , 1.0
            }).takeWhile((element) {
              return element < 1.0;
              }), 


            builder: (context, snapshot){
              final progressValue = snapshot.data ?? 0;

              return  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    CircularProgressIndicator(
                      value: progressValue,
                    ),
                    const SizedBox(width: 20,),
                     Expanded(child: LinearProgressIndicator(value: progressValue,))
                  ],
                ),
              );
            },
           ),
        ],
      ),
    );
  }
}