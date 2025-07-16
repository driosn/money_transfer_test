import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meru_test/core/shared/data/models/account_model.dart';
import 'package:meru_test/features/home/domain/repositories/home_repository.dart';

part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository repository;

  HomeCubit(this.repository) : super(const HomeState.initial());

  Future<void> getAccounts() async {
    emit(const HomeState.loading());
    await Future.delayed(const Duration(seconds: 2));
    final result = await repository.getAccounts();
    result.fold(
      (failure) => emit(HomeState.error(failure.message)),
      (accounts) => emit(HomeState.loaded(accounts)),
    );
  }
}

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = _Loading;
  const factory HomeState.loaded(List<AccountModel> accounts) = _Loaded;
  const factory HomeState.error(String message) = _Error;
}
