import 'package:meru_test/core/shared/common/transfer.dart';

abstract class AccountRepository {
  Future<List<Transfer>> getOwnTransactions(String accountId);
}
