import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meru_test/core/shared/data/models/account_model.dart';
import 'package:meru_test/features/transfer/presentation/cubit/transfer_form_cubit.dart';

void main() {
  group('TransferFormCubit', () {
    late AccountModel originAccount;
    late AccountModel recipientAccount;

    setUp(() {
      originAccount = AccountModel(
        id: '1',
        fullName: 'John Doe',
        avatarUrl: 'https://example.com/avatar.jpg',
        balance: 100.0,
      );

      recipientAccount = AccountModel(
        id: '2',
        fullName: 'Jane Smith',
        avatarUrl: 'https://example.com/avatar2.jpg',
        balance: 50.0,
      );
    });

    test('initial state should have origin account', () {
      // Act
      final cubit = TransferFormCubit(originAccount: originAccount);

      // Assert
      expect(cubit.state.originAccount, originAccount);
      expect(cubit.state.recipient, null);
      expect(cubit.state.amount, null);
      expect(cubit.state.recipientError, null);
      expect(cubit.state.amountError, null);
    });

    group('setRecipient', () {
      blocTest<TransferFormCubit, TransferFormState>(
        'should set recipient when valid recipient is provided',
        build: () => TransferFormCubit(originAccount: originAccount),
        act: (cubit) => cubit.setRecipient(recipientAccount),
        expect:
            () => [
              TransferFormState(
                originAccount: originAccount,
                recipient: recipientAccount,
                recipientError: null,
              ),
            ],
      );

      blocTest<TransferFormCubit, TransferFormState>(
        'should set error when null recipient is provided',
        build: () => TransferFormCubit(originAccount: originAccount),
        act: (cubit) => cubit.setRecipient(null),
        expect:
            () => [
              TransferFormState(
                originAccount: originAccount,
                recipientError: 'Debe seleccionar un destinatario',
              ),
            ],
      );

      blocTest<TransferFormCubit, TransferFormState>(
        'should not change state when recipient is already set and null is provided',
        build: () => TransferFormCubit(originAccount: originAccount),
        seed:
            () => TransferFormState(
              originAccount: originAccount,
              recipient: recipientAccount,
            ),
        act: (cubit) => cubit.setRecipient(null),
        expect: () => [],
      );
    });

    group('setAmount', () {
      blocTest<TransferFormCubit, TransferFormState>(
        'should set amount when valid amount is provided',
        build: () => TransferFormCubit(originAccount: originAccount),
        act: (cubit) => cubit.setAmount(50.0),
        expect:
            () => [
              TransferFormState(
                originAccount: originAccount,
                amount: 50.0,
                amountError: null,
              ),
            ],
      );

      blocTest<TransferFormCubit, TransferFormState>(
        'should set amount to null when null is provided',
        build: () => TransferFormCubit(originAccount: originAccount),
        act: (cubit) => cubit.setAmount(null),
        expect:
            () => [
              TransferFormState(originAccount: originAccount, amount: null),
            ],
      );

      blocTest<TransferFormCubit, TransferFormState>(
        'should set error when amount is zero',
        build: () => TransferFormCubit(originAccount: originAccount),
        act: (cubit) => cubit.setAmount(0.0),
        expect:
            () => [
              TransferFormState(
                originAccount: originAccount,
                amountError: 'Debe ingresar un monto válido mayor a 0',
                amount: null,
              ),
            ],
      );

      blocTest<TransferFormCubit, TransferFormState>(
        'should set error when amount is negative',
        build: () => TransferFormCubit(originAccount: originAccount),
        act: (cubit) => cubit.setAmount(-10.0),
        expect:
            () => [
              TransferFormState(
                originAccount: originAccount,
                amountError: 'Debe ingresar un monto válido mayor a 0',
                amount: null,
              ),
            ],
      );

      blocTest<TransferFormCubit, TransferFormState>(
        'should set error when amount exceeds balance',
        build: () => TransferFormCubit(originAccount: originAccount),
        act: (cubit) => cubit.setAmount(150.0),
        expect:
            () => [
              TransferFormState(
                originAccount: originAccount,
                amountError: 'Saldo insuficiente',
                amount: null,
              ),
            ],
      );
    });

    group('validate', () {
      test('should return true when form is valid', () {
        // Arrange
        final cubit = TransferFormCubit(originAccount: originAccount);
        cubit.setRecipient(recipientAccount);
        cubit.setAmount(50.0);

        // Act
        final isValid = cubit.validate();

        // Assert
        expect(isValid, true);
      });

      test('should return false when recipient is missing', () {
        // Arrange
        final cubit = TransferFormCubit(originAccount: originAccount);
        cubit.setAmount(50.0);

        // Act
        final isValid = cubit.validate();

        // Assert
        expect(isValid, false);
      });

      test('should return false when amount is missing', () {
        // Arrange
        final cubit = TransferFormCubit(originAccount: originAccount);
        cubit.setRecipient(recipientAccount);
        // Don't set amount, keep it null

        // Act & Assert
        expect(() => cubit.validate(), throwsA(isA<TypeError>()));
      });

      test('should return false when amount is invalid', () {
        // Arrange
        final cubit = TransferFormCubit(originAccount: originAccount);
        cubit.setRecipient(recipientAccount);
        cubit.setAmount(150.0); // Exceeds balance

        // Act & Assert
        expect(() => cubit.validate(), throwsA(isA<TypeError>()));
      });
    });

    group('transferDetails', () {
      test('should return TransferDetails when form is valid', () {
        // Arrange
        final cubit = TransferFormCubit(originAccount: originAccount);
        cubit.setRecipient(recipientAccount);
        cubit.setAmount(50.0);

        // Act
        final transferDetails = cubit.transferDetails;

        // Assert
        expect(transferDetails.originAccountId, originAccount.id);
        expect(transferDetails.recipientId, recipientAccount.id);
        expect(transferDetails.amount, 50.0);
      });

      test('should throw exception when form is invalid', () {
        // Arrange
        final cubit = TransferFormCubit(originAccount: originAccount);

        // Act & Assert
        expect(() => cubit.transferDetails, throwsException);
      });
    });

    group('clearError', () {
      blocTest<TransferFormCubit, TransferFormState>(
        'should clear all errors',
        build: () => TransferFormCubit(originAccount: originAccount),
        seed:
            () => TransferFormState(
              originAccount: originAccount,
              recipientError: 'Some error',
              amountError: 'Another error',
            ),
        act: (cubit) => cubit.clearError(),
        expect:
            () => [
              TransferFormState(
                originAccount: originAccount,
                recipientError: null,
                amountError: null,
              ),
            ],
      );
    });
  });
}
