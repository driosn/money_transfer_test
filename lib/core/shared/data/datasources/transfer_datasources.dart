import 'package:meru_test/core/shared/common/transfer.dart';
import 'package:meru_test/features/transfer/common/transfer_details.dart';

abstract class TransferDataSource {
  Future<void> executeTransfer(TransferDetails transferDetails);
  Future<void> saveTransferToHistory(TransferDetails transferDetails);
  Future<List<Transfer>> getTransferHistory();
}
