import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/shared/data/datasources/mock_account_datasource.dart';
import '../../../../core/shared/data/models/account_model.dart';
import '../../domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final MockAccountDataSource dataSource;

  HomeRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<AccountModel>>> getAccounts() async {
    try {
      final accounts = await dataSource.getAccounts();
      return Right(accounts);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
