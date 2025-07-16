import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meru_test/core/shared/data/datasources/mock_account_datasource.dart';
import 'package:meru_test/core/shared/data/datasources/mock_transfer_datasource.dart';
import 'package:meru_test/features/transfer/data/repositories/transfer_repository_impl.dart';
import 'package:meru_test/features/transfer/presentation/widgets/recipient_bottom_sheet/cubit/recipient_bottom_sheet_cubit.dart';

import '../../../../../../core/shared/data/models/account_model.dart';

class RecipientBottomSheet extends StatefulWidget {
  const RecipientBottomSheet({super.key, required this.origin});

  final AccountModel origin;

  @override
  State<RecipientBottomSheet> createState() => _RecipientBottomSheetState();
}

class _RecipientBottomSheetState extends State<RecipientBottomSheet> {
  late final RecipientBottomSheetCubit _recipientBottomSheetCubit;

  @override
  void initState() {
    _recipientBottomSheetCubit = RecipientBottomSheetCubit(
      transferRepository: TransferRepositoryImpl(
        accountDataSource: MockAccountDataSource(),
        transferDataSource: MockTransferDataSource(),
      ),
    )..getRecipients(widget.origin);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: BlocBuilder<RecipientBottomSheetCubit, RecipientBottomSheetState>(
        bloc: _recipientBottomSheetCubit,
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (message) => Center(child: Text(message)),
            loaded:
                (recipients) => _SelectRecipientList(recipients: recipients),
          );
        },
      ),
    );
  }
}

class _SelectRecipientList extends StatelessWidget {
  const _SelectRecipientList({required this.recipients});
  final List<AccountModel> recipients;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 12),
          width: 40,
          height: 4,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Seleccionar destinatario',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: recipients.length,
            itemBuilder: (context, index) {
              final account = recipients[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(account.avatarUrl),
                ),
                title: Text(account.fullName),
                subtitle: Text(
                  '\$${account.balance.toStringAsFixed(2)} disponible',
                ),
                onTap: () {
                  Navigator.pop(context, account);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
