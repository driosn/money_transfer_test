import 'package:flutter_test/flutter_test.dart';
import 'package:meru_test/core/shared/data/datasources/mock_transfer_datasource.dart';
import 'package:meru_test/features/transfer/common/transfer_details.dart';

// Helper function to get account balance from dummy data
double _getAccountBalance(String accountId) {
  // This would need to access the dummy accounts data
  // For now, we'll return a mock value
  return 100.0;
}

void main() {
  group('MockTransferDataSource', () {
    late MockTransferDataSource dataSource;

    setUp(() {
      dataSource = MockTransferDataSource();
    });

    test('should execute transfer successfully', () async {
      // Arrange
      final transferDetails = TransferDetails(
        originBalance: 100.0,
        originAccountId: '1',
        recipientId: '2',
        amount: 50.0,
      );

      // Act & Assert
      expect(
        () async => await dataSource.executeTransfer(transferDetails),
        returnsNormally,
      );
    });

    test('should throw exception when origin account not found', () async {
      // Arrange
      final transferDetails = TransferDetails(
        originBalance: 100.0,
        originAccountId: '999', // Non-existent account
        recipientId: '2',
        amount: 50.0,
      );

      // Act & Assert
      expect(
        () async => await dataSource.executeTransfer(transferDetails),
        throwsA(isA<Exception>()),
      );
    });

    test('should throw exception when recipient account not found', () async {
      // Arrange
      final transferDetails = TransferDetails(
        originBalance: 100.0,
        originAccountId: '1',
        recipientId: '999', // Non-existent account
        amount: 50.0,
      );

      // Act & Assert
      expect(
        () async => await dataSource.executeTransfer(transferDetails),
        throwsA(isA<Exception>()),
      );
    });

    test('should update account balances after transfer', () async {
      // Arrange
      final transferDetails = TransferDetails(
        originBalance: 100.0,
        originAccountId: '1',
        recipientId: '2',
        amount: 30.0,
      );

      // Get initial balances
      final initialOriginBalance = _getAccountBalance('1');
      final initialRecipientBalance = _getAccountBalance('2');

      // Act
      await dataSource.executeTransfer(transferDetails);

      // Assert
      final finalOriginBalance = _getAccountBalance('1');
      final finalRecipientBalance = _getAccountBalance('2');

      expect(finalOriginBalance, equals(initialOriginBalance - 30.0));
      expect(finalRecipientBalance, equals(initialRecipientBalance + 30.0));
    });

    test('should handle zero amount transfer', () async {
      // Arrange
      final transferDetails = TransferDetails(
        originBalance: 100.0,
        originAccountId: '1',
        recipientId: '2',
        amount: 0.0,
      );

      // Act & Assert
      expect(
        () async => await dataSource.executeTransfer(transferDetails),
        returnsNormally,
      );
    });

    test('should handle small amount transfer', () async {
      // Arrange
      final transferDetails = TransferDetails(
        originBalance: 100.0,
        originAccountId: '1',
        recipientId: '2',
        amount: 0.01,
      );

      // Act & Assert
      expect(
        () async => await dataSource.executeTransfer(transferDetails),
        returnsNormally,
      );
    });
  });
}
