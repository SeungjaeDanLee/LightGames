import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'theme/light_games_theme.dart';
import 'features/home/home_screen.dart';
import 'features/liar_game/liar_game_screen.dart';
import 'features/settings/settings_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        title: '나들이용 오프라인 파티 게임',
        theme: lightGamesTheme,
        routerConfig: _router,
        debugShowCheckedModeBanner: false,
      );
}

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/liar',
      builder: (context, state) => const LiarGameScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
  ],
); 