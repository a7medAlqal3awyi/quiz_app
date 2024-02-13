import 'package:flutter/material.dart';
import 'package:my_quiz/core/routing/routes.dart';
import 'package:my_quiz/screens/wellcome/wellocme_screen.dart';

import '../../screens/quiz/quiz_screen.dart';

class AppRouter {
  Route generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.welcomeScreen:
        return MaterialPageRoute(
          builder: (_) => const WelcomeScreen(),
        );
      case Routes.quizScreen:
        return MaterialPageRoute(
          builder: (_) => const QuizScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text("No route defined for ${settings.name}"),
            ),
          ),
        );
    }
  }
}
