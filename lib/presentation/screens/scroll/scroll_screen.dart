import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScrollScreen extends StatefulWidget {
  static const path = '/scroll';
  static const name = 'scroll';
  const ScrollScreen({super.key});

  @override
  State<ScrollScreen> createState() => _ScrollScreenState();
}

class _ScrollScreenState extends State<ScrollScreen> {
  List<int> imageIds = [1, 2, 3, 4, 5];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        //REFRESCAR
        loadInformation();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  Future loadInformation() async {
    if (isLoading) return;

    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 2));

    addInformation();
    isLoading = false;

    if (!isMounted) return;

    setState(() {});

    movescroll();
  }

  void movescroll() {
    if (scrollController.position.pixels  <= scrollController.position.maxScrollExtent) {
      print("object");
      scrollController.animateTo(scrollController.position.pixels + 120,
          duration: const Duration(milliseconds: 300),
          curve: Curves.fastOutSlowIn,);
    }
  }

  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 3));
    if (!isMounted) return;

    isLoading = false;

    final lastId = imageIds.last;
    imageIds.clear();

    imageIds.add(lastId + 1);
    //para agregar informacion
    addInformation();
    setState(() {});
  }

  void addInformation() {
    final lastId = imageIds.last;

    imageIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e) //6 - 7 - 8 - 9 - 10
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: RefreshIndicator(
            onRefresh: onRefresh,
            child: ListView.builder(
              controller: scrollController,
              itemCount: imageIds.length,
              itemBuilder: (BuildContext context, int index) {
                return FadeInImage(
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 300,
                  placeholder: const AssetImage('assets/img/jar-loading.gif'),
                  image: NetworkImage(
                      'https://picsum.photos/id/${imageIds[index]}/500/300'),
                );
              },
            )),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => context.pop(),
          child: isLoading
              ? SpinPerfect(child: const Icon(Icons.refresh_rounded))
              : FadeIn(
                  child: const Icon(Icons.arrow_back),
                )),
    );
  }
}
