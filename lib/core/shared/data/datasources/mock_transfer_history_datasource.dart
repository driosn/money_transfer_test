import 'package:meru_test/core/shared/common/transfer.dart';
import 'package:meru_test/core/shared/data/datasources/transfer_history.dart';
import 'package:meru_test/dummy/dummy_transfers.dart';

class MockTransferHistoryDataSource implements TransferHistoryDataSource {
  @override
  List<Transfer> getTransfers() {
    return dummyTransfers;
  }
}
