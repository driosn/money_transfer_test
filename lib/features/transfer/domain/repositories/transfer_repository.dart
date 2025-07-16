import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/shared/data/models/account_model.dart';
import '../../common/transfer_details.dart';

abstract class TransferRepository {
  Future<Either<Failure, void>> executeTransfer(
    TransferDetails transferDetails,
  );

  Future<Either<Failure, List<AccountModel>>> getRecipients(
    AccountModel origin,
  );

  Future<Either<Failure, void>> saveTransferToHistory(
    TransferDetails transferDetails,
  );
}
