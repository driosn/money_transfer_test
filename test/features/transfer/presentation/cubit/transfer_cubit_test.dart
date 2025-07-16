import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meru_test/core/failure/failure.dart';
import 'package:meru_test/features/transfer/common/transfer_details.dart';
import 'package:meru_test/features/transfer/domain/repositories/transfer_repository.dart';
import 'package:meru_test/features/transfer/presentation/cubit/transfer_cubit.dart';
import 'package:mocktail/mocktail.dart';

class MockTransferRepository extends Mock implements TransferRepository {}

void main() {
  group('TransferCubit', () {
    late TransferCubit cubit;
    late MockTransferRepository mockRepository;
    late TransferDetails transferDetails;

    setUp(() {
      mockRepository = MockTransferRepository();
      cubit = TransferCubit(transferRepository: mockRepository);
      transferDetails = TransferDetails(
        originBalance: 100.0,
        originAccountId: '1',
        recipientId: '2',
        amount: 50.0,
      );
    });

    test('initial state should be initial', () {
      expect(cubit.state, const TransferState.initial());
    });

    group('executeTransfer', () {
      blocTest<TransferCubit, TransferState>(
        'should emit loading then success when transfer is successful',
        build: () => cubit,
        setUp: () {
          when(
            () => mockRepository.executeTransfer(transferDetails),
          ).thenAnswer((_) async => right(null));
        },
        act: (cubit) => cubit.executeTransfer(transferDetails),
        expect:
            () => [
              const TransferState.loading(),
              const TransferState.success(),
            ],
        verify: (_) {
          verify(
            () => mockRepository.executeTransfer(transferDetails),
          ).called(1);
        },
      );

      blocTest<TransferCubit, TransferState>(
        'should emit loading then error when transfer fails',
        build: () => cubit,
        setUp: () {
          when(
            () => mockRepository.executeTransfer(transferDetails),
          ).thenAnswer((_) async => left(Failure('Transfer failed')));
        },
        act: (cubit) => cubit.executeTransfer(transferDetails),
        expect:
            () => [
              const TransferState.loading(),
              const TransferState.error('Transfer failed'),
            ],
        verify: (_) {
          verify(
            () => mockRepository.executeTransfer(transferDetails),
          ).called(1);
        },
      );
    });

    group('state transitions', () {
      test('should handle multiple state transitions correctly', () async {
        // Arrange
        when(
          () => mockRepository.executeTransfer(transferDetails),
        ).thenAnswer((_) async => right(null));

        // Act & Assert
        expect(cubit.state, const TransferState.initial());

        cubit.executeTransfer(transferDetails);
        await Future.delayed(const Duration(milliseconds: 10));
        expect(cubit.state, const TransferState.success());
      });
    });
  });
}
