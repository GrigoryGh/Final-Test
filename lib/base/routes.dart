import 'package:final_test/pages/auth/login/login_page.dart';
import 'package:final_test/pages/homepage/home_page.dart';
import 'package:final_test/pages/leaderboard/leaderboard_page.dart';
import 'package:final_test/pages/pageview/pageview.dart';
import 'package:final_test/pages/purchases/purchases_page.dart';
import 'package:flutter/material.dart';

import '../pages/quiz/quiz_page.dart';

class AppRoutes {
  static const login = '/login';
  static const pageview = '/pageview';
  static const homepage = '/homepage';
  static const purchasesPage = '/purchasesPage';
  static const quizPage = '/quizPage';
  static const leaderBoardPage = '/leaderBoardPage';

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    PageArguments? pageArguments;
    if (settings.arguments != null) {
      pageArguments = (settings.arguments as PageArguments);
    }

    var routes = <String, WidgetBuilder>{
      AppRoutes.login: (context) => const LoginPage(),
      AppRoutes.pageview: (context) => const PageViewWidget(),
      AppRoutes.homepage: (context) => const HomePageWidget(),
      AppRoutes.purchasesPage: (context) => const PurchasesPage(),
      AppRoutes.quizPage: (context) => const QuizPage(),
      AppRoutes.leaderBoardPage: (context) => const LeaderBoardPage()
    };

    WidgetBuilder builder = routes[settings.name] ?? routes.values.first;
    return MaterialPageRoute(builder: (ctx) => builder(ctx));
  }
}

class PageArguments {
  final String? pageTitle;
  final Map<String, dynamic>? data;

  PageArguments({
    this.pageTitle,
    this.data,
  });
}
