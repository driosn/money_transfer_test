import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meru_test/core/extensions/account_model_extension.dart';
import 'package:meru_test/core/shared/data/models/account_model.dart';
import 'package:meru_test/features/account/presentation/screens/account_screen.dart';
import 'package:meru_test/features/home/presentation/cubit/home_cubit.dart';
import 'package:meru_test/features/transfer_history/presentation/screens/transfer_history_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';
  static const String routePath = '/';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<HomeCubit>();
    _cubit.getAccounts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: () async {
            await _cubit.getAccounts();
          },
          child: Scaffold(
            backgroundColor: Colors.grey[50],
            body: Column(
              children: [
                const _Header(),

                const SizedBox(height: 12),
                Expanded(
                  child: state.when(
                    initial: () => const SizedBox.shrink(),
                    loading:
                        () => const Center(child: CircularProgressIndicator()),
                    loaded:
                        (accounts) => ListView(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 0.0,
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: Text(
                                'Contactos (${accounts.length})',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            ...accounts.map(
                              (acc) => _AccountTile(
                                account: acc,
                                onTap:
                                    () => context.push(
                                      AccountScreen.routePath,
                                      extra: acc,
                                    ),
                              ),
                            ),
                          ],
                        ),
                    error: (msg) => Center(child: Text(msg)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 56, left: 24, right: 24, bottom: 24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF7B5CFA), Color(0xFF5B8DF6)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Stack(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'MoneyTransfer',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Transfiere dinero fácilmente',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () => context.push(TransferHistoryScreen.routePath),
                icon: const Icon(Icons.history, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AccountTile extends StatelessWidget {
  const _AccountTile({required this.account, required this.onTap});

  final AccountModel account;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: const Color(0xFF7B5CFA),
              child: ClipOval(
                child: Image.network(
                  account.avatarUrl,
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 48,
                      height: 48,
                      decoration: const BoxDecoration(
                        color: Color(0xFF7B5CFA),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          account.initials,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    );
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    if (loadingProgress.cumulativeBytesLoaded ==
                        loadingProgress.expectedTotalBytes!) {
                      return child;
                    }
                    return Container(
                      width: 48,
                      height: 48,
                      decoration: const BoxDecoration(
                        color: Color(0xFF7B5CFA),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          account.initials,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    account.fullName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${account.balance.toStringAsFixed(2)} disponible',
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Color(0xFF7B5CFA),
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
