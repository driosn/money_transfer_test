import 'package:go_router/go_router.dart';
import 'package:meru_test/core/shared/data/models/account_model.dart';
import 'package:meru_test/features/transfer_history/presentation/screens/transfer_history_screen.dart';

import '../../features/account/presentation/screens/account_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/transfer/presentation/screens/transfer_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: HomeScreen.routePath,
    routes: [
      GoRoute(
        path: HomeScreen.routePath,
        name: HomeScreen.routeName,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: AccountScreen.routePath,
        name: AccountScreen.routeName,
        builder:
            (context, state) =>
                AccountScreen(account: state.extra as AccountModel),
      ),
      GoRoute(
        path: TransferScreen.routePath,
        name: TransferScreen.routeName,
        builder:
            (context, state) =>
                TransferScreen(account: state.extra as AccountModel),
      ),
      GoRoute(
        path: TransferHistoryScreen.routePath,
        name: TransferHistoryScreen.routeName,
        builder: (context, state) => const TransferHistoryScreen(),
      ),
    ],
  );
}
