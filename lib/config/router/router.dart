import 'package:aplicacion_numero_dos_fljp/presentation/screens/buttons/buttons_screens.dart';
import 'package:aplicacion_numero_dos_fljp/presentation/screens/cards/cards.dart';
import 'package:aplicacion_numero_dos_fljp/presentation/screens/home/home_screen.dart';
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
]);
