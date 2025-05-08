// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'compte_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CompteEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() historiqueTransaction,
    required TResult Function() creditCompte,
    required TResult Function() retraitCompte,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? historiqueTransaction,
    TResult? Function()? creditCompte,
    TResult? Function()? retraitCompte,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? historiqueTransaction,
    TResult Function()? creditCompte,
    TResult Function()? retraitCompte,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(HistoriqueTransaction value)
        historiqueTransaction,
    required TResult Function(CreditCompte value) creditCompte,
    required TResult Function(RetraitCompte value) retraitCompte,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(HistoriqueTransaction value)? historiqueTransaction,
    TResult? Function(CreditCompte value)? creditCompte,
    TResult? Function(RetraitCompte value)? retraitCompte,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(HistoriqueTransaction value)? historiqueTransaction,
    TResult Function(CreditCompte value)? creditCompte,
    TResult Function(RetraitCompte value)? retraitCompte,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompteEventCopyWith<$Res> {
  factory $CompteEventCopyWith(
          CompteEvent value, $Res Function(CompteEvent) then) =
      _$CompteEventCopyWithImpl<$Res, CompteEvent>;
}

/// @nodoc
class _$CompteEventCopyWithImpl<$Res, $Val extends CompteEvent>
    implements $CompteEventCopyWith<$Res> {
  _$CompteEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CompteEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$CompteEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of CompteEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'CompteEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() historiqueTransaction,
    required TResult Function() creditCompte,
    required TResult Function() retraitCompte,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? historiqueTransaction,
    TResult? Function()? creditCompte,
    TResult? Function()? retraitCompte,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? historiqueTransaction,
    TResult Function()? creditCompte,
    TResult Function()? retraitCompte,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(HistoriqueTransaction value)
        historiqueTransaction,
    required TResult Function(CreditCompte value) creditCompte,
    required TResult Function(RetraitCompte value) retraitCompte,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(HistoriqueTransaction value)? historiqueTransaction,
    TResult? Function(CreditCompte value)? creditCompte,
    TResult? Function(RetraitCompte value)? retraitCompte,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(HistoriqueTransaction value)? historiqueTransaction,
    TResult Function(CreditCompte value)? creditCompte,
    TResult Function(RetraitCompte value)? retraitCompte,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements CompteEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$HistoriqueTransactionImplCopyWith<$Res> {
  factory _$$HistoriqueTransactionImplCopyWith(
          _$HistoriqueTransactionImpl value,
          $Res Function(_$HistoriqueTransactionImpl) then) =
      __$$HistoriqueTransactionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HistoriqueTransactionImplCopyWithImpl<$Res>
    extends _$CompteEventCopyWithImpl<$Res, _$HistoriqueTransactionImpl>
    implements _$$HistoriqueTransactionImplCopyWith<$Res> {
  __$$HistoriqueTransactionImplCopyWithImpl(_$HistoriqueTransactionImpl _value,
      $Res Function(_$HistoriqueTransactionImpl) _then)
      : super(_value, _then);

  /// Create a copy of CompteEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$HistoriqueTransactionImpl implements HistoriqueTransaction {
  const _$HistoriqueTransactionImpl();

  @override
  String toString() {
    return 'CompteEvent.historiqueTransaction()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoriqueTransactionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() historiqueTransaction,
    required TResult Function() creditCompte,
    required TResult Function() retraitCompte,
  }) {
    return historiqueTransaction();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? historiqueTransaction,
    TResult? Function()? creditCompte,
    TResult? Function()? retraitCompte,
  }) {
    return historiqueTransaction?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? historiqueTransaction,
    TResult Function()? creditCompte,
    TResult Function()? retraitCompte,
    required TResult orElse(),
  }) {
    if (historiqueTransaction != null) {
      return historiqueTransaction();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(HistoriqueTransaction value)
        historiqueTransaction,
    required TResult Function(CreditCompte value) creditCompte,
    required TResult Function(RetraitCompte value) retraitCompte,
  }) {
    return historiqueTransaction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(HistoriqueTransaction value)? historiqueTransaction,
    TResult? Function(CreditCompte value)? creditCompte,
    TResult? Function(RetraitCompte value)? retraitCompte,
  }) {
    return historiqueTransaction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(HistoriqueTransaction value)? historiqueTransaction,
    TResult Function(CreditCompte value)? creditCompte,
    TResult Function(RetraitCompte value)? retraitCompte,
    required TResult orElse(),
  }) {
    if (historiqueTransaction != null) {
      return historiqueTransaction(this);
    }
    return orElse();
  }
}

