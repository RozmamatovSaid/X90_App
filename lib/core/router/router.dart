import 'package:go_router/go_router.dart';
import 'package:x90/core/router/routes.dart';
import 'package:x90/features/auth/peresentation/screens/login_screen.dart';
import 'package:x90/features/auth/peresentation/screens/signup_screen.dart';
import 'package:x90/features/auth/peresentation/screens/splash_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: AppRoutes.signUp,
    routes: [
      GoRoute(
        path: AppRoutes.splashScreen,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.signUp,
        builder: (context, state) => SignupScreen(),
      ),
      GoRoute(
        path: AppRoutes.enterTheCode,
        builder: (context, state) => EnterTheCode(),
      ),
    ],
  );
}
