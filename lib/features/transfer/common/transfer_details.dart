import 'package:meru_test/core/shared/data/models/account_model.dart';

class TransferDetails {
  final AccountModel originAccount;
  final AccountModel recipientAccount;
  final double amount;

  TransferDetails({
    required this.originAccount,
    required this.recipientAccount,
    required this.amount,
  });
}
