import 'package:meru_test/dummy/dummy_accounts.dart' as da;
import 'package:meru_test/features/transfer/common/transfer_details.dart';

import 'transfer_datasources.dart';

class MockTransferDataSource implements TransferDataSource {
  @override
  Future<void> executeTransfer(TransferDetails transferDetails) async {
    final originAccountIndex = da.dummyAccounts.indexWhere(
      (account) => account['id'] == transferDetails.originAccountId,
    );

    final recipientAccountIndex = da.dummyAccounts.indexWhere(
      (account) => account['id'] == transferDetails.recipientId,
    );

    if (originAccountIndex == -1) {
      throw Exception('Origin account not found');
    }

    if (recipientAccountIndex == -1) {
      throw Exception('Recipient account not found');
    }

    final originBalance =
        da.dummyAccounts[originAccountIndex]['balance'] as double;

    final recipientBalance =
        da.dummyAccounts[recipientAccountIndex]['balance'] as double;

    da.dummyAccounts[originAccountIndex]['balance'] =
        originBalance - transferDetails.amount;
    da.dummyAccounts[recipientAccountIndex]['balance'] =
        recipientBalance + transferDetails.amount;

    await Future.delayed(const Duration(seconds: 2));
  }
}
