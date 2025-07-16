import 'package:meru_test/core/shared/common/transfer.dart';

abstract class TransferHistoryDataSource {
  List<Transfer> getTransfers();
}
