import 'package:flutter_test/flutter_test.dart';
import 'package:meru_test/features/transfer/common/transfer_details.dart';

void main() {
  group('TransferDetails', () {
    test('should create TransferDetails with valid parameters', () {
      // Arrange & Act
      final transferDetails = TransferDetails(
        originBalance: 100.0,
        originAccountId: '1',
        recipientId: '2',
        amount: 50.0,
      );

      // Assert
      expect(transferDetails.originBalance, 100.0);
      expect(transferDetails.originAccountId, '1');
      expect(transferDetails.recipientId, '2');
      expect(transferDetails.amount, 50.0);
    });

    test('should create TransferDetails with zero amount', () {
      // Arrange & Act
      final transferDetails = TransferDetails(
        originBalance: 100.0,
        originAccountId: '1',
        recipientId: '2',
        amount: 0.0,
      );

      // Assert
      expect(transferDetails.amount, 0.0);
    });

    test('should create TransferDetails with decimal amount', () {
      // Arrange & Act
      final transferDetails = TransferDetails(
        originBalance: 100.0,
        originAccountId: '1',
        recipientId: '2',
        amount: 25.50,
      );

      // Assert
      expect(transferDetails.amount, 25.50);
    });

    test('should create TransferDetails with large amount', () {
      // Arrange & Act
      final transferDetails = TransferDetails(
        originBalance: 10000.0,
        originAccountId: '1',
        recipientId: '2',
        amount: 9999.99,
      );

      // Assert
      expect(transferDetails.amount, 9999.99);
    });

    test('should create TransferDetails with same origin and recipient', () {
      // Arrange & Act
      final transferDetails = TransferDetails(
        originBalance: 100.0,
        originAccountId: '1',
        recipientId: '1',
        amount: 50.0,
      );

      // Assert
      expect(transferDetails.originAccountId, transferDetails.recipientId);
    });

    test('should create TransferDetails with different account IDs', () {
      // Arrange & Act
      final transferDetails = TransferDetails(
        originBalance: 100.0,
        originAccountId: 'account_123',
        recipientId: 'account_456',
        amount: 50.0,
      );

      // Assert
      expect(transferDetails.originAccountId, 'account_123');
      expect(transferDetails.recipientId, 'account_456');
      expect(
        transferDetails.originAccountId,
        isNot(equals(transferDetails.recipientId)),
      );
    });

    test('should create TransferDetails with zero origin balance', () {
      // Arrange & Act
      final transferDetails = TransferDetails(
        originBalance: 0.0,
        originAccountId: '1',
        recipientId: '2',
        amount: 0.0,
      );

      // Assert
      expect(transferDetails.originBalance, 0.0);
      expect(transferDetails.amount, 0.0);
    });

    test('should create TransferDetails with negative amount', () {
      // Arrange & Act
      final transferDetails = TransferDetails(
        originBalance: 100.0,
        originAccountId: '1',
        recipientId: '2',
        amount: -10.0,
      );

      // Assert
      expect(transferDetails.amount, -10.0);
    });
  });
}
