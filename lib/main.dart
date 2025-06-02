import 'package:flutter/material.dart';
import 'package:x90/core/constants/themes/app_theme.dart';
import 'package:x90/core/router/router.dart';

void main() => runApp(X90App());

class X90App extends StatelessWidget {
  const X90App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      routerConfig: AppRouter.router,
    );
  }
}
