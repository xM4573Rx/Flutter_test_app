import 'package:flutter/material.dart';
import 'package:test_app/config/app_routes.dart';
import 'package:test_app/config/providers/user_provider.dart';
import 'package:test_app/models/user.dart';
import 'package:test_app/pages/all_transactions.dart';
import 'package:test_app/pages/home_page.dart';
import 'package:test_app/pages/login_page.dart';
import 'package:test_app/pages/new_page.dart';
import 'package:test_app/pages/other_page.dart';
import 'design/themes.dart';

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return UserProvider(
      userData: User(name: ''),
      child: MaterialApp(
        theme: TestThemes.defaultTheme,
        /*routes: {
             //AppRoutes.newPage:(context) => const NewPage(),
             AppRoutes.otherPage:(context) => const OtherPage(),
             AppRoutes.home:(context) => const HomePage(),
           },*/
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case AppRoutes.newPage:
              return MaterialPageRoute(builder: (context) => const NewPage());
            case AppRoutes.home:
              return MaterialPageRoute(
                builder: (context) => const HomePage(),
              );
            case AppRoutes.allTransactions:
              return MaterialPageRoute(
                builder: (context) => const AllTransactions(),
              );
            case AppRoutes.otherPage:
              return MaterialPageRoute(
                builder: (context) => const OtherPage(),
              );
            default:
              return MaterialPageRoute(builder: (context) => const LogInPage());
          }
        },
      ),
    );
  }
}
