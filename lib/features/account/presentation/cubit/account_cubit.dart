import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meru_test/core/shared/common/transfer.dart';
import 'package:meru_test/core/shared/data/models/account_model.dart';
import 'package:meru_test/features/account/domain/repositories/account_repository.dart';

part 'account_cubit.freezed.dart';

class AccountCubit extends Cubit<AccountState> {
  final AccountRepository repository;

  AccountCubit(this.repository) : super(const AccountInitial());

  Future<void> getAccountData(AccountModel account) async {
    emit(const AccountLoading());
    try {
      final transactions = await repository.getOwnTransactions(account.id);
      emit(AccountLoaded(account, transactions));
    } catch (e) {
      emit(AccountError(e.toString()));
    }
  }
}

@freezed
class AccountState with _$AccountState {
  const factory AccountState.initial() = AccountInitial;
  const factory AccountState.loading() = AccountLoading;
  const factory AccountState.loaded(
    AccountModel account,
    List<Transfer> transactions,
  ) = AccountLoaded;
  const factory AccountState.error(String message) = AccountError;
}
