import 'package:go_router/go_router.dart';
import 'package:thumuht/pages/chat.dart';
import 'package:thumuht/pages/login.dart';
import 'package:thumuht/pages/new_post.dart';
import 'package:thumuht/pages/profile.dart';
import 'package:thumuht/pages/register.dart';
import 'package:thumuht/pages/homepage.dart';

import 'pages/profile_edit.dart';

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
    GoRoute(
      path: '/profile-edit',
      builder: (context, state) => const ProfileEditPage(),
    ),
    GoRoute(
        path: '/chat',
        builder: (context, state) =>
            ChatPage(toUserId: (state.extra as Map<String, int>)['toUserId']!))
  ]);
}
