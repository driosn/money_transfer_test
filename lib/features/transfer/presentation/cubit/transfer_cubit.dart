import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../common/transfer_details.dart';
import '../../domain/repositories/transfer_repository.dart';

part 'transfer_cubit.freezed.dart';

class TransferCubit extends Cubit<TransferState> {
  final TransferRepository _transferRepository;

  TransferCubit({required TransferRepository transferRepository})
    : _transferRepository = transferRepository,
      super(const _Initial());

  Future<void> executeTransfer(TransferDetails transferDetails) async {
    emit(const _Loading());

    final result = await _transferRepository.executeTransfer(transferDetails);

    result.fold(
      (failure) => emit(_Error(failure.message)),
      (_) => emit(const _Success()),
    );
  }
}

@freezed
class TransferState with _$TransferState {
  const factory TransferState.initial() = _Initial;
  const factory TransferState.loading() = _Loading;
  const factory TransferState.success() = _Success;
  const factory TransferState.error(String message) = _Error;
}
