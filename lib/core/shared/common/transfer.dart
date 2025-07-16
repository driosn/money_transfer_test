import 'package:meru_test/core/shared/data/models/account_model.dart';

class Transfer {
  final AccountModel originAccount;
  final AccountModel recipientAccount;
  final double amount;
  final DateTime createdAt;

  Transfer({
    required this.originAccount,
    required this.recipientAccount,
    required this.amount,
    required this.createdAt,
  });
}
