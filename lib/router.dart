import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:thumuht/model/session.dart';
import 'package:thumuht/pages/chat.dart';
import 'package:thumuht/pages/login.dart';
import 'package:thumuht/pages/new_post.dart';
import 'package:thumuht/pages/profile.dart';
import 'package:thumuht/pages/register.dart';
import 'package:thumuht/pages/homepage.dart';
import 'package:thumuht/pages/search_result.dart';
import 'package:thumuht/pages/user.dart';
import 'package:thumuht/pages/user_list.dart';
import 'package:thumuht/pages/user_post_list.dart';

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
    // GoRoute(
    //     path: '/search?=${}',
    //     builder: (context, state) => const searchResultPage(keyWord: keyWord)),
    GoRoute(
      path: '/chat',
      builder: (context, state) =>
          ChatPage(toUserId: (state.extra as Map<String, int>)['toUserId']!),
      redirect: (context, state) {
        if (Provider.of<Session>(context, listen: false).login_) {
          return null;
        } else {
          return '/login';
        }
      },
    ),
    GoRoute(
      path: '/user',
      builder: (context, state) {
        print(Provider.of<Session>(context, listen: false).login_);
        return UserPage(userId: (state.extra as Map<String, int>)['userId']!);
      },
      redirect: (context, state) {
        if (Provider.of<Session>(context, listen: false).login_) {
          return null;
        } else if (Provider.of<Session>(context, listen: false).userId_ ==
            (state.extra as Map<String, int>)['userId']!) {
          return '/';
        } else {
          return '/login';
        }
      },
    ),
    GoRoute(
      path: '/list',
      builder: (context, state) {
        final args = state.extra as Map<String, dynamic>;
        return UserList(
          userId: args['userId'] as int,
          isBlacklist: args['isBlacklist'] as bool,
          users: args['users'] as List<int>,
          refetch: args['refetch'] as Refetch,
        );
      },
      redirect: (context, state) {
        if (Provider.of<Session>(context, listen: false).login_) {
          return null;
        } else {
          return '/login';
        }
      },
    ),
    GoRoute(
      path: '/user-posts',
      builder: (context, state) =>
          UserPostList(userId: (state.extra as Map<String, int>)['userId']!),
      redirect: (context, state) {
        if (Provider.of<Session>(context, listen: false).login_) {
          return null;
        } else {
          return '/login';
        }
      },
    )
  ]);
}
