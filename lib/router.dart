import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:thumuht/pages/login.dart';
import 'package:thumuht/pages/new_post.dart';
import 'package:thumuht/pages/profile.dart';
import 'package:thumuht/pages/register.dart';
import 'package:thumuht/pages/homepage.dart';
import 'package:thumuht/pages/search_result.dart';

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
      path: '/newpost',
      builder: (context, state) => const NewPostPage(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(title_: 'thumuht'),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfilePage(),
    ),
    // GoRoute(
    //     path: '/search?=${}',
    //     builder: (context, state) => const searchResultPage(keyWord: keyWord))
  ]);
}
