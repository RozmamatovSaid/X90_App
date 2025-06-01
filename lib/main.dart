import 'package:flutter/material.dart';
import 'package:x90/core/constants/themes/app_theme.dart';
import 'package:x90/features/auth/peresentation/screens/auth_screen.dart';
import 'package:x90/features/auth/peresentation/screens/splash_screen.dart';

void main() => runApp(X90App());

class X90App extends StatelessWidget {
  const X90App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      home: SplashScreen(),
    );
  }
}
