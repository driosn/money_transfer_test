import 'package:flutter_test/flutter_test.dart';
import 'package:meru_test/core/shared/data/datasources/mock_transfer_datasource.dart';
import 'package:meru_test/core/shared/data/models/account_model.dart';
import 'package:meru_test/dummy/dummy_accounts.dart' as da;
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
  group('MockTransferDataSource', () {
    late MockTransferDataSource dataSource;

    setUp(() {
      dataSource = MockTransferDataSource();

      for (var account in da.dummyAccounts) {
        if (account['id'] == '1') account['balance'] = 100.0;
        if (account['id'] == '2') account['balance'] = 100.0;
      }
    });

    test('should execute transfer successfully', () async {
      final transferDetails = TransferDetails(
        originAccount: dummyOrigin,
        recipientAccount: dummyRecipient,
        amount: 50.0,
      );

      expect(
        () async => await dataSource.executeTransfer(transferDetails),
        returnsNormally,
      );
    });

    test('should throw exception when origin account not found', () async {
      final transferDetails = TransferDetails(
        originAccount: AccountModel(
          id: '999',
          fullName: 'Unknown',
          avatarUrl: '',
          balance: 100.0,
        ),
        recipientAccount: dummyRecipient,
        amount: 50.0,
      );

      expect(
        () async => await dataSource.executeTransfer(transferDetails),
        throwsA(isA<Exception>()),
      );
    });

    test('should throw exception when recipient account not found', () async {
      final transferDetails = TransferDetails(
        originAccount: dummyOrigin,
        recipientAccount: AccountModel(
          id: '999',
          fullName: 'Unknown',
          avatarUrl: '',
          balance: 100.0,
        ),
        amount: 50.0,
      );

      expect(
        () async => await dataSource.executeTransfer(transferDetails),
        throwsA(isA<Exception>()),
      );
    });

    test('should handle zero amount transfer', () async {
      final transferDetails = TransferDetails(
        originAccount: dummyOrigin,
        recipientAccount: dummyRecipient,
        amount: 0.0,
      );

      expect(
        () async => await dataSource.executeTransfer(transferDetails),
        returnsNormally,
      );
    });

    test('should handle small amount transfer', () async {
      final transferDetails = TransferDetails(
        originAccount: dummyOrigin,
        recipientAccount: dummyRecipient,
        amount: 0.01,
      );

      expect(
        () async => await dataSource.executeTransfer(transferDetails),
        returnsNormally,
      );
    });
  });
}
