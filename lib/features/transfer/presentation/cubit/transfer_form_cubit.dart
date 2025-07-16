import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meru_test/features/transfer/common/transfer_details.dart';

import '../../../../core/shared/data/models/account_model.dart';

part 'transfer_form_cubit.freezed.dart';

class TransferFormCubit extends Cubit<TransferFormState> {
  final AccountModel originAccount;

  TransferFormCubit({required this.originAccount})
    : super(TransferFormState.initial(originAccount: originAccount));

  void setRecipient(AccountModel? recipient) {
    if (state.recipient != null && recipient == null) {
      return;
    }

    if (recipient == null) {
      emit(state.copyWith(recipientError: 'Debe seleccionar un destinatario'));
      return;
    }

    emit(state.copyWith(recipient: recipient, recipientError: null));
  }

  void setAmount(double? amount) {
    if (amount == null) {
      emit(state.copyWith(amount: null));
      return;
    }

    if (amount <= 0) {
      emit(
        state.copyWith(
          amountError: 'Debe ingresar un monto válido mayor a 0',
          amount: null,
        ),
      );
      return;
    }

    if (amount > state.originAccount.balance) {
      emit(state.copyWith(amountError: 'Saldo insuficiente', amount: null));
      return;
    }

    emit(state.copyWith(amount: amount, amountError: null));
  }

  bool validate() {
    setRecipient(state.recipient);
    setAmount(state.amount!);

    return state.recipientError == null && state.amountError == null;
  }

  TransferDetails get transferDetails {
    if (state.recipient == null || state.amount == null) {
      throw Exception('Transfer details are not valid');
    }

    return TransferDetails(
      originBalance: state.originAccount.balance,
      originAccountId: state.originAccount.id,
      recipientId: state.recipient!.id,
      amount: state.amount!,
    );
  }

  void clearError() {
    emit(state.copyWith(recipientError: null, amountError: null));
  }
}

@freezed
class TransferFormState with _$TransferFormState {
  const factory TransferFormState({
    required AccountModel originAccount,
    AccountModel? recipient,
    double? amount,
    String? recipientError,
    String? amountError,
  }) = _TransferFormState;

  factory TransferFormState.initial({required AccountModel originAccount}) =>
      TransferFormState(originAccount: originAccount);
}
