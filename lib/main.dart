import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meru_test/features/account/data/repositories/account_repository_impl.dart';
import 'package:meru_test/features/account/presentation/cubit/account_cubit.dart';
import 'package:meru_test/features/transfer/presentation/cubit/transfer_cubit.dart';
import 'package:meru_test/features/transfer_history/data/repositories/transfer_history_repository_impl.dart';
import 'package:meru_test/features/transfer_history/presentation/cubit/transfer_history_cubit.dart';

import 'core/router/app_router.dart';
import 'core/shared/data/datasources/mock_account_datasource.dart';
import 'core/shared/data/datasources/mock_transfer_datasource.dart';
import 'features/home/data/repositories/home_repository_impl.dart';
import 'features/home/presentation/cubit/home_cubit.dart';
import 'features/transfer/data/repositories/transfer_repository_impl.dart';

void main() => runApp(const MeruTest());

class MeruTest extends StatelessWidget {
  const MeruTest({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => HomeCubit(
                HomeRepositoryImpl(dataSource: MockAccountDataSource()),
              ),
        ),
        BlocProvider(
          create:
              (context) => TransferCubit(
                transferRepository: TransferRepositoryImpl(
                  accountDataSource: MockAccountDataSource(),
                  transferDataSource: MockTransferDataSource(),
                ),
              ),
        ),
        BlocProvider(
          create:
              (context) => TransferHistoryCubit(
                TransferHistoryRepositoryImpl(
                  dataSource: MockTransferDataSource(),
                ),
              ),
        ),

        BlocProvider(
          create:
              (context) => AccountCubit(
                AccountRepositoryImpl(dataSource: MockTransferDataSource()),
              ),
        ),
      ],
      child: MaterialApp.router(
        title: 'Meru Test',
        routerConfig: AppRouter.router,
        restorationScopeId: 'meru_test_app',
      ),
    );
  }
}
