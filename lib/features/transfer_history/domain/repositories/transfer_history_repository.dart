import 'package:meru_test/core/shared/common/transfer.dart';

abstract class TransferHistoryRepository {
  Future<List<Transfer>> getTransferHistory();
}
