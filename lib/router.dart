import 'package:go_router/go_router.dart';
import 'package:thumuht/pages/login.dart';
import 'package:thumuht/pages/register.dart';
import 'package:thumuht/pages/homepage.dart';

GoRouter router() {
  return GoRouter(initialLocation: '/', routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(title_: 'thumuht'),
    )
  ]);
}
