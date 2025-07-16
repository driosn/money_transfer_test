import 'package:dartz/dartz.dart';
import 'package:meru_test/core/shared/data/datasources/account_datasources.dart';
import 'package:meru_test/core/shared/data/datasources/transfer_datasources.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/shared/data/models/account_model.dart';
import '../../common/transfer_details.dart';
import '../../domain/repositories/transfer_repository.dart';

class TransferRepositoryImpl implements TransferRepository {
  final AccountDataSource _accountDataSource;
  final TransferDataSource _transferDataSource;

  TransferRepositoryImpl({
    required AccountDataSource accountDataSource,
    required TransferDataSource transferDataSource,
  }) : _accountDataSource = accountDataSource,
       _transferDataSource = transferDataSource;

  @override
  Future<Either<Failure, void>> executeTransfer(
    TransferDetails transferDetails,
  ) async {
    try {
      if (transferDetails.amount <= 0) {
        return left(Failure('El monto debe ser mayor a cero.'));
      }
      if (transferDetails.originBalance < transferDetails.amount) {
        return left(Failure('Saldo insuficiente.'));
      }
      await _transferDataSource.executeTransfer(transferDetails);
      return right(null);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<AccountModel>>> getRecipients(
    AccountModel origin,
  ) async {
    try {
      final accounts = await _accountDataSource.getAccounts();
      accounts.removeWhere((account) => account.id == origin.id);

      return right(accounts);
    } catch (e) {
      return left(Failure('Error al obtener destinatarios.'));
    }
  }
}
