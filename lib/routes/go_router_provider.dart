import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_fleet/screens/auth/login_screen.dart';
import 'package:super_fleet/screens/error_screen.dart';
import 'package:super_fleet/screens/dashboard/dashboard_screen.dart';
import 'package:super_fleet/screens/non-requisition/non_requisition.dart';
import 'package:super_fleet/screens/requisition/requisition_screen.dart';
import 'package:super_fleet/screens/splash_screen.dart';
import 'package:super_fleet/screens/summary/summary.dart';

final goRouterProvider = StateProvider<GoRouter>((ref) {
  return GoRouter(
      initialLocation: '/splash',
      errorBuilder: (context, state) => const ErrorPage(),
      routes: [
        GoRoute(
          path: '/login',
          name: 'login',
          builder: ((context, state) => LoginScreen(key: state.pageKey)),
        ),
        GoRoute(
          path: "/splash",
          name: 'splash',
          builder: (context, state) => SplashScreenPage(
            key: state.pageKey,
          ),
        ),
        GoRoute(
            path: "/dashboard",
            name: 'dashboard',
            builder: (context, state) => DashboardScreen(
                  key: state.pageKey,
                ),
            routes: [
              GoRoute(
                path: "requisition",
                name: 'requisition',
                builder: (context, state) => RequisitionScreen(
                  key: state.pageKey,
                ),
              ),
              GoRoute(
                path: "nonrequisition",
                name: 'nonrequisition',
                builder: (context, state) => NonRequisitionScreen(
                  key: state.pageKey,
                ),
              ),
              GoRoute(
                path: "summary",
                name: 'summary',
                builder: (context, state) => SummaryScreen(
                  key: state.pageKey,
                ),
              ),
            ]),
      ]);
});
