import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meru_test/core/failure/failure.dart';
import 'package:meru_test/core/shared/data/datasources/account_datasources.dart';
import 'package:meru_test/core/shared/data/datasources/transfer_datasources.dart';
import 'package:meru_test/core/shared/data/models/account_model.dart';
import 'package:meru_test/features/transfer/common/transfer_details.dart';
import 'package:meru_test/features/transfer/data/repositories/transfer_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

class MockAccountDataSource extends Mock implements AccountDataSource {}

class MockTransferDataSource extends Mock implements TransferDataSource {}

final dummyOrigin = AccountModel(
  id: '1',
  fullName: 'Origin',
  avatarUrl: '',
  balance: 100.0,
);
final dummyRecipient = AccountModel(
  id: '2',
  fullName: 'Recipient',
  avatarUrl: '',
  balance: 100.0,
);

void main() {
  group('TransferRepositoryImpl', () {
    late TransferRepositoryImpl repository;
    late MockAccountDataSource mockAccountDataSource;
    late MockTransferDataSource mockTransferDataSource;

    setUp(() {
      mockAccountDataSource = MockAccountDataSource();
      mockTransferDataSource = MockTransferDataSource();
      repository = TransferRepositoryImpl(
        accountDataSource: mockAccountDataSource,
        transferDataSource: mockTransferDataSource,
      );
    });

    group('executeTransfer', () {
      test(
        'should return success when transfer is executed successfully',
        () async {
          final transferDetails = TransferDetails(
            originAccount: dummyOrigin,
            recipientAccount: dummyRecipient,
            amount: 50.0,
          );

          when(
            () => mockTransferDataSource.executeTransfer(transferDetails),
          ).thenAnswer((_) async {});

          final result = await repository.executeTransfer(transferDetails);

          expect(result, isA<Right<Failure, void>>());
          verify(
            () => mockTransferDataSource.executeTransfer(transferDetails),
          ).called(1);
        },
      );

      test('should return failure when amount is zero', () async {
        final transferDetails = TransferDetails(
          originAccount: dummyOrigin,
          recipientAccount: dummyRecipient,
          amount: 0.0,
        );

        final result = await repository.executeTransfer(transferDetails);

        expect(result, isA<Left<Failure, void>>());
        expect(
          (result as Left).value.message,
          'El monto debe ser mayor a cero.',
        );
      });

      test('should return failure when amount is negative', () async {
        final transferDetails = TransferDetails(
          originAccount: dummyOrigin,
          recipientAccount: dummyRecipient,
          amount: -10.0,
        );

        final result = await repository.executeTransfer(transferDetails);

        expect(result, isA<Left<Failure, void>>());
        expect(
          (result as Left).value.message,
          'El monto debe ser mayor a cero.',
        );
      });

      test('should return failure when insufficient balance', () async {
        final transferDetails = TransferDetails(
          originAccount: AccountModel(
            id: '1',
            fullName: 'Origin',
            avatarUrl: '',
            balance: 30.0,
          ),
          recipientAccount: dummyRecipient,
          amount: 50.0,
        );

        final result = await repository.executeTransfer(transferDetails);

        expect(result, isA<Left<Failure, void>>());
        expect((result as Left).value.message, 'Saldo insuficiente.');
      });

      test('should return failure when transfer throws exception', () async {
        final transferDetails = TransferDetails(
          originAccount: dummyOrigin,
          recipientAccount: dummyRecipient,
          amount: 50.0,
        );

        when(
          () => mockTransferDataSource.executeTransfer(transferDetails),
        ).thenThrow(Exception('Transfer failed'));

        final result = await repository.executeTransfer(transferDetails);

        expect(result, isA<Left<Failure, void>>());
        expect((result as Left).value.message, 'Exception: Transfer failed');
      });
    });

    group('getRecipients', () {
      test(
        'should return list of recipients excluding origin account',
        () async {
          final origin = AccountModel(
            id: '1',
            fullName: 'John Doe',
            avatarUrl: 'https://example.com/avatar.jpg',
            balance: 100.0,
          );

          final allAccounts = [
            origin,
            AccountModel(
              id: '2',
              fullName: 'Jane Smith',
              avatarUrl: 'https://example.com/avatar2.jpg',
              balance: 50.0,
            ),
            AccountModel(
              id: '3',
              fullName: 'Bob Johnson',
              avatarUrl: 'https://example.com/avatar3.jpg',
              balance: 75.0,
            ),
          ];

          when(
            () => mockAccountDataSource.getAccounts(),
          ).thenAnswer((_) async => allAccounts);

          final result = await repository.getRecipients(origin);

          expect(result, isA<Right<Failure, List<AccountModel>>>());
          final recipients = (result as Right).value;
          expect(recipients.length, 2);
          expect(recipients.every((account) => account.id != origin.id), true);
          verify(() => mockAccountDataSource.getAccounts()).called(1);
        },
      );

      test('should return failure when getAccounts throws exception', () async {
        final origin = AccountModel(
          id: '1',
          fullName: 'John Doe',
          avatarUrl: 'https://example.com/avatar.jpg',
          balance: 100.0,
        );

        when(
          () => mockAccountDataSource.getAccounts(),
        ).thenThrow(Exception('Failed to get accounts'));

        final result = await repository.getRecipients(origin);

        expect(result, isA<Left<Failure, List<AccountModel>>>());
        expect(
          (result as Left).value.message,
          'Error al obtener destinatarios.',
        );
      });
    });
  });
}
