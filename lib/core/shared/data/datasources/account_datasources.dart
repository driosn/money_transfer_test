import '../models/account_model.dart';

abstract class AccountDataSource {
  Future<List<AccountModel>> getAccounts();
}
