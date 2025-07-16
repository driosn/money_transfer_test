import 'package:flutter_test/flutter_test.dart';
import 'package:meru_test/core/shared/data/models/account_model.dart';
import 'package:meru_test/features/transfer/common/transfer_details.dart';

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
  group('TransferDetails', () {
    test('should create TransferDetails with valid parameters', () {
      final transferDetails = TransferDetails(
        originAccount: dummyOrigin,
        recipientAccount: dummyRecipient,
        amount: 50.0,
      );

      expect(transferDetails.originAccount, dummyOrigin);
      expect(transferDetails.recipientAccount, dummyRecipient);
      expect(transferDetails.amount, 50.0);
    });

    test('should create TransferDetails with zero amount', () {
      final transferDetails = TransferDetails(
        originAccount: dummyOrigin,
        recipientAccount: dummyRecipient,
        amount: 0.0,
      );

      expect(transferDetails.amount, 0.0);
    });

    test('should create TransferDetails with decimal amount', () {
      final transferDetails = TransferDetails(
        originAccount: dummyOrigin,
        recipientAccount: dummyRecipient,
        amount: 25.50,
      );

      expect(transferDetails.amount, 25.50);
    });

    test('should create TransferDetails with large amount', () {
      final transferDetails = TransferDetails(
        originAccount: dummyOrigin,
        recipientAccount: dummyRecipient,
        amount: 9999.99,
      );

      expect(transferDetails.amount, 9999.99);
    });

    test('should create TransferDetails with same origin and recipient', () {
      final transferDetails = TransferDetails(
        originAccount: dummyOrigin,
        recipientAccount: dummyOrigin,
        amount: 50.0,
      );

      expect(transferDetails.originAccount, transferDetails.recipientAccount);
    });

    test('should create TransferDetails with different account IDs', () {
      final transferDetails = TransferDetails(
        originAccount: AccountModel(
          id: 'account_123',
          fullName: 'A',
          avatarUrl: '',
          balance: 100.0,
        ),
        recipientAccount: AccountModel(
          id: 'account_456',
          fullName: 'B',
          avatarUrl: '',
          balance: 100.0,
        ),
        amount: 50.0,
      );

      expect(transferDetails.originAccount.id, 'account_123');
      expect(transferDetails.recipientAccount.id, 'account_456');
      expect(
        transferDetails.originAccount.id,
        isNot(equals(transferDetails.recipientAccount.id)),
      );
    });

    test('should create TransferDetails with zero origin balance', () {
      final transferDetails = TransferDetails(
        originAccount: AccountModel(
          id: '1',
          fullName: 'Origin',
          avatarUrl: '',
          balance: 0.0,
        ),
        recipientAccount: dummyRecipient,
        amount: 0.0,
      );

      expect(transferDetails.originAccount.balance, 0.0);
      expect(transferDetails.amount, 0.0);
    });

    test('should create TransferDetails with negative amount', () {
      final transferDetails = TransferDetails(
        originAccount: dummyOrigin,
        recipientAccount: dummyRecipient,
        amount: -10.0,
      );

      expect(transferDetails.amount, -10.0);
    });
  });
}
