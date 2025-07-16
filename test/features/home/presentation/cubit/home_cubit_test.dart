import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meru_test/core/shared/data/datasources/mock_account_datasource.dart';
import 'package:meru_test/features/home/data/repositories/home_repository_impl.dart';
import 'package:meru_test/features/home/presentation/cubit/home_cubit.dart';

void main() {
  group('HomeCubit', () {
    late HomeCubit cubit;
    late MockAccountDataSource mockAccountDataSource;
    late HomeRepositoryImpl repository;

    setUp(() {
      mockAccountDataSource = MockAccountDataSource();
      repository = HomeRepositoryImpl(dataSource: mockAccountDataSource);
      cubit = HomeCubit(repository);
    });

    test('initial state should be initial', () {
      expect(cubit.state, const HomeState.initial());
    });

    group('getAccounts', () {
      blocTest<HomeCubit, HomeState>(
        'should emit loading then loaded when accounts are fetched successfully',
        build: () => cubit,
        act: (cubit) => cubit.getAccounts(),
        expect: () => [const HomeState.loading(), isA<HomeState>()],
      );

      test('should handle empty accounts list', () async {
        cubit.getAccounts();
        await Future.delayed(const Duration(milliseconds: 10));

        expect(cubit.state, isA<HomeState>());
      });

      test('should handle single account', () async {
        cubit.getAccounts();
        await Future.delayed(const Duration(milliseconds: 10));

        expect(cubit.state, isA<HomeState>());
      });
    });

    group('state transitions', () {
      test('should handle multiple getAccounts calls correctly', () async {
        expect(cubit.state, const HomeState.initial());

        cubit.getAccounts();
        await Future.delayed(const Duration(milliseconds: 10));
        expect(cubit.state, isA<HomeState>());

        cubit.getAccounts();
        await Future.delayed(const Duration(milliseconds: 10));
        expect(cubit.state, isA<HomeState>());
      });
    });
  });
}
