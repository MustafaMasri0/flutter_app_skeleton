import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/home/presentation/home_page.dart';
part 'app_router.g.dart';

/// Provides the app's router configuration using GoRouter.
///
/// This router is responsible for managing navigation and routing within the app.
/// Routes can be added to the `routes` list.
@Riverpod(keepAlive: true)
GoRouter router(Ref ref) {
  return GoRouter(initialLocation: HomeRoute().location, routes: $appRoutes);
}

@TypedGoRoute<HomeRoute>(path: '/')
class HomeRoute extends GoRouteData with $HomeRoute {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}
