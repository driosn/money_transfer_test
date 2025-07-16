import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/shared/data/models/account_model.dart';
import '../../../../domain/repositories/transfer_repository.dart';

part 'recipient_bottom_sheet_cubit.freezed.dart';

class RecipientBottomSheetCubit extends Cubit<RecipientBottomSheetState> {
  final TransferRepository transferRepository;

  RecipientBottomSheetCubit({required this.transferRepository})
    : super(const _Initial());

  Future<void> getRecipients(AccountModel origin) async {
    emit(const _Loading());
    final result = await transferRepository.getRecipients(origin);

    result.fold(
      (failure) => emit(_Error(failure.message)),
      (recipients) => emit(_Loaded(recipients)),
    );
  }
}

@freezed
class RecipientBottomSheetState with _$RecipientBottomSheetState {
  const factory RecipientBottomSheetState.initial() = _Initial;
  const factory RecipientBottomSheetState.loading() = _Loading;
  const factory RecipientBottomSheetState.loaded(
    List<AccountModel> recipients,
  ) = _Loaded;
  const factory RecipientBottomSheetState.error(String message) = _Error;
}
