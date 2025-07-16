import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meru_test/core/shared/common/transfer.dart';
import 'package:meru_test/features/transfer_history/domain/repositories/transfer_history_repository.dart';

part 'transfer_history_cubit.freezed.dart';

class TransferHistoryCubit extends Cubit<TransferHistoryState> {
  final TransferHistoryRepository repository;

  TransferHistoryCubit(this.repository) : super(const TransferHistoryInitial());

  Future<void> fetchTransferHistory() async {
    emit(const TransferHistoryLoading());
    try {
      final history = await repository.getTransferHistory();
      emit(TransferHistoryLoaded(history));
    } catch (e) {
      emit(TransferHistoryError(e.toString()));
    }
  }
}

@freezed
class TransferHistoryState with _$TransferHistoryState {
  const factory TransferHistoryState.initial() = TransferHistoryInitial;
  const factory TransferHistoryState.loading() = TransferHistoryLoading;
  const factory TransferHistoryState.loaded(List<Transfer> history) =
      TransferHistoryLoaded;
  const factory TransferHistoryState.error(String message) =
      TransferHistoryError;
}
