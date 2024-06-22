import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class SlideClass {
  final String title;
  final String subTitle;
  final String image;

  SlideClass(
    this.title,
    this.subTitle,
    this.image
  );
}

// final slides = <Slide>[

//   Slide(subTitle: 'Veniam ea excepteur incididunt voluptate sit.', image: '',)

// ];

final slides = <SlideClass>[

  SlideClass(
    'Busca la comida',
    'Laboris nulla ex reprehenderit aute exercitation tempor laboris dolor esse aute veniam.',
    'assets/img/1.png',
  ),
   SlideClass(
    'Entrega Rapida',
    'Laboris nulla ex reprehenderit aute exercitation tempor laboris dolor esse aute veniam.',
      'assets/img/2.png',
  ),
   SlideClass(
    'Disfruta',
    'Laboris nulla ex reprehenderit aute exercitation tempor laboris dolor esse aute veniam.',
    'assets/img/3.png',
  ),

];


class IntroductionScreen extends StatefulWidget {

  static const path = '/introduction';
  static const name = 'introduction';

  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  
  final PageController pageController = PageController();
  bool end = false; 

  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      final page = pageController.page ?? 0;
     if(!end && page >= (slides.length - 1.5)){
      setState(() {
      end = true;
        
      });
     }
    });
  }


  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            physics: const BouncingScrollPhysics(),
            children: slides.map(
              (dataSlide) => Slide(
                title: dataSlide.title,
                subTitle: dataSlide.subTitle,
                image: dataSlide.image,
              )
            ).toList(),
          ),

          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: (){
                context.pop();
              }, 
              child: const Text('Salir'),
            ),
          ),

           end == true ? 
           Positioned(
            bottom: 50,
            right: 30,
            child: FadeInRight(
              from: 15,
              duration: const Duration(seconds: 1),
              child: FilledButton(
                onPressed: (){
                  context.pop();
                }, 
                child: const Text('Comenzar'),
              ),
            ),
          ) : const SizedBox()
        ],
      ),
    );
  }
}


class Slide extends StatelessWidget {

  final String title;
  final String subTitle;
  final String image;
  
  const Slide({super.key, required this.title, required this.subTitle, required this.image});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final subTitleStyle = Theme.of(context).textTheme.bodyMedium;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:  20.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(image)),
            const SizedBox(height: 20,),
            Text(title, style: titleStyle,),
             const SizedBox(height: 10,),
            Text(subTitle, style: subTitleStyle,)
          ],
        ),
      ),
    );
  }
}