import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/shared/data/models/account_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<AccountModel>>> getAccounts();
}
