import 'package:meru_test/core/shared/common/transfer.dart';
import 'package:meru_test/core/shared/data/datasources/transfer_datasources.dart';
import 'package:meru_test/features/transfer_history/domain/repositories/transfer_history_repository.dart';

class TransferHistoryRepositoryImpl implements TransferHistoryRepository {
  final TransferDataSource dataSource;

  TransferHistoryRepositoryImpl({required this.dataSource});

  @override
  Future<List<Transfer>> getTransferHistory() async {
    return await dataSource.getTransferHistory();
  }
}
