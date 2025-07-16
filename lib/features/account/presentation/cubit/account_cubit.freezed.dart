// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AccountState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AccountModel account, List<Transfer> transactions)
    loaded,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AccountModel account, List<Transfer> transactions)?
    loaded,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AccountModel account, List<Transfer> transactions)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountInitial value) initial,
    required TResult Function(AccountLoading value) loading,
    required TResult Function(AccountLoaded value) loaded,
    required TResult Function(AccountError value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountInitial value)? initial,
    TResult? Function(AccountLoading value)? loading,
    TResult? Function(AccountLoaded value)? loaded,
    TResult? Function(AccountError value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountInitial value)? initial,
    TResult Function(AccountLoading value)? loading,
    TResult Function(AccountLoaded value)? loaded,
    TResult Function(AccountError value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountStateCopyWith<$Res> {
  factory $AccountStateCopyWith(
    AccountState value,
    $Res Function(AccountState) then,
  ) = _$AccountStateCopyWithImpl<$Res, AccountState>;
}

/// @nodoc
class _$AccountStateCopyWithImpl<$Res, $Val extends AccountState>
    implements $AccountStateCopyWith<$Res> {
  _$AccountStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AccountInitialImplCopyWith<$Res> {
  factory _$$AccountInitialImplCopyWith(
    _$AccountInitialImpl value,
    $Res Function(_$AccountInitialImpl) then,
  ) = __$$AccountInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AccountInitialImplCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res, _$AccountInitialImpl>
    implements _$$AccountInitialImplCopyWith<$Res> {
  __$$AccountInitialImplCopyWithImpl(
    _$AccountInitialImpl _value,
    $Res Function(_$AccountInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AccountState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AccountInitialImpl implements AccountInitial {
  const _$AccountInitialImpl();

  @override
  String toString() {
    return 'AccountState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AccountInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AccountModel account, List<Transfer> transactions)
    loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AccountModel account, List<Transfer> transactions)?
    loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AccountModel account, List<Transfer> transactions)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountInitial value) initial,
    required TResult Function(AccountLoading value) loading,
    required TResult Function(AccountLoaded value) loaded,
    required TResult Function(AccountError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountInitial value)? initial,
    TResult? Function(AccountLoading value)? loading,
    TResult? Function(AccountLoaded value)? loaded,
    TResult? Function(AccountError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountInitial value)? initial,
    TResult Function(AccountLoading value)? loading,
    TResult Function(AccountLoaded value)? loaded,
    TResult Function(AccountError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class AccountInitial implements AccountState {
  const factory AccountInitial() = _$AccountInitialImpl;
}

/// @nodoc
abstract class _$$AccountLoadingImplCopyWith<$Res> {
  factory _$$AccountLoadingImplCopyWith(
    _$AccountLoadingImpl value,
    $Res Function(_$AccountLoadingImpl) then,
  ) = __$$AccountLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AccountLoadingImplCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res, _$AccountLoadingImpl>
    implements _$$AccountLoadingImplCopyWith<$Res> {
  __$$AccountLoadingImplCopyWithImpl(
    _$AccountLoadingImpl _value,
    $Res Function(_$AccountLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AccountState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AccountLoadingImpl implements AccountLoading {
  const _$AccountLoadingImpl();

  @override
  String toString() {
    return 'AccountState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AccountLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AccountModel account, List<Transfer> transactions)
    loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AccountModel account, List<Transfer> transactions)?
    loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AccountModel account, List<Transfer> transactions)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountInitial value) initial,
    required TResult Function(AccountLoading value) loading,
    required TResult Function(AccountLoaded value) loaded,
    required TResult Function(AccountError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountInitial value)? initial,
    TResult? Function(AccountLoading value)? loading,
    TResult? Function(AccountLoaded value)? loaded,
    TResult? Function(AccountError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountInitial value)? initial,
    TResult Function(AccountLoading value)? loading,
    TResult Function(AccountLoaded value)? loaded,
    TResult Function(AccountError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AccountLoading implements AccountState {
  const factory AccountLoading() = _$AccountLoadingImpl;
}

/// @nodoc
abstract class _$$AccountLoadedImplCopyWith<$Res> {
  factory _$$AccountLoadedImplCopyWith(
    _$AccountLoadedImpl value,
    $Res Function(_$AccountLoadedImpl) then,
  ) = __$$AccountLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AccountModel account, List<Transfer> transactions});

  $AccountModelCopyWith<$Res> get account;
}

/// @nodoc
class __$$AccountLoadedImplCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res, _$AccountLoadedImpl>
    implements _$$AccountLoadedImplCopyWith<$Res> {
  __$$AccountLoadedImplCopyWithImpl(
    _$AccountLoadedImpl _value,
    $Res Function(_$AccountLoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AccountState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? account = null, Object? transactions = null}) {
    return _then(
      _$AccountLoadedImpl(
        null == account
            ? _value.account
            : account // ignore: cast_nullable_to_non_nullable
                as AccountModel,
        null == transactions
            ? _value._transactions
            : transactions // ignore: cast_nullable_to_non_nullable
                as List<Transfer>,
      ),
    );
  }

  /// Create a copy of AccountState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AccountModelCopyWith<$Res> get account {
    return $AccountModelCopyWith<$Res>(_value.account, (value) {
      return _then(_value.copyWith(account: value));
    });
  }
}

/// @nodoc

class _$AccountLoadedImpl implements AccountLoaded {
  const _$AccountLoadedImpl(this.account, final List<Transfer> transactions)
    : _transactions = transactions;

  @override
  final AccountModel account;
  final List<Transfer> _transactions;
  @override
  List<Transfer> get transactions {
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  String toString() {
    return 'AccountState.loaded(account: $account, transactions: $transactions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountLoadedImpl &&
            (identical(other.account, account) || other.account == account) &&
            const DeepCollectionEquality().equals(
              other._transactions,
              _transactions,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    account,
    const DeepCollectionEquality().hash(_transactions),
  );

  /// Create a copy of AccountState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountLoadedImplCopyWith<_$AccountLoadedImpl> get copyWith =>
      __$$AccountLoadedImplCopyWithImpl<_$AccountLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AccountModel account, List<Transfer> transactions)
    loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(account, transactions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AccountModel account, List<Transfer> transactions)?
    loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(account, transactions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AccountModel account, List<Transfer> transactions)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(account, transactions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountInitial value) initial,
    required TResult Function(AccountLoading value) loading,
    required TResult Function(AccountLoaded value) loaded,
    required TResult Function(AccountError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountInitial value)? initial,
    TResult? Function(AccountLoading value)? loading,
    TResult? Function(AccountLoaded value)? loaded,
    TResult? Function(AccountError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountInitial value)? initial,
    TResult Function(AccountLoading value)? loading,
    TResult Function(AccountLoaded value)? loaded,
    TResult Function(AccountError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class AccountLoaded implements AccountState {
  const factory AccountLoaded(
    final AccountModel account,
    final List<Transfer> transactions,
  ) = _$AccountLoadedImpl;

  AccountModel get account;
  List<Transfer> get transactions;

  /// Create a copy of AccountState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountLoadedImplCopyWith<_$AccountLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AccountErrorImplCopyWith<$Res> {
  factory _$$AccountErrorImplCopyWith(
    _$AccountErrorImpl value,
    $Res Function(_$AccountErrorImpl) then,
  ) = __$$AccountErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$AccountErrorImplCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res, _$AccountErrorImpl>
    implements _$$AccountErrorImplCopyWith<$Res> {
  __$$AccountErrorImplCopyWithImpl(
    _$AccountErrorImpl _value,
    $Res Function(_$AccountErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AccountState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$AccountErrorImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$AccountErrorImpl implements AccountError {
  const _$AccountErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AccountState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AccountState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountErrorImplCopyWith<_$AccountErrorImpl> get copyWith =>
      __$$AccountErrorImplCopyWithImpl<_$AccountErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AccountModel account, List<Transfer> transactions)
    loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AccountModel account, List<Transfer> transactions)?
    loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AccountModel account, List<Transfer> transactions)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountInitial value) initial,
    required TResult Function(AccountLoading value) loading,
    required TResult Function(AccountLoaded value) loaded,
    required TResult Function(AccountError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountInitial value)? initial,
    TResult? Function(AccountLoading value)? loading,
    TResult? Function(AccountLoaded value)? loaded,
    TResult? Function(AccountError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountInitial value)? initial,
    TResult Function(AccountLoading value)? loading,
    TResult Function(AccountLoaded value)? loaded,
    TResult Function(AccountError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AccountError implements AccountState {
  const factory AccountError(final String message) = _$AccountErrorImpl;

  String get message;

  /// Create a copy of AccountState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountErrorImplCopyWith<_$AccountErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
