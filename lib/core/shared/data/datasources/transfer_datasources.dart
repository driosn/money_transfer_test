import 'package:meru_test/features/transfer/common/transfer_details.dart';

abstract class TransferDataSource {
  Future<void> executeTransfer(TransferDetails transferDetails);
}
