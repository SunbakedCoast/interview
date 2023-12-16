import 'package:balance/feature/groups/presentation/pages/pages.dart';
import 'package:go_router/go_router.dart';

import 'package:balance/feature/home/presentation/pages/home_page.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const NewHomePage(),
    ),
    GoRoute(
      path: '/groups/:id',
      builder: (context, state) => NewGroupPage(state.pathParameters['id']!),
    ),
  ],
);
