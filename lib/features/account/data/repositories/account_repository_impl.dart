import 'package:meru_test/core/shared/common/transfer.dart';
import 'package:meru_test/core/shared/data/datasources/transfer_datasources.dart';
import 'package:meru_test/features/account/domain/repositories/account_repository.dart';

class AccountRepositoryImpl implements AccountRepository {
  final TransferDataSource dataSource;

  AccountRepositoryImpl({required this.dataSource});

  @override
  Future<List<Transfer>> getOwnTransactions(String accountId) async {
    final allTransfers = await dataSource.getTransferHistory();
    return allTransfers
        .where(
          (transfer) =>
              transfer.originAccount.id == accountId ||
              transfer.recipientAccount.id == accountId,
        )
        .toList();
  }
}
