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
          // Arrange
          final transferDetails = TransferDetails(
            originBalance: 100.0,
            originAccountId: '1',
            recipientId: '2',
            amount: 50.0,
          );

          when(
            () => mockTransferDataSource.executeTransfer(transferDetails),
          ).thenAnswer((_) async {});

          // Act
          final result = await repository.executeTransfer(transferDetails);

          // Assert
          expect(result, isA<Right<Failure, void>>());
          verify(
            () => mockTransferDataSource.executeTransfer(transferDetails),
          ).called(1);
        },
      );

      test('should return failure when amount is zero', () async {
        // Arrange
        final transferDetails = TransferDetails(
          originBalance: 100.0,
          originAccountId: '1',
          recipientId: '2',
          amount: 0.0,
        );

        // Act
        final result = await repository.executeTransfer(transferDetails);

        // Assert
        expect(result, isA<Left<Failure, void>>());
        expect(
          (result as Left).value.message,
          'El monto debe ser mayor a cero.',
        );
      });

      test('should return failure when amount is negative', () async {
        // Arrange
        final transferDetails = TransferDetails(
          originBalance: 100.0,
          originAccountId: '1',
          recipientId: '2',
          amount: -10.0,
        );

        // Act
        final result = await repository.executeTransfer(transferDetails);

        // Assert
        expect(result, isA<Left<Failure, void>>());
        expect(
          (result as Left).value.message,
          'El monto debe ser mayor a cero.',
        );
      });

      test('should return failure when insufficient balance', () async {
        // Arrange
        final transferDetails = TransferDetails(
          originBalance: 30.0,
          originAccountId: '1',
          recipientId: '2',
          amount: 50.0,
        );

        // Act
        final result = await repository.executeTransfer(transferDetails);

        // Assert
        expect(result, isA<Left<Failure, void>>());
        expect((result as Left).value.message, 'Saldo insuficiente.');
      });

      test('should return failure when transfer throws exception', () async {
        // Arrange
        final transferDetails = TransferDetails(
          originBalance: 100.0,
          originAccountId: '1',
          recipientId: '2',
          amount: 50.0,
        );

        when(
          () => mockTransferDataSource.executeTransfer(transferDetails),
        ).thenThrow(Exception('Transfer failed'));

        // Act
        final result = await repository.executeTransfer(transferDetails);

        // Assert
        expect(result, isA<Left<Failure, void>>());
        expect((result as Left).value.message, 'Exception: Transfer failed');
      });
    });

    group('getRecipients', () {
      test(
        'should return list of recipients excluding origin account',
        () async {
          // Arrange
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

          // Act
          final result = await repository.getRecipients(origin);

          // Assert
          expect(result, isA<Right<Failure, List<AccountModel>>>());
          final recipients = (result as Right).value;
          expect(recipients.length, 2);
          expect(recipients.every((account) => account.id != origin.id), true);
          verify(() => mockAccountDataSource.getAccounts()).called(1);
        },
      );

      test('should return failure when getAccounts throws exception', () async {
        // Arrange
        final origin = AccountModel(
          id: '1',
          fullName: 'John Doe',
          avatarUrl: 'https://example.com/avatar.jpg',
          balance: 100.0,
        );

        when(
          () => mockAccountDataSource.getAccounts(),
        ).thenThrow(Exception('Failed to get accounts'));

        // Act
        final result = await repository.getRecipients(origin);

        // Assert
        expect(result, isA<Left<Failure, List<AccountModel>>>());
        expect(
          (result as Left).value.message,
          'Error al obtener destinatarios.',
        );
      });
    });
  });
}
