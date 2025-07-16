// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfer_form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TransferFormState {
  AccountModel get originAccount => throw _privateConstructorUsedError;
  AccountModel? get recipient => throw _privateConstructorUsedError;
  double? get amount => throw _privateConstructorUsedError;
  String? get recipientError => throw _privateConstructorUsedError;
  String? get amountError => throw _privateConstructorUsedError;

  /// Create a copy of TransferFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransferFormStateCopyWith<TransferFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferFormStateCopyWith<$Res> {
  factory $TransferFormStateCopyWith(
    TransferFormState value,
    $Res Function(TransferFormState) then,
  ) = _$TransferFormStateCopyWithImpl<$Res, TransferFormState>;
  @useResult
  $Res call({
    AccountModel originAccount,
    AccountModel? recipient,
    double? amount,
    String? recipientError,
    String? amountError,
  });

  $AccountModelCopyWith<$Res> get originAccount;
  $AccountModelCopyWith<$Res>? get recipient;
}

/// @nodoc
class _$TransferFormStateCopyWithImpl<$Res, $Val extends TransferFormState>
    implements $TransferFormStateCopyWith<$Res> {
  _$TransferFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransferFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? originAccount = null,
    Object? recipient = freezed,
    Object? amount = freezed,
    Object? recipientError = freezed,
    Object? amountError = freezed,
  }) {
    return _then(
      _value.copyWith(
            originAccount:
                null == originAccount
                    ? _value.originAccount
                    : originAccount // ignore: cast_nullable_to_non_nullable
                        as AccountModel,
            recipient:
                freezed == recipient
                    ? _value.recipient
                    : recipient // ignore: cast_nullable_to_non_nullable
                        as AccountModel?,
            amount:
                freezed == amount
                    ? _value.amount
                    : amount // ignore: cast_nullable_to_non_nullable
                        as double?,
            recipientError:
                freezed == recipientError
                    ? _value.recipientError
                    : recipientError // ignore: cast_nullable_to_non_nullable
                        as String?,
            amountError:
                freezed == amountError
                    ? _value.amountError
                    : amountError // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of TransferFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AccountModelCopyWith<$Res> get originAccount {
    return $AccountModelCopyWith<$Res>(_value.originAccount, (value) {
      return _then(_value.copyWith(originAccount: value) as $Val);
    });
  }

  /// Create a copy of TransferFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AccountModelCopyWith<$Res>? get recipient {
    if (_value.recipient == null) {
      return null;
    }

    return $AccountModelCopyWith<$Res>(_value.recipient!, (value) {
      return _then(_value.copyWith(recipient: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TransferFormStateImplCopyWith<$Res>
    implements $TransferFormStateCopyWith<$Res> {
  factory _$$TransferFormStateImplCopyWith(
    _$TransferFormStateImpl value,
    $Res Function(_$TransferFormStateImpl) then,
  ) = __$$TransferFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    AccountModel originAccount,
    AccountModel? recipient,
    double? amount,
    String? recipientError,
    String? amountError,
  });

  @override
  $AccountModelCopyWith<$Res> get originAccount;
  @override
  $AccountModelCopyWith<$Res>? get recipient;
}

/// @nodoc
class __$$TransferFormStateImplCopyWithImpl<$Res>
    extends _$TransferFormStateCopyWithImpl<$Res, _$TransferFormStateImpl>
    implements _$$TransferFormStateImplCopyWith<$Res> {
  __$$TransferFormStateImplCopyWithImpl(
    _$TransferFormStateImpl _value,
    $Res Function(_$TransferFormStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TransferFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? originAccount = null,
    Object? recipient = freezed,
    Object? amount = freezed,
    Object? recipientError = freezed,
    Object? amountError = freezed,
  }) {
    return _then(
      _$TransferFormStateImpl(
        originAccount:
            null == originAccount
                ? _value.originAccount
                : originAccount // ignore: cast_nullable_to_non_nullable
                    as AccountModel,
        recipient:
            freezed == recipient
                ? _value.recipient
                : recipient // ignore: cast_nullable_to_non_nullable
                    as AccountModel?,
        amount:
            freezed == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                    as double?,
        recipientError:
            freezed == recipientError
                ? _value.recipientError
                : recipientError // ignore: cast_nullable_to_non_nullable
                    as String?,
        amountError:
            freezed == amountError
                ? _value.amountError
                : amountError // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

class _$TransferFormStateImpl implements _TransferFormState {
  const _$TransferFormStateImpl({
    required this.originAccount,
    this.recipient,
    this.amount,
    this.recipientError,
    this.amountError,
  });

  @override
  final AccountModel originAccount;
  @override
  final AccountModel? recipient;
  @override
  final double? amount;
  @override
  final String? recipientError;
  @override
  final String? amountError;

  @override
  String toString() {
    return 'TransferFormState(originAccount: $originAccount, recipient: $recipient, amount: $amount, recipientError: $recipientError, amountError: $amountError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferFormStateImpl &&
            (identical(other.originAccount, originAccount) ||
                other.originAccount == originAccount) &&
            (identical(other.recipient, recipient) ||
                other.recipient == recipient) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.recipientError, recipientError) ||
                other.recipientError == recipientError) &&
            (identical(other.amountError, amountError) ||
                other.amountError == amountError));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    originAccount,
    recipient,
    amount,
    recipientError,
    amountError,
  );

  /// Create a copy of TransferFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransferFormStateImplCopyWith<_$TransferFormStateImpl> get copyWith =>
      __$$TransferFormStateImplCopyWithImpl<_$TransferFormStateImpl>(
        this,
        _$identity,
      );
}

abstract class _TransferFormState implements TransferFormState {
  const factory _TransferFormState({
    required final AccountModel originAccount,
    final AccountModel? recipient,
    final double? amount,
    final String? recipientError,
    final String? amountError,
  }) = _$TransferFormStateImpl;

  @override
  AccountModel get originAccount;
  @override
  AccountModel? get recipient;
  @override
  double? get amount;
  @override
  String? get recipientError;
  @override
  String? get amountError;

  /// Create a copy of TransferFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransferFormStateImplCopyWith<_$TransferFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
