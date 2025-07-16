import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meru_test/core/shared/data/models/account_model.dart';
import 'package:meru_test/features/home/presentation/cubit/home_cubit.dart';
import 'package:meru_test/features/home/presentation/screens/home_screen.dart';
import 'package:meru_test/features/transfer/common/transfer_details.dart';
import 'package:meru_test/features/transfer/presentation/cubit/transfer_cubit.dart';

import '../cubit/transfer_form_cubit.dart';
import '../widgets/transfer_form.dart';

class TransferScreen extends StatefulWidget {
  static const String routeName = 'transfer';
  static const String routePath = '/transfer';

  final AccountModel account;

  const TransferScreen({super.key, required this.account});

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  void _onTransferConfirmed(TransferDetails transferDetails) {
    context.read<TransferCubit>().executeTransfer(transferDetails);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransferFormCubit(originAccount: widget.account),
      child: BlocConsumer<TransferCubit, TransferState>(
        listener: (context, state) {
          state.whenOrNull(
            success: () async {
              await showDialog(
                context: context,
                barrierDismissible: false,
                builder:
                    (context) => AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      title: const Row(
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 32,
                          ),
                          SizedBox(width: 8),
                          Expanded(child: Text('¡Transferencia realizada!')),
                        ],
                      ),
                      content: const Text(
                        'La transferencia se realizó exitosamente.',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            context.go(HomeScreen.routePath);
                            context.read<HomeCubit>().getAccounts();
                          },
                          child: const Text('Aceptar'),
                        ),
                      ],
                    ),
              );
            },
            error: (message) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(message)));
            },
          );
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.grey[50],
            body: Stack(
              children: [
                Column(
                  children: [
                    _TransferHeader(),
                    Expanded(
                      child: TransferForm(
                        originAccount: widget.account,
                        onTransferConfirmed: _onTransferConfirmed,
                      ),
                    ),
                  ],
                ),

                state.whenOrNull(
                      loading:
                          () => IgnorePointer(
                            ignoring: true,
                            child: Container(
                              color: Colors.black.withValues(alpha: 0.5),
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          ),
                    ) ??
                    const Offstage(),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _TransferHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 56, left: 16, right: 16, bottom: 16),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF7B5CFA), Color(0xFF5B8DF6)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: context.pop,
            icon: const Icon(Icons.arrow_back, color: Colors.white, size: 24),
          ),
          const Expanded(
            child: Text(
              'Nueva Transferencia',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert, color: Colors.white, size: 24),
          ),
        ],
      ),
    );
  }
}
