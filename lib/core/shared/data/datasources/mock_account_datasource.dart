import 'package:meru_test/dummy/dummy_accounts.dart' as da;

import '../models/account_model.dart';
import 'account_datasources.dart';

class MockAccountDataSource implements AccountDataSource {
  @override
  Future<List<AccountModel>> getAccounts() async {
    return da.dummyAccounts.map((e) => AccountModel.fromJson(e)).toList();
  }
}
