import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meru_test/core/shared/data/models/account_model.dart';
import 'package:meru_test/features/transfer/common/transfer_details.dart';
import 'package:meru_test/features/transfer/presentation/widgets/recipient_bottom_sheet/recipient_bottom_sheet.dart';

import '../cubit/transfer_form_cubit.dart';

class TransferForm extends StatefulWidget {
  final AccountModel originAccount;
  final Function(TransferDetails) onTransferConfirmed;

  const TransferForm({
    super.key,
    required this.originAccount,
    required this.onTransferConfirmed,
  });

  @override
  State<TransferForm> createState() => _TransferFormState();
}

class _TransferFormState extends State<TransferForm> {
  final _amountController = TextEditingController();

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  void _selectRecipient(BuildContext context) async {
    final recipient = await showModalBottomSheet<AccountModel?>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => RecipientBottomSheet(origin: widget.originAccount),
    );

    if (context.mounted) {
      context.read<TransferFormCubit>().setRecipient(recipient);
    }
  }

  void _onAmountChanged(BuildContext context, String value) {
    final amount = double.tryParse(value);
    context.read<TransferFormCubit>().setAmount(amount);
  }

  void _confirmTransfer(BuildContext context) async {
    final confirmation = await showDialog<bool?>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Confirmar transferencia'),
            content: const Text(
              '¿Estás seguro de querer realizar esta transferencia?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancelar'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Confirmar'),
              ),
            ],
          ),
    );

    if (confirmation == null) {
      return;
    }

    if (context.mounted) {
      final transferDetails = context.read<TransferFormCubit>().transferDetails;

      widget.onTransferConfirmed(transferDetails);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransferFormCubit, TransferFormState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Detalles de la transferencia',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(height: 24),

              _SenderInfo(),

              const SizedBox(height: 24),

              const Text(
                'Elegir un destinatario',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 12),
              _RecipientField(
                recipient: state.recipient,
                error: state.recipientError,
                onTap: () => _selectRecipient(context),
              ),
              const SizedBox(height: 24),

              const Text(
                'Ingresar el monto a transferir',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 12),
              _AmountField(
                controller: _amountController,
                error: state.amountError,
                onChanged: (value) => _onAmountChanged(context, value),
              ),
              const SizedBox(height: 16),
              // Información de saldo
              _BalanceInfo(),
              const Spacer(),

              _ContinueButton(onPressed: () => _confirmTransfer(context)),
            ],
          ),
        );
      },
    );
  }
}

class _RecipientField extends StatelessWidget {
  final AccountModel? recipient;
  final String? error;
  final VoidCallback onTap;

  const _RecipientField({this.recipient, this.error, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
              border: error != null ? Border.all(color: Colors.red) : null,
            ),
            child: Row(
              children: [
                recipient != null
                    ? CircleAvatar(
                      radius: 12,
                      backgroundImage: NetworkImage(recipient!.avatarUrl),
                    )
                    : const Icon(
                      Icons.person_add,
                      color: Color(0xFF7B5CFA),
                      size: 24,
                    ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    recipient?.fullName ?? 'Seleccionar destinatario',
                    style: TextStyle(
                      color: recipient != null ? Colors.black : Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                  size: 16,
                ),
              ],
            ),
          ),
        ),
        if (error != null)
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 16),
            child: Text(
              error!,
              style: const TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
      ],
    );
  }
}

class _AmountField extends StatelessWidget {
  final TextEditingController controller;
  final String? error;
  final ValueChanged<String> onChanged;

  const _AmountField({
    required this.controller,
    this.error,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
            border: error != null ? Border.all(color: Colors.red) : null,
          ),
          child: Row(
            children: [
              const Text(
                '\$',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: controller,
                  keyboardType: TextInputType.number,
                  onChanged: onChanged,
                  decoration: const InputDecoration(
                    hintText: '0.00',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (error != null)
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 16),
            child: Text(
              error!,
              style: const TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
      ],
    );
  }
}

class _BalanceInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<TransferFormCubit>().state;
    return Row(
      children: [
        const Icon(Icons.account_balance_wallet, color: Colors.grey, size: 20),
        const SizedBox(width: 8),
        Text(
          'Saldo disponible: \$${state.originAccount.balance.toStringAsFixed(2)}',
          style: TextStyle(color: Colors.grey[600], fontSize: 14),
        ),
      ],
    );
  }
}

class _ContinueButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _ContinueButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransferFormCubit, TransferFormState>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          height: 56,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF7B5CFA), Color(0xFF5B8DF6)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          child: ElevatedButton(
            onPressed:
                state.recipient != null && state.amount != null
                    ? onPressed
                    : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              disabledBackgroundColor: Colors.grey[350],
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Continuar',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(width: 8),
                Icon(Icons.arrow_forward, color: Colors.white, size: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _SenderInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<TransferFormCubit>().state;
    final account = state.originAccount;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(account.avatarUrl),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  account.fullName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Saldo disponible: \$${account.balance.toStringAsFixed(2)}',
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
