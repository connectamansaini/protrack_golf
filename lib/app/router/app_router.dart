import 'package:go_router/go_router.dart';
import 'package:protrack_golf/app/router/app_routes.dart';
import 'package:protrack_golf/app/router/app_shell.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/locations/locations.dart';
import 'package:protrack_golf/src/my_bag/my_bag.dart';
import 'package:protrack_golf/src/sessions/sessions.dart';

/// The app's single [GoRouter] instance.
final GoRouter appRouter = GoRouter(
  initialLocation: SessionsRoutes.tab,
  routes: [
    ShellRoute(
      builder: (context, state, child) =>
          AppShell(location: state.uri.toString(), child: child),
      routes: [
        GoRoute(
          path: SessionsRoutes.tab,
          builder: (context, state) => const SessionsView(),
        ),
        GoRoute(
          path: MyBagRoutes.tab,
          builder: (context, state) => const MyBagView(),
        ),
      ],
    ),
    GoRoute(
      path: SessionsRoutes.newSession,
      builder: (context, state) => const SessionFormView(),
    ),
    GoRoute(
      path: SessionsRoutes.rangeLogger,
      builder: (context, state) => const RangeLoggerView(),
    ),
    GoRoute(
      path: SessionsRoutes.recapPattern,
      builder: (context, state) =>
          SessionRecapView(sessionId: state.pathParameters['id']!),
    ),
    GoRoute(
      path: SessionsRoutes.detailPattern,
      builder: (context, state) =>
          SessionDetailView(sessionId: state.pathParameters['id']!),
    ),
    GoRoute(
      path: MyBagRoutes.clubPattern,
      builder: (context, state) => ClubDetailView(
        club: GolfClub.fromName(state.pathParameters['club']!),
      ),
    ),
    GoRoute(
      path: LocationsRoutes.list,
      builder: (context, state) => const LocationsView(),
    ),
  ],
);
