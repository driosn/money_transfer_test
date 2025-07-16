class TransferDetails {
  final double originBalance;
  final String originAccountId;
  final String recipientId;
  final double amount;

  TransferDetails({
    required this.originBalance,
    required this.originAccountId,
    required this.recipientId,
    required this.amount,
  });
}