abstract class HistoriqueTransaction implements CompteEvent {
  const factory HistoriqueTransaction() = _$HistoriqueTransactionImpl;
}

/// @nodoc
abstract class _$$CreditCompteImplCopyWith<$Res> {
  factory _$$CreditCompteImplCopyWith(
          _$CreditCompteImpl value, $Res Function(_$CreditCompteImpl) then) =
      __$$CreditCompteImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreditCompteImplCopyWithImpl<$Res>
    extends _$CompteEventCopyWithImpl<$Res, _$CreditCompteImpl>
    implements _$$CreditCompteImplCopyWith<$Res> {
  __$$CreditCompteImplCopyWithImpl(
      _$CreditCompteImpl _value, $Res Function(_$CreditCompteImpl) _then)
      : super(_value, _then);

  /// Create a copy of CompteEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CreditCompteImpl implements CreditCompte {
  const _$CreditCompteImpl();

  @override
  String toString() {
    return 'CompteEvent.creditCompte()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CreditCompteImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() historiqueTransaction,
    required TResult Function() creditCompte,
    required TResult Function() retraitCompte,
  }) {
    return creditCompte();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? historiqueTransaction,
    TResult? Function()? creditCompte,
    TResult? Function()? retraitCompte,
  }) {
    return creditCompte?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? historiqueTransaction,
    TResult Function()? creditCompte,
    TResult Function()? retraitCompte,
    required TResult orElse(),
  }) {
    if (creditCompte != null) {
      return creditCompte();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(HistoriqueTransaction value)
        historiqueTransaction,
    required TResult Function(CreditCompte value) creditCompte,
    required TResult Function(RetraitCompte value) retraitCompte,
  }) {
    return creditCompte(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(HistoriqueTransaction value)? historiqueTransaction,
    TResult? Function(CreditCompte value)? creditCompte,
    TResult? Function(RetraitCompte value)? retraitCompte,
  }) {
    return creditCompte?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(HistoriqueTransaction value)? historiqueTransaction,
    TResult Function(CreditCompte value)? creditCompte,
    TResult Function(RetraitCompte value)? retraitCompte,
    required TResult orElse(),
  }) {
    if (creditCompte != null) {
      return creditCompte(this);
    }
    return orElse();
  }
}

abstract class CreditCompte implements CompteEvent {
  const factory CreditCompte() = _$CreditCompteImpl;
}

/// @nodoc
abstract class _$$RetraitCompteImplCopyWith<$Res> {
  factory _$$RetraitCompteImplCopyWith(
          _$RetraitCompteImpl value, $Res Function(_$RetraitCompteImpl) then) =
      __$$RetraitCompteImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RetraitCompteImplCopyWithImpl<$Res>
    extends _$CompteEventCopyWithImpl<$Res, _$RetraitCompteImpl>
    implements _$$RetraitCompteImplCopyWith<$Res> {
  __$$RetraitCompteImplCopyWithImpl(
      _$RetraitCompteImpl _value, $Res Function(_$RetraitCompteImpl) _then)
      : super(_value, _then);

  /// Create a copy of CompteEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RetraitCompteImpl implements RetraitCompte {
  const _$RetraitCompteImpl();

  @override
  String toString() {
    return 'CompteEvent.retraitCompte()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RetraitCompteImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() historiqueTransaction,
    required TResult Function() creditCompte,
    required TResult Function() retraitCompte,
  }) {
    return retraitCompte();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? historiqueTransaction,
    TResult? Function()? creditCompte,
    TResult? Function()? retraitCompte,
  }) {
    return retraitCompte?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? historiqueTransaction,
    TResult Function()? creditCompte,
    TResult Function()? retraitCompte,
    required TResult orElse(),
  }) {
    if (retraitCompte != null) {
      return retraitCompte();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(HistoriqueTransaction value)
        historiqueTransaction,
    required TResult Function(CreditCompte value) creditCompte,
    required TResult Function(RetraitCompte value) retraitCompte,
  }) {
    return retraitCompte(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(HistoriqueTransaction value)? historiqueTransaction,
    TResult? Function(CreditCompte value)? creditCompte,
    TResult? Function(RetraitCompte value)? retraitCompte,
  }) {
    return retraitCompte?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(HistoriqueTransaction value)? historiqueTransaction,
    TResult Function(CreditCompte value)? creditCompte,
    TResult Function(RetraitCompte value)? retraitCompte,
    required TResult orElse(),
  }) {
    if (retraitCompte != null) {
      return retraitCompte(this);
    }
    return orElse();
  }
}

