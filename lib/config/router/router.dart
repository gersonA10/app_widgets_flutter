import 'package:aplicacion_numero_dos_fljp/presentation/screens/screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: HomeScreen.path,
  routes: [
  GoRoute(
    path: HomeScreen.path,
    name: HomeScreen.name,
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: ButtonsScreen.path,
    name: ButtonsScreen.name,
    builder: (context, state) => const ButtonsScreen(),
  ),
   GoRoute(
    path: CardsScreen.path,
    name: CardsScreen.name,
    builder: (context, state) => const CardsScreen(),
  ),
  GoRoute(
    path: SnackBarScreen.path,
    name: SnackBarScreen.name,
    builder: (context, state) => const SnackBarScreen(),
  ),
  GoRoute(
    path: AnimatedWidget.path,
    name: AnimatedWidget.name,
    builder: (context, state) => const AnimatedWidget(),
  ),
   GoRoute(
    path: IntroductionScreen.path,
    name: IntroductionScreen.name,
    builder: (context, state) => const IntroductionScreen(),
  ),
   GoRoute(
    path: ControlsScreen.path,
    name: ControlsScreen.name,
    builder: (context, state) => const ControlsScreen(),
  ),
   GoRoute(
    path: ProgressScreen.path,
    name: ProgressScreen.name,
    builder: (context, state) => const ProgressScreen(),
  ),
  GoRoute(
    path: ScrollScreen.path,
    name: ScrollScreen.name,
    builder: (context, state) => const ScrollScreen(),
  ),
]);
