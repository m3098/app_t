import 'package:go_router/go_router.dart';
import 'package:test_app/screens/dif_options_screen.dart';
import 'package:test_app/screens/game_options_screen.dart';
import 'package:test_app/screens/game_over_screen.dart';
import 'package:test_app/screens/game_screen.dart';
import 'package:test_app/screens/loading_screen.dart';
import 'package:test_app/screens/menu_screen.dart';

final router = GoRouter(
  initialLocation: '/loading',
  routes: [
    GoRoute(
      path: '/loading',
      builder: (context, state) => LoadingScreen(),
    ),
    GoRoute(
      path: '/menu',
      builder: (context, state) => MenuScreen(),
    ),
    GoRoute(
      path: '/dif',
      builder: (context, state) => DifOptionsScreen(),
    ),
    GoRoute(
      path: '/game',
      builder: (context, state) => GameScreen(),
    ),
    GoRoute(
      path: '/game_over',
      builder: (context, state) => GameOverScreen(),
    ),
    GoRoute(
      path: '/options',
      builder: (context, state) => GameOptionsScreen(),
    ),
  ],
);