abstract class RetraitCompte implements CompteEvent {
  const factory RetraitCompte() = _$RetraitCompteImpl;
}

/// @nodoc
mixin _$CompteState {
  int? get isLoadingDepot => throw _privateConstructorUsedError;
  int? get isLoadingRetrait => throw _privateConstructorUsedError;
  int? get isLoadTrans => throw _privateConstructorUsedError;
  TextEditingController get montantTransaction =>
      throw _privateConstructorUsedError;
  TextEditingController get phone => throw _privateConstructorUsedError;
  TextEditingController get password => throw _privateConstructorUsedError;
  List<TransactionModel>? get transactionList =>
      throw _privateConstructorUsedError; // TextEditingController? contactEmetteur,
  String? get paiement_url => throw _privateConstructorUsedError;

  /// Create a copy of CompteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CompteStateCopyWith<CompteState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompteStateCopyWith<$Res> {
  factory $CompteStateCopyWith(
          CompteState value, $Res Function(CompteState) then) =
      _$CompteStateCopyWithImpl<$Res, CompteState>;
  @useResult
  $Res call(
      {int? isLoadingDepot,
      int? isLoadingRetrait,
      int? isLoadTrans,
      TextEditingController montantTransaction,
      TextEditingController phone,
      TextEditingController password,
      List<TransactionModel>? transactionList,
      String? paiement_url});
}

/// @nodoc
class _$CompteStateCopyWithImpl<$Res, $Val extends CompteState>
    implements $CompteStateCopyWith<$Res> {
  _$CompteStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CompteState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingDepot = freezed,
    Object? isLoadingRetrait = freezed,
    Object? isLoadTrans = freezed,
    Object? montantTransaction = null,
    Object? phone = null,
    Object? password = null,
    Object? transactionList = freezed,
    Object? paiement_url = freezed,
  }) {
    return _then(_value.copyWith(
      isLoadingDepot: freezed == isLoadingDepot
          ? _value.isLoadingDepot
          : isLoadingDepot // ignore: cast_nullable_to_non_nullable
              as int?,
      isLoadingRetrait: freezed == isLoadingRetrait
          ? _value.isLoadingRetrait
          : isLoadingRetrait // ignore: cast_nullable_to_non_nullable
              as int?,
      isLoadTrans: freezed == isLoadTrans
          ? _value.isLoadTrans
          : isLoadTrans // ignore: cast_nullable_to_non_nullable
              as int?,
      montantTransaction: null == montantTransaction
          ? _value.montantTransaction
          : montantTransaction // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      transactionList: freezed == transactionList
          ? _value.transactionList
          : transactionList // ignore: cast_nullable_to_non_nullable
              as List<TransactionModel>?,
      paiement_url: freezed == paiement_url
          ? _value.paiement_url
          : paiement_url // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CompteStateImplCopyWith<$Res>
    implements $CompteStateCopyWith<$Res> {
  factory _$$CompteStateImplCopyWith(
          _$CompteStateImpl value, $Res Function(_$CompteStateImpl) then) =
      __$$CompteStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? isLoadingDepot,
      int? isLoadingRetrait,
      int? isLoadTrans,
      TextEditingController montantTransaction,
      TextEditingController phone,
      TextEditingController password,
      List<TransactionModel>? transactionList,
      String? paiement_url});
}

/// @nodoc
class __$$CompteStateImplCopyWithImpl<$Res>
    extends _$CompteStateCopyWithImpl<$Res, _$CompteStateImpl>
    implements _$$CompteStateImplCopyWith<$Res> {
  __$$CompteStateImplCopyWithImpl(
      _$CompteStateImpl _value, $Res Function(_$CompteStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CompteState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingDepot = freezed,
    Object? isLoadingRetrait = freezed,
    Object? isLoadTrans = freezed,
    Object? montantTransaction = null,
    Object? phone = null,
    Object? password = null,
    Object? transactionList = freezed,
    Object? paiement_url = freezed,
  }) {
    return _then(_$CompteStateImpl(
      isLoadingDepot: freezed == isLoadingDepot
          ? _value.isLoadingDepot
          : isLoadingDepot // ignore: cast_nullable_to_non_nullable
              as int?,
      isLoadingRetrait: freezed == isLoadingRetrait
          ? _value.isLoadingRetrait
          : isLoadingRetrait // ignore: cast_nullable_to_non_nullable
              as int?,
      isLoadTrans: freezed == isLoadTrans
          ? _value.isLoadTrans
          : isLoadTrans // ignore: cast_nullable_to_non_nullable
              as int?,
      montantTransaction: null == montantTransaction
          ? _value.montantTransaction
          : montantTransaction // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      transactionList: freezed == transactionList
          ? _value._transactionList
          : transactionList // ignore: cast_nullable_to_non_nullable
              as List<TransactionModel>?,
      paiement_url: freezed == paiement_url
          ? _value.paiement_url
          : paiement_url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CompteStateImpl implements _CompteState {
  const _$CompteStateImpl(
      {this.isLoadingDepot,
      this.isLoadingRetrait,
      this.isLoadTrans,
      required this.montantTransaction,
      required this.phone,
      required this.password,
      final List<TransactionModel>? transactionList,
      this.paiement_url})
      : _transactionList = transactionList;

  @override
  final int? isLoadingDepot;
  @override
  final int? isLoadingRetrait;
  @override
  final int? isLoadTrans;
  @override
  final TextEditingController montantTransaction;
  @override
  final TextEditingController phone;
  @override
  final TextEditingController password;
  final List<TransactionModel>? _transactionList;
  @override
  List<TransactionModel>? get transactionList {
    final value = _transactionList;
    if (value == null) return null;
    if (_transactionList is EqualUnmodifiableListView) return _transactionList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// TextEditingController? contactEmetteur,
  @override
  final String? paiement_url;

  @override
  String toString() {
    return 'CompteState(isLoadingDepot: $isLoadingDepot, isLoadingRetrait: $isLoadingRetrait, isLoadTrans: $isLoadTrans, montantTransaction: $montantTransaction, phone: $phone, password: $password, transactionList: $transactionList, paiement_url: $paiement_url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompteStateImpl &&
            (identical(other.isLoadingDepot, isLoadingDepot) ||
                other.isLoadingDepot == isLoadingDepot) &&
            (identical(other.isLoadingRetrait, isLoadingRetrait) ||
                other.isLoadingRetrait == isLoadingRetrait) &&
            (identical(other.isLoadTrans, isLoadTrans) ||
                other.isLoadTrans == isLoadTrans) &&
            (identical(other.montantTransaction, montantTransaction) ||
                other.montantTransaction == montantTransaction) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.password, password) ||
                other.password == password) &&
            const DeepCollectionEquality()
                .equals(other._transactionList, _transactionList) &&
            (identical(other.paiement_url, paiement_url) ||
                other.paiement_url == paiement_url));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoadingDepot,
      isLoadingRetrait,
      isLoadTrans,
      montantTransaction,
      phone,
      password,
      const DeepCollectionEquality().hash(_transactionList),
      paiement_url);

  /// Create a copy of CompteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompteStateImplCopyWith<_$CompteStateImpl> get copyWith =>
      __$$CompteStateImplCopyWithImpl<_$CompteStateImpl>(this, _$identity);
}

abstract class _CompteState implements CompteState {
  const factory _CompteState(
      {final int? isLoadingDepot,
      final int? isLoadingRetrait,
      final int? isLoadTrans,
      required final TextEditingController montantTransaction,
      required final TextEditingController phone,
      required final TextEditingController password,
      final List<TransactionModel>? transactionList,
      final String? paiement_url}) = _$CompteStateImpl;

  @override
  int? get isLoadingDepot;
  @override
  int? get isLoadingRetrait;
  @override
  int? get isLoadTrans;
  @override
  TextEditingController get montantTransaction;
  @override
  TextEditingController get phone;
  @override
  TextEditingController get password;
  @override
  List<TransactionModel>?
      get transactionList; // TextEditingController? contactEmetteur,
  @override
  String? get paiement_url;

  /// Create a copy of CompteState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompteStateImplCopyWith<_$CompteStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
