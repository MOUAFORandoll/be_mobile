// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error) error,
    required TResult Function() userData,
    required TResult Function(dynamic index) setIndex,
    required TResult Function(dynamic index) setIndexHistory,
    required TResult Function(CategoryModel category) selectCategory,
    required TResult Function(List<CategoryModel> categoryList)
        updateListCategory,
    required TResult Function() getCategoryList,
    required TResult Function() openLivraisonModal,
    required TResult Function() homeStateLivraison,
    required TResult Function(int idLivraison) findLivraisonById,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function()? userData,
    TResult? Function(dynamic index)? setIndex,
    TResult? Function(dynamic index)? setIndexHistory,
    TResult? Function(CategoryModel category)? selectCategory,
    TResult? Function(List<CategoryModel> categoryList)? updateListCategory,
    TResult? Function()? getCategoryList,
    TResult? Function()? openLivraisonModal,
    TResult? Function()? homeStateLivraison,
    TResult? Function(int idLivraison)? findLivraisonById,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function()? userData,
    TResult Function(dynamic index)? setIndex,
    TResult Function(dynamic index)? setIndexHistory,
    TResult Function(CategoryModel category)? selectCategory,
    TResult Function(List<CategoryModel> categoryList)? updateListCategory,
    TResult Function()? getCategoryList,
    TResult Function()? openLivraisonModal,
    TResult Function()? homeStateLivraison,
    TResult Function(int idLivraison)? findLivraisonById,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ErrorEvent value) error,
    required TResult Function(UserDataEvent value) userData,
    required TResult Function(SetIndexEvent value) setIndex,
    required TResult Function(SetIndexHistoryEvent value) setIndexHistory,
    required TResult Function(SelectCategory value) selectCategory,
    required TResult Function(UpdateListCategory value) updateListCategory,
    required TResult Function(GetCategoryList value) getCategoryList,
    required TResult Function(OpenLivraisonModal value) openLivraisonModal,
    required TResult Function(HomeStateLivraison value) homeStateLivraison,
    required TResult Function(FindLivraisonById value) findLivraisonById,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorEvent value)? error,
    TResult? Function(UserDataEvent value)? userData,
    TResult? Function(SetIndexEvent value)? setIndex,
    TResult? Function(SetIndexHistoryEvent value)? setIndexHistory,
    TResult? Function(SelectCategory value)? selectCategory,
    TResult? Function(UpdateListCategory value)? updateListCategory,
    TResult? Function(GetCategoryList value)? getCategoryList,
    TResult? Function(OpenLivraisonModal value)? openLivraisonModal,
    TResult? Function(HomeStateLivraison value)? homeStateLivraison,
    TResult? Function(FindLivraisonById value)? findLivraisonById,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorEvent value)? error,
    TResult Function(UserDataEvent value)? userData,
    TResult Function(SetIndexEvent value)? setIndex,
    TResult Function(SetIndexHistoryEvent value)? setIndexHistory,
    TResult Function(SelectCategory value)? selectCategory,
    TResult Function(UpdateListCategory value)? updateListCategory,
    TResult Function(GetCategoryList value)? getCategoryList,
    TResult Function(OpenLivraisonModal value)? openLivraisonModal,
    TResult Function(HomeStateLivraison value)? homeStateLivraison,
    TResult Function(FindLivraisonById value)? findLivraisonById,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res, HomeEvent>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res, $Val extends HomeEvent>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ErrorEventImplCopyWith<$Res> {
  factory _$$ErrorEventImplCopyWith(
          _$ErrorEventImpl value, $Res Function(_$ErrorEventImpl) then) =
      __$$ErrorEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorEventImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$ErrorEventImpl>
    implements _$$ErrorEventImplCopyWith<$Res> {
  __$$ErrorEventImplCopyWithImpl(
      _$ErrorEventImpl _value, $Res Function(_$ErrorEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorEventImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorEventImpl implements ErrorEvent {
  const _$ErrorEventImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'HomeEvent.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorEventImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorEventImplCopyWith<_$ErrorEventImpl> get copyWith =>
      __$$ErrorEventImplCopyWithImpl<_$ErrorEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error) error,
    required TResult Function() userData,
    required TResult Function(dynamic index) setIndex,
    required TResult Function(dynamic index) setIndexHistory,
    required TResult Function(CategoryModel category) selectCategory,
    required TResult Function(List<CategoryModel> categoryList)
        updateListCategory,
    required TResult Function() getCategoryList,
    required TResult Function() openLivraisonModal,
    required TResult Function() homeStateLivraison,
    required TResult Function(int idLivraison) findLivraisonById,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function()? userData,
    TResult? Function(dynamic index)? setIndex,
    TResult? Function(dynamic index)? setIndexHistory,
    TResult? Function(CategoryModel category)? selectCategory,
    TResult? Function(List<CategoryModel> categoryList)? updateListCategory,
    TResult? Function()? getCategoryList,
    TResult? Function()? openLivraisonModal,
    TResult? Function()? homeStateLivraison,
    TResult? Function(int idLivraison)? findLivraisonById,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function()? userData,
    TResult Function(dynamic index)? setIndex,
    TResult Function(dynamic index)? setIndexHistory,
    TResult Function(CategoryModel category)? selectCategory,
    TResult Function(List<CategoryModel> categoryList)? updateListCategory,
    TResult Function()? getCategoryList,
    TResult Function()? openLivraisonModal,
    TResult Function()? homeStateLivraison,
    TResult Function(int idLivraison)? findLivraisonById,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ErrorEvent value) error,
    required TResult Function(UserDataEvent value) userData,
    required TResult Function(SetIndexEvent value) setIndex,
    required TResult Function(SetIndexHistoryEvent value) setIndexHistory,
    required TResult Function(SelectCategory value) selectCategory,
    required TResult Function(UpdateListCategory value) updateListCategory,
    required TResult Function(GetCategoryList value) getCategoryList,
    required TResult Function(OpenLivraisonModal value) openLivraisonModal,
    required TResult Function(HomeStateLivraison value) homeStateLivraison,
    required TResult Function(FindLivraisonById value) findLivraisonById,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorEvent value)? error,
    TResult? Function(UserDataEvent value)? userData,
    TResult? Function(SetIndexEvent value)? setIndex,
    TResult? Function(SetIndexHistoryEvent value)? setIndexHistory,
    TResult? Function(SelectCategory value)? selectCategory,
    TResult? Function(UpdateListCategory value)? updateListCategory,
    TResult? Function(GetCategoryList value)? getCategoryList,
    TResult? Function(OpenLivraisonModal value)? openLivraisonModal,
    TResult? Function(HomeStateLivraison value)? homeStateLivraison,
    TResult? Function(FindLivraisonById value)? findLivraisonById,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorEvent value)? error,
    TResult Function(UserDataEvent value)? userData,
    TResult Function(SetIndexEvent value)? setIndex,
    TResult Function(SetIndexHistoryEvent value)? setIndexHistory,
    TResult Function(SelectCategory value)? selectCategory,
    TResult Function(UpdateListCategory value)? updateListCategory,
    TResult Function(GetCategoryList value)? getCategoryList,
    TResult Function(OpenLivraisonModal value)? openLivraisonModal,
    TResult Function(HomeStateLivraison value)? homeStateLivraison,
    TResult Function(FindLivraisonById value)? findLivraisonById,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorEvent implements HomeEvent {
  const factory ErrorEvent({required final String error}) = _$ErrorEventImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$ErrorEventImplCopyWith<_$ErrorEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserDataEventImplCopyWith<$Res> {
  factory _$$UserDataEventImplCopyWith(
          _$UserDataEventImpl value, $Res Function(_$UserDataEventImpl) then) =
      __$$UserDataEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserDataEventImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$UserDataEventImpl>
    implements _$$UserDataEventImplCopyWith<$Res> {
  __$$UserDataEventImplCopyWithImpl(
      _$UserDataEventImpl _value, $Res Function(_$UserDataEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UserDataEventImpl implements UserDataEvent {
  const _$UserDataEventImpl();

  @override
  String toString() {
    return 'HomeEvent.userData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserDataEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error) error,
    required TResult Function() userData,
    required TResult Function(dynamic index) setIndex,
    required TResult Function(dynamic index) setIndexHistory,
    required TResult Function(CategoryModel category) selectCategory,
    required TResult Function(List<CategoryModel> categoryList)
        updateListCategory,
    required TResult Function() getCategoryList,
    required TResult Function() openLivraisonModal,
    required TResult Function() homeStateLivraison,
    required TResult Function(int idLivraison) findLivraisonById,
  }) {
    return userData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function()? userData,
    TResult? Function(dynamic index)? setIndex,
    TResult? Function(dynamic index)? setIndexHistory,
    TResult? Function(CategoryModel category)? selectCategory,
    TResult? Function(List<CategoryModel> categoryList)? updateListCategory,
    TResult? Function()? getCategoryList,
    TResult? Function()? openLivraisonModal,
    TResult? Function()? homeStateLivraison,
    TResult? Function(int idLivraison)? findLivraisonById,
  }) {
    return userData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function()? userData,
    TResult Function(dynamic index)? setIndex,
    TResult Function(dynamic index)? setIndexHistory,
    TResult Function(CategoryModel category)? selectCategory,
    TResult Function(List<CategoryModel> categoryList)? updateListCategory,
    TResult Function()? getCategoryList,
    TResult Function()? openLivraisonModal,
    TResult Function()? homeStateLivraison,
    TResult Function(int idLivraison)? findLivraisonById,
    required TResult orElse(),
  }) {
    if (userData != null) {
      return userData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ErrorEvent value) error,
    required TResult Function(UserDataEvent value) userData,
    required TResult Function(SetIndexEvent value) setIndex,
    required TResult Function(SetIndexHistoryEvent value) setIndexHistory,
    required TResult Function(SelectCategory value) selectCategory,
    required TResult Function(UpdateListCategory value) updateListCategory,
    required TResult Function(GetCategoryList value) getCategoryList,
    required TResult Function(OpenLivraisonModal value) openLivraisonModal,
    required TResult Function(HomeStateLivraison value) homeStateLivraison,
    required TResult Function(FindLivraisonById value) findLivraisonById,
  }) {
    return userData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorEvent value)? error,
    TResult? Function(UserDataEvent value)? userData,
    TResult? Function(SetIndexEvent value)? setIndex,
    TResult? Function(SetIndexHistoryEvent value)? setIndexHistory,
    TResult? Function(SelectCategory value)? selectCategory,
    TResult? Function(UpdateListCategory value)? updateListCategory,
    TResult? Function(GetCategoryList value)? getCategoryList,
    TResult? Function(OpenLivraisonModal value)? openLivraisonModal,
    TResult? Function(HomeStateLivraison value)? homeStateLivraison,
    TResult? Function(FindLivraisonById value)? findLivraisonById,
  }) {
    return userData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorEvent value)? error,
    TResult Function(UserDataEvent value)? userData,
    TResult Function(SetIndexEvent value)? setIndex,
    TResult Function(SetIndexHistoryEvent value)? setIndexHistory,
    TResult Function(SelectCategory value)? selectCategory,
    TResult Function(UpdateListCategory value)? updateListCategory,
    TResult Function(GetCategoryList value)? getCategoryList,
    TResult Function(OpenLivraisonModal value)? openLivraisonModal,
    TResult Function(HomeStateLivraison value)? homeStateLivraison,
    TResult Function(FindLivraisonById value)? findLivraisonById,
    required TResult orElse(),
  }) {
    if (userData != null) {
      return userData(this);
    }
    return orElse();
  }
}

abstract class UserDataEvent implements HomeEvent {
  const factory UserDataEvent() = _$UserDataEventImpl;
}

/// @nodoc
abstract class _$$SetIndexEventImplCopyWith<$Res> {
  factory _$$SetIndexEventImplCopyWith(
          _$SetIndexEventImpl value, $Res Function(_$SetIndexEventImpl) then) =
      __$$SetIndexEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic index});
}

/// @nodoc
class __$$SetIndexEventImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$SetIndexEventImpl>
    implements _$$SetIndexEventImplCopyWith<$Res> {
  __$$SetIndexEventImplCopyWithImpl(
      _$SetIndexEventImpl _value, $Res Function(_$SetIndexEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = freezed,
  }) {
    return _then(_$SetIndexEventImpl(
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$SetIndexEventImpl implements SetIndexEvent {
  const _$SetIndexEventImpl({required this.index});

  @override
  final dynamic index;

  @override
  String toString() {
    return 'HomeEvent.setIndex(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetIndexEventImpl &&
            const DeepCollectionEquality().equals(other.index, index));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(index));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetIndexEventImplCopyWith<_$SetIndexEventImpl> get copyWith =>
      __$$SetIndexEventImplCopyWithImpl<_$SetIndexEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error) error,
    required TResult Function() userData,
    required TResult Function(dynamic index) setIndex,
    required TResult Function(dynamic index) setIndexHistory,
    required TResult Function(CategoryModel category) selectCategory,
    required TResult Function(List<CategoryModel> categoryList)
        updateListCategory,
    required TResult Function() getCategoryList,
    required TResult Function() openLivraisonModal,
    required TResult Function() homeStateLivraison,
    required TResult Function(int idLivraison) findLivraisonById,
  }) {
    return setIndex(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function()? userData,
    TResult? Function(dynamic index)? setIndex,
    TResult? Function(dynamic index)? setIndexHistory,
    TResult? Function(CategoryModel category)? selectCategory,
    TResult? Function(List<CategoryModel> categoryList)? updateListCategory,
    TResult? Function()? getCategoryList,
    TResult? Function()? openLivraisonModal,
    TResult? Function()? homeStateLivraison,
    TResult? Function(int idLivraison)? findLivraisonById,
  }) {
    return setIndex?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function()? userData,
    TResult Function(dynamic index)? setIndex,
    TResult Function(dynamic index)? setIndexHistory,
    TResult Function(CategoryModel category)? selectCategory,
    TResult Function(List<CategoryModel> categoryList)? updateListCategory,
    TResult Function()? getCategoryList,
    TResult Function()? openLivraisonModal,
    TResult Function()? homeStateLivraison,
    TResult Function(int idLivraison)? findLivraisonById,
    required TResult orElse(),
  }) {
    if (setIndex != null) {
      return setIndex(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ErrorEvent value) error,
    required TResult Function(UserDataEvent value) userData,
    required TResult Function(SetIndexEvent value) setIndex,
    required TResult Function(SetIndexHistoryEvent value) setIndexHistory,
    required TResult Function(SelectCategory value) selectCategory,
    required TResult Function(UpdateListCategory value) updateListCategory,
    required TResult Function(GetCategoryList value) getCategoryList,
    required TResult Function(OpenLivraisonModal value) openLivraisonModal,
    required TResult Function(HomeStateLivraison value) homeStateLivraison,
    required TResult Function(FindLivraisonById value) findLivraisonById,
  }) {
    return setIndex(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorEvent value)? error,
    TResult? Function(UserDataEvent value)? userData,
    TResult? Function(SetIndexEvent value)? setIndex,
    TResult? Function(SetIndexHistoryEvent value)? setIndexHistory,
    TResult? Function(SelectCategory value)? selectCategory,
    TResult? Function(UpdateListCategory value)? updateListCategory,
    TResult? Function(GetCategoryList value)? getCategoryList,
    TResult? Function(OpenLivraisonModal value)? openLivraisonModal,
    TResult? Function(HomeStateLivraison value)? homeStateLivraison,
    TResult? Function(FindLivraisonById value)? findLivraisonById,
  }) {
    return setIndex?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorEvent value)? error,
    TResult Function(UserDataEvent value)? userData,
    TResult Function(SetIndexEvent value)? setIndex,
    TResult Function(SetIndexHistoryEvent value)? setIndexHistory,
    TResult Function(SelectCategory value)? selectCategory,
    TResult Function(UpdateListCategory value)? updateListCategory,
    TResult Function(GetCategoryList value)? getCategoryList,
    TResult Function(OpenLivraisonModal value)? openLivraisonModal,
    TResult Function(HomeStateLivraison value)? homeStateLivraison,
    TResult Function(FindLivraisonById value)? findLivraisonById,
    required TResult orElse(),
  }) {
    if (setIndex != null) {
      return setIndex(this);
    }
    return orElse();
  }
}

abstract class SetIndexEvent implements HomeEvent {
  const factory SetIndexEvent({required final dynamic index}) =
      _$SetIndexEventImpl;

  dynamic get index;
  @JsonKey(ignore: true)
  _$$SetIndexEventImplCopyWith<_$SetIndexEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetIndexHistoryEventImplCopyWith<$Res> {
  factory _$$SetIndexHistoryEventImplCopyWith(_$SetIndexHistoryEventImpl value,
          $Res Function(_$SetIndexHistoryEventImpl) then) =
      __$$SetIndexHistoryEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic index});
}

/// @nodoc
class __$$SetIndexHistoryEventImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$SetIndexHistoryEventImpl>
    implements _$$SetIndexHistoryEventImplCopyWith<$Res> {
  __$$SetIndexHistoryEventImplCopyWithImpl(_$SetIndexHistoryEventImpl _value,
      $Res Function(_$SetIndexHistoryEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = freezed,
  }) {
    return _then(_$SetIndexHistoryEventImpl(
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$SetIndexHistoryEventImpl implements SetIndexHistoryEvent {
  const _$SetIndexHistoryEventImpl({required this.index});

  @override
  final dynamic index;

  @override
  String toString() {
    return 'HomeEvent.setIndexHistory(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetIndexHistoryEventImpl &&
            const DeepCollectionEquality().equals(other.index, index));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(index));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetIndexHistoryEventImplCopyWith<_$SetIndexHistoryEventImpl>
      get copyWith =>
          __$$SetIndexHistoryEventImplCopyWithImpl<_$SetIndexHistoryEventImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error) error,
    required TResult Function() userData,
    required TResult Function(dynamic index) setIndex,
    required TResult Function(dynamic index) setIndexHistory,
    required TResult Function(CategoryModel category) selectCategory,
    required TResult Function(List<CategoryModel> categoryList)
        updateListCategory,
    required TResult Function() getCategoryList,
    required TResult Function() openLivraisonModal,
    required TResult Function() homeStateLivraison,
    required TResult Function(int idLivraison) findLivraisonById,
  }) {
    return setIndexHistory(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function()? userData,
    TResult? Function(dynamic index)? setIndex,
    TResult? Function(dynamic index)? setIndexHistory,
    TResult? Function(CategoryModel category)? selectCategory,
    TResult? Function(List<CategoryModel> categoryList)? updateListCategory,
    TResult? Function()? getCategoryList,
    TResult? Function()? openLivraisonModal,
    TResult? Function()? homeStateLivraison,
    TResult? Function(int idLivraison)? findLivraisonById,
  }) {
    return setIndexHistory?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function()? userData,
    TResult Function(dynamic index)? setIndex,
    TResult Function(dynamic index)? setIndexHistory,
    TResult Function(CategoryModel category)? selectCategory,
    TResult Function(List<CategoryModel> categoryList)? updateListCategory,
    TResult Function()? getCategoryList,
    TResult Function()? openLivraisonModal,
    TResult Function()? homeStateLivraison,
    TResult Function(int idLivraison)? findLivraisonById,
    required TResult orElse(),
  }) {
    if (setIndexHistory != null) {
      return setIndexHistory(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ErrorEvent value) error,
    required TResult Function(UserDataEvent value) userData,
    required TResult Function(SetIndexEvent value) setIndex,
    required TResult Function(SetIndexHistoryEvent value) setIndexHistory,
    required TResult Function(SelectCategory value) selectCategory,
    required TResult Function(UpdateListCategory value) updateListCategory,
    required TResult Function(GetCategoryList value) getCategoryList,
    required TResult Function(OpenLivraisonModal value) openLivraisonModal,
    required TResult Function(HomeStateLivraison value) homeStateLivraison,
    required TResult Function(FindLivraisonById value) findLivraisonById,
  }) {
    return setIndexHistory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorEvent value)? error,
    TResult? Function(UserDataEvent value)? userData,
    TResult? Function(SetIndexEvent value)? setIndex,
    TResult? Function(SetIndexHistoryEvent value)? setIndexHistory,
    TResult? Function(SelectCategory value)? selectCategory,
    TResult? Function(UpdateListCategory value)? updateListCategory,
    TResult? Function(GetCategoryList value)? getCategoryList,
    TResult? Function(OpenLivraisonModal value)? openLivraisonModal,
    TResult? Function(HomeStateLivraison value)? homeStateLivraison,
    TResult? Function(FindLivraisonById value)? findLivraisonById,
  }) {
    return setIndexHistory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorEvent value)? error,
    TResult Function(UserDataEvent value)? userData,
    TResult Function(SetIndexEvent value)? setIndex,
    TResult Function(SetIndexHistoryEvent value)? setIndexHistory,
    TResult Function(SelectCategory value)? selectCategory,
    TResult Function(UpdateListCategory value)? updateListCategory,
    TResult Function(GetCategoryList value)? getCategoryList,
    TResult Function(OpenLivraisonModal value)? openLivraisonModal,
    TResult Function(HomeStateLivraison value)? homeStateLivraison,
    TResult Function(FindLivraisonById value)? findLivraisonById,
    required TResult orElse(),
  }) {
    if (setIndexHistory != null) {
      return setIndexHistory(this);
    }
    return orElse();
  }
}

abstract class SetIndexHistoryEvent implements HomeEvent {
  const factory SetIndexHistoryEvent({required final dynamic index}) =
      _$SetIndexHistoryEventImpl;

  dynamic get index;
  @JsonKey(ignore: true)
  _$$SetIndexHistoryEventImplCopyWith<_$SetIndexHistoryEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectCategoryImplCopyWith<$Res> {
  factory _$$SelectCategoryImplCopyWith(_$SelectCategoryImpl value,
          $Res Function(_$SelectCategoryImpl) then) =
      __$$SelectCategoryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CategoryModel category});
}

/// @nodoc
class __$$SelectCategoryImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$SelectCategoryImpl>
    implements _$$SelectCategoryImplCopyWith<$Res> {
  __$$SelectCategoryImplCopyWithImpl(
      _$SelectCategoryImpl _value, $Res Function(_$SelectCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
  }) {
    return _then(_$SelectCategoryImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryModel,
    ));
  }
}

/// @nodoc

class _$SelectCategoryImpl implements SelectCategory {
  const _$SelectCategoryImpl({required this.category});

  @override
  final CategoryModel category;

  @override
  String toString() {
    return 'HomeEvent.selectCategory(category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectCategoryImpl &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectCategoryImplCopyWith<_$SelectCategoryImpl> get copyWith =>
      __$$SelectCategoryImplCopyWithImpl<_$SelectCategoryImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error) error,
    required TResult Function() userData,
    required TResult Function(dynamic index) setIndex,
    required TResult Function(dynamic index) setIndexHistory,
    required TResult Function(CategoryModel category) selectCategory,
    required TResult Function(List<CategoryModel> categoryList)
        updateListCategory,
    required TResult Function() getCategoryList,
    required TResult Function() openLivraisonModal,
    required TResult Function() homeStateLivraison,
    required TResult Function(int idLivraison) findLivraisonById,
  }) {
    return selectCategory(category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function()? userData,
    TResult? Function(dynamic index)? setIndex,
    TResult? Function(dynamic index)? setIndexHistory,
    TResult? Function(CategoryModel category)? selectCategory,
    TResult? Function(List<CategoryModel> categoryList)? updateListCategory,
    TResult? Function()? getCategoryList,
    TResult? Function()? openLivraisonModal,
    TResult? Function()? homeStateLivraison,
    TResult? Function(int idLivraison)? findLivraisonById,
  }) {
    return selectCategory?.call(category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function()? userData,
    TResult Function(dynamic index)? setIndex,
    TResult Function(dynamic index)? setIndexHistory,
    TResult Function(CategoryModel category)? selectCategory,
    TResult Function(List<CategoryModel> categoryList)? updateListCategory,
    TResult Function()? getCategoryList,
    TResult Function()? openLivraisonModal,
    TResult Function()? homeStateLivraison,
    TResult Function(int idLivraison)? findLivraisonById,
    required TResult orElse(),
  }) {
    if (selectCategory != null) {
      return selectCategory(category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ErrorEvent value) error,
    required TResult Function(UserDataEvent value) userData,
    required TResult Function(SetIndexEvent value) setIndex,
    required TResult Function(SetIndexHistoryEvent value) setIndexHistory,
    required TResult Function(SelectCategory value) selectCategory,
    required TResult Function(UpdateListCategory value) updateListCategory,
    required TResult Function(GetCategoryList value) getCategoryList,
    required TResult Function(OpenLivraisonModal value) openLivraisonModal,
    required TResult Function(HomeStateLivraison value) homeStateLivraison,
    required TResult Function(FindLivraisonById value) findLivraisonById,
  }) {
    return selectCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorEvent value)? error,
    TResult? Function(UserDataEvent value)? userData,
    TResult? Function(SetIndexEvent value)? setIndex,
    TResult? Function(SetIndexHistoryEvent value)? setIndexHistory,
    TResult? Function(SelectCategory value)? selectCategory,
    TResult? Function(UpdateListCategory value)? updateListCategory,
    TResult? Function(GetCategoryList value)? getCategoryList,
    TResult? Function(OpenLivraisonModal value)? openLivraisonModal,
    TResult? Function(HomeStateLivraison value)? homeStateLivraison,
    TResult? Function(FindLivraisonById value)? findLivraisonById,
  }) {
    return selectCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorEvent value)? error,
    TResult Function(UserDataEvent value)? userData,
    TResult Function(SetIndexEvent value)? setIndex,
    TResult Function(SetIndexHistoryEvent value)? setIndexHistory,
    TResult Function(SelectCategory value)? selectCategory,
    TResult Function(UpdateListCategory value)? updateListCategory,
    TResult Function(GetCategoryList value)? getCategoryList,
    TResult Function(OpenLivraisonModal value)? openLivraisonModal,
    TResult Function(HomeStateLivraison value)? homeStateLivraison,
    TResult Function(FindLivraisonById value)? findLivraisonById,
    required TResult orElse(),
  }) {
    if (selectCategory != null) {
      return selectCategory(this);
    }
    return orElse();
  }
}

abstract class SelectCategory implements HomeEvent {
  const factory SelectCategory({required final CategoryModel category}) =
      _$SelectCategoryImpl;

  CategoryModel get category;
  @JsonKey(ignore: true)
  _$$SelectCategoryImplCopyWith<_$SelectCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateListCategoryImplCopyWith<$Res> {
  factory _$$UpdateListCategoryImplCopyWith(_$UpdateListCategoryImpl value,
          $Res Function(_$UpdateListCategoryImpl) then) =
      __$$UpdateListCategoryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<CategoryModel> categoryList});
}

/// @nodoc
class __$$UpdateListCategoryImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$UpdateListCategoryImpl>
    implements _$$UpdateListCategoryImplCopyWith<$Res> {
  __$$UpdateListCategoryImplCopyWithImpl(_$UpdateListCategoryImpl _value,
      $Res Function(_$UpdateListCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryList = null,
  }) {
    return _then(_$UpdateListCategoryImpl(
      categoryList: null == categoryList
          ? _value._categoryList
          : categoryList // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
    ));
  }
}

/// @nodoc

class _$UpdateListCategoryImpl implements UpdateListCategory {
  const _$UpdateListCategoryImpl(
      {required final List<CategoryModel> categoryList})
      : _categoryList = categoryList;

  final List<CategoryModel> _categoryList;
  @override
  List<CategoryModel> get categoryList {
    if (_categoryList is EqualUnmodifiableListView) return _categoryList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryList);
  }

  @override
  String toString() {
    return 'HomeEvent.updateListCategory(categoryList: $categoryList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateListCategoryImpl &&
            const DeepCollectionEquality()
                .equals(other._categoryList, _categoryList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categoryList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateListCategoryImplCopyWith<_$UpdateListCategoryImpl> get copyWith =>
      __$$UpdateListCategoryImplCopyWithImpl<_$UpdateListCategoryImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error) error,
    required TResult Function() userData,
    required TResult Function(dynamic index) setIndex,
    required TResult Function(dynamic index) setIndexHistory,
    required TResult Function(CategoryModel category) selectCategory,
    required TResult Function(List<CategoryModel> categoryList)
        updateListCategory,
    required TResult Function() getCategoryList,
    required TResult Function() openLivraisonModal,
    required TResult Function() homeStateLivraison,
    required TResult Function(int idLivraison) findLivraisonById,
  }) {
    return updateListCategory(categoryList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function()? userData,
    TResult? Function(dynamic index)? setIndex,
    TResult? Function(dynamic index)? setIndexHistory,
    TResult? Function(CategoryModel category)? selectCategory,
    TResult? Function(List<CategoryModel> categoryList)? updateListCategory,
    TResult? Function()? getCategoryList,
    TResult? Function()? openLivraisonModal,
    TResult? Function()? homeStateLivraison,
    TResult? Function(int idLivraison)? findLivraisonById,
  }) {
    return updateListCategory?.call(categoryList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function()? userData,
    TResult Function(dynamic index)? setIndex,
    TResult Function(dynamic index)? setIndexHistory,
    TResult Function(CategoryModel category)? selectCategory,
    TResult Function(List<CategoryModel> categoryList)? updateListCategory,
    TResult Function()? getCategoryList,
    TResult Function()? openLivraisonModal,
    TResult Function()? homeStateLivraison,
    TResult Function(int idLivraison)? findLivraisonById,
    required TResult orElse(),
  }) {
    if (updateListCategory != null) {
      return updateListCategory(categoryList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ErrorEvent value) error,
    required TResult Function(UserDataEvent value) userData,
    required TResult Function(SetIndexEvent value) setIndex,
    required TResult Function(SetIndexHistoryEvent value) setIndexHistory,
    required TResult Function(SelectCategory value) selectCategory,
    required TResult Function(UpdateListCategory value) updateListCategory,
    required TResult Function(GetCategoryList value) getCategoryList,
    required TResult Function(OpenLivraisonModal value) openLivraisonModal,
    required TResult Function(HomeStateLivraison value) homeStateLivraison,
    required TResult Function(FindLivraisonById value) findLivraisonById,
  }) {
    return updateListCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorEvent value)? error,
    TResult? Function(UserDataEvent value)? userData,
    TResult? Function(SetIndexEvent value)? setIndex,
    TResult? Function(SetIndexHistoryEvent value)? setIndexHistory,
    TResult? Function(SelectCategory value)? selectCategory,
    TResult? Function(UpdateListCategory value)? updateListCategory,
    TResult? Function(GetCategoryList value)? getCategoryList,
    TResult? Function(OpenLivraisonModal value)? openLivraisonModal,
    TResult? Function(HomeStateLivraison value)? homeStateLivraison,
    TResult? Function(FindLivraisonById value)? findLivraisonById,
  }) {
    return updateListCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorEvent value)? error,
    TResult Function(UserDataEvent value)? userData,
    TResult Function(SetIndexEvent value)? setIndex,
    TResult Function(SetIndexHistoryEvent value)? setIndexHistory,
    TResult Function(SelectCategory value)? selectCategory,
    TResult Function(UpdateListCategory value)? updateListCategory,
    TResult Function(GetCategoryList value)? getCategoryList,
    TResult Function(OpenLivraisonModal value)? openLivraisonModal,
    TResult Function(HomeStateLivraison value)? homeStateLivraison,
    TResult Function(FindLivraisonById value)? findLivraisonById,
    required TResult orElse(),
  }) {
    if (updateListCategory != null) {
      return updateListCategory(this);
    }
    return orElse();
  }
}

abstract class UpdateListCategory implements HomeEvent {
  const factory UpdateListCategory(
          {required final List<CategoryModel> categoryList}) =
      _$UpdateListCategoryImpl;

  List<CategoryModel> get categoryList;
  @JsonKey(ignore: true)
  _$$UpdateListCategoryImplCopyWith<_$UpdateListCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetCategoryListImplCopyWith<$Res> {
  factory _$$GetCategoryListImplCopyWith(_$GetCategoryListImpl value,
          $Res Function(_$GetCategoryListImpl) then) =
      __$$GetCategoryListImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetCategoryListImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$GetCategoryListImpl>
    implements _$$GetCategoryListImplCopyWith<$Res> {
  __$$GetCategoryListImplCopyWithImpl(
      _$GetCategoryListImpl _value, $Res Function(_$GetCategoryListImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetCategoryListImpl implements GetCategoryList {
  const _$GetCategoryListImpl();

  @override
  String toString() {
    return 'HomeEvent.getCategoryList()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetCategoryListImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error) error,
    required TResult Function() userData,
    required TResult Function(dynamic index) setIndex,
    required TResult Function(dynamic index) setIndexHistory,
    required TResult Function(CategoryModel category) selectCategory,
    required TResult Function(List<CategoryModel> categoryList)
        updateListCategory,
    required TResult Function() getCategoryList,
    required TResult Function() openLivraisonModal,
    required TResult Function() homeStateLivraison,
    required TResult Function(int idLivraison) findLivraisonById,
  }) {
    return getCategoryList();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function()? userData,
    TResult? Function(dynamic index)? setIndex,
    TResult? Function(dynamic index)? setIndexHistory,
    TResult? Function(CategoryModel category)? selectCategory,
    TResult? Function(List<CategoryModel> categoryList)? updateListCategory,
    TResult? Function()? getCategoryList,
    TResult? Function()? openLivraisonModal,
    TResult? Function()? homeStateLivraison,
    TResult? Function(int idLivraison)? findLivraisonById,
  }) {
    return getCategoryList?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function()? userData,
    TResult Function(dynamic index)? setIndex,
    TResult Function(dynamic index)? setIndexHistory,
    TResult Function(CategoryModel category)? selectCategory,
    TResult Function(List<CategoryModel> categoryList)? updateListCategory,
    TResult Function()? getCategoryList,
    TResult Function()? openLivraisonModal,
    TResult Function()? homeStateLivraison,
    TResult Function(int idLivraison)? findLivraisonById,
    required TResult orElse(),
  }) {
    if (getCategoryList != null) {
      return getCategoryList();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ErrorEvent value) error,
    required TResult Function(UserDataEvent value) userData,
    required TResult Function(SetIndexEvent value) setIndex,
    required TResult Function(SetIndexHistoryEvent value) setIndexHistory,
    required TResult Function(SelectCategory value) selectCategory,
    required TResult Function(UpdateListCategory value) updateListCategory,
    required TResult Function(GetCategoryList value) getCategoryList,
    required TResult Function(OpenLivraisonModal value) openLivraisonModal,
    required TResult Function(HomeStateLivraison value) homeStateLivraison,
    required TResult Function(FindLivraisonById value) findLivraisonById,
  }) {
    return getCategoryList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorEvent value)? error,
    TResult? Function(UserDataEvent value)? userData,
    TResult? Function(SetIndexEvent value)? setIndex,
    TResult? Function(SetIndexHistoryEvent value)? setIndexHistory,
    TResult? Function(SelectCategory value)? selectCategory,
    TResult? Function(UpdateListCategory value)? updateListCategory,
    TResult? Function(GetCategoryList value)? getCategoryList,
    TResult? Function(OpenLivraisonModal value)? openLivraisonModal,
    TResult? Function(HomeStateLivraison value)? homeStateLivraison,
    TResult? Function(FindLivraisonById value)? findLivraisonById,
  }) {
    return getCategoryList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorEvent value)? error,
    TResult Function(UserDataEvent value)? userData,
    TResult Function(SetIndexEvent value)? setIndex,
    TResult Function(SetIndexHistoryEvent value)? setIndexHistory,
    TResult Function(SelectCategory value)? selectCategory,
    TResult Function(UpdateListCategory value)? updateListCategory,
    TResult Function(GetCategoryList value)? getCategoryList,
    TResult Function(OpenLivraisonModal value)? openLivraisonModal,
    TResult Function(HomeStateLivraison value)? homeStateLivraison,
    TResult Function(FindLivraisonById value)? findLivraisonById,
    required TResult orElse(),
  }) {
    if (getCategoryList != null) {
      return getCategoryList(this);
    }
    return orElse();
  }
}

abstract class GetCategoryList implements HomeEvent {
  const factory GetCategoryList() = _$GetCategoryListImpl;
}

/// @nodoc
abstract class _$$OpenLivraisonModalImplCopyWith<$Res> {
  factory _$$OpenLivraisonModalImplCopyWith(_$OpenLivraisonModalImpl value,
          $Res Function(_$OpenLivraisonModalImpl) then) =
      __$$OpenLivraisonModalImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OpenLivraisonModalImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$OpenLivraisonModalImpl>
    implements _$$OpenLivraisonModalImplCopyWith<$Res> {
  __$$OpenLivraisonModalImplCopyWithImpl(_$OpenLivraisonModalImpl _value,
      $Res Function(_$OpenLivraisonModalImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OpenLivraisonModalImpl implements OpenLivraisonModal {
  const _$OpenLivraisonModalImpl();

  @override
  String toString() {
    return 'HomeEvent.openLivraisonModal()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OpenLivraisonModalImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error) error,
    required TResult Function() userData,
    required TResult Function(dynamic index) setIndex,
    required TResult Function(dynamic index) setIndexHistory,
    required TResult Function(CategoryModel category) selectCategory,
    required TResult Function(List<CategoryModel> categoryList)
        updateListCategory,
    required TResult Function() getCategoryList,
    required TResult Function() openLivraisonModal,
    required TResult Function() homeStateLivraison,
    required TResult Function(int idLivraison) findLivraisonById,
  }) {
    return openLivraisonModal();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function()? userData,
    TResult? Function(dynamic index)? setIndex,
    TResult? Function(dynamic index)? setIndexHistory,
    TResult? Function(CategoryModel category)? selectCategory,
    TResult? Function(List<CategoryModel> categoryList)? updateListCategory,
    TResult? Function()? getCategoryList,
    TResult? Function()? openLivraisonModal,
    TResult? Function()? homeStateLivraison,
    TResult? Function(int idLivraison)? findLivraisonById,
  }) {
    return openLivraisonModal?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function()? userData,
    TResult Function(dynamic index)? setIndex,
    TResult Function(dynamic index)? setIndexHistory,
    TResult Function(CategoryModel category)? selectCategory,
    TResult Function(List<CategoryModel> categoryList)? updateListCategory,
    TResult Function()? getCategoryList,
    TResult Function()? openLivraisonModal,
    TResult Function()? homeStateLivraison,
    TResult Function(int idLivraison)? findLivraisonById,
    required TResult orElse(),
  }) {
    if (openLivraisonModal != null) {
      return openLivraisonModal();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ErrorEvent value) error,
    required TResult Function(UserDataEvent value) userData,
    required TResult Function(SetIndexEvent value) setIndex,
    required TResult Function(SetIndexHistoryEvent value) setIndexHistory,
    required TResult Function(SelectCategory value) selectCategory,
    required TResult Function(UpdateListCategory value) updateListCategory,
    required TResult Function(GetCategoryList value) getCategoryList,
    required TResult Function(OpenLivraisonModal value) openLivraisonModal,
    required TResult Function(HomeStateLivraison value) homeStateLivraison,
    required TResult Function(FindLivraisonById value) findLivraisonById,
  }) {
    return openLivraisonModal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorEvent value)? error,
    TResult? Function(UserDataEvent value)? userData,
    TResult? Function(SetIndexEvent value)? setIndex,
    TResult? Function(SetIndexHistoryEvent value)? setIndexHistory,
    TResult? Function(SelectCategory value)? selectCategory,
    TResult? Function(UpdateListCategory value)? updateListCategory,
    TResult? Function(GetCategoryList value)? getCategoryList,
    TResult? Function(OpenLivraisonModal value)? openLivraisonModal,
    TResult? Function(HomeStateLivraison value)? homeStateLivraison,
    TResult? Function(FindLivraisonById value)? findLivraisonById,
  }) {
    return openLivraisonModal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorEvent value)? error,
    TResult Function(UserDataEvent value)? userData,
    TResult Function(SetIndexEvent value)? setIndex,
    TResult Function(SetIndexHistoryEvent value)? setIndexHistory,
    TResult Function(SelectCategory value)? selectCategory,
    TResult Function(UpdateListCategory value)? updateListCategory,
    TResult Function(GetCategoryList value)? getCategoryList,
    TResult Function(OpenLivraisonModal value)? openLivraisonModal,
    TResult Function(HomeStateLivraison value)? homeStateLivraison,
    TResult Function(FindLivraisonById value)? findLivraisonById,
    required TResult orElse(),
  }) {
    if (openLivraisonModal != null) {
      return openLivraisonModal(this);
    }
    return orElse();
  }
}

abstract class OpenLivraisonModal implements HomeEvent {
  const factory OpenLivraisonModal() = _$OpenLivraisonModalImpl;
}

/// @nodoc
abstract class _$$HomeStateLivraisonImplCopyWith<$Res> {
  factory _$$HomeStateLivraisonImplCopyWith(_$HomeStateLivraisonImpl value,
          $Res Function(_$HomeStateLivraisonImpl) then) =
      __$$HomeStateLivraisonImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HomeStateLivraisonImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$HomeStateLivraisonImpl>
    implements _$$HomeStateLivraisonImplCopyWith<$Res> {
  __$$HomeStateLivraisonImplCopyWithImpl(_$HomeStateLivraisonImpl _value,
      $Res Function(_$HomeStateLivraisonImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$HomeStateLivraisonImpl implements HomeStateLivraison {
  const _$HomeStateLivraisonImpl();

  @override
  String toString() {
    return 'HomeEvent.homeStateLivraison()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HomeStateLivraisonImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error) error,
    required TResult Function() userData,
    required TResult Function(dynamic index) setIndex,
    required TResult Function(dynamic index) setIndexHistory,
    required TResult Function(CategoryModel category) selectCategory,
    required TResult Function(List<CategoryModel> categoryList)
        updateListCategory,
    required TResult Function() getCategoryList,
    required TResult Function() openLivraisonModal,
    required TResult Function() homeStateLivraison,
    required TResult Function(int idLivraison) findLivraisonById,
  }) {
    return homeStateLivraison();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function()? userData,
    TResult? Function(dynamic index)? setIndex,
    TResult? Function(dynamic index)? setIndexHistory,
    TResult? Function(CategoryModel category)? selectCategory,
    TResult? Function(List<CategoryModel> categoryList)? updateListCategory,
    TResult? Function()? getCategoryList,
    TResult? Function()? openLivraisonModal,
    TResult? Function()? homeStateLivraison,
    TResult? Function(int idLivraison)? findLivraisonById,
  }) {
    return homeStateLivraison?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function()? userData,
    TResult Function(dynamic index)? setIndex,
    TResult Function(dynamic index)? setIndexHistory,
    TResult Function(CategoryModel category)? selectCategory,
    TResult Function(List<CategoryModel> categoryList)? updateListCategory,
    TResult Function()? getCategoryList,
    TResult Function()? openLivraisonModal,
    TResult Function()? homeStateLivraison,
    TResult Function(int idLivraison)? findLivraisonById,
    required TResult orElse(),
  }) {
    if (homeStateLivraison != null) {
      return homeStateLivraison();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ErrorEvent value) error,
    required TResult Function(UserDataEvent value) userData,
    required TResult Function(SetIndexEvent value) setIndex,
    required TResult Function(SetIndexHistoryEvent value) setIndexHistory,
    required TResult Function(SelectCategory value) selectCategory,
    required TResult Function(UpdateListCategory value) updateListCategory,
    required TResult Function(GetCategoryList value) getCategoryList,
    required TResult Function(OpenLivraisonModal value) openLivraisonModal,
    required TResult Function(HomeStateLivraison value) homeStateLivraison,
    required TResult Function(FindLivraisonById value) findLivraisonById,
  }) {
    return homeStateLivraison(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorEvent value)? error,
    TResult? Function(UserDataEvent value)? userData,
    TResult? Function(SetIndexEvent value)? setIndex,
    TResult? Function(SetIndexHistoryEvent value)? setIndexHistory,
    TResult? Function(SelectCategory value)? selectCategory,
    TResult? Function(UpdateListCategory value)? updateListCategory,
    TResult? Function(GetCategoryList value)? getCategoryList,
    TResult? Function(OpenLivraisonModal value)? openLivraisonModal,
    TResult? Function(HomeStateLivraison value)? homeStateLivraison,
    TResult? Function(FindLivraisonById value)? findLivraisonById,
  }) {
    return homeStateLivraison?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorEvent value)? error,
    TResult Function(UserDataEvent value)? userData,
    TResult Function(SetIndexEvent value)? setIndex,
    TResult Function(SetIndexHistoryEvent value)? setIndexHistory,
    TResult Function(SelectCategory value)? selectCategory,
    TResult Function(UpdateListCategory value)? updateListCategory,
    TResult Function(GetCategoryList value)? getCategoryList,
    TResult Function(OpenLivraisonModal value)? openLivraisonModal,
    TResult Function(HomeStateLivraison value)? homeStateLivraison,
    TResult Function(FindLivraisonById value)? findLivraisonById,
    required TResult orElse(),
  }) {
    if (homeStateLivraison != null) {
      return homeStateLivraison(this);
    }
    return orElse();
  }
}

abstract class HomeStateLivraison implements HomeEvent {
  const factory HomeStateLivraison() = _$HomeStateLivraisonImpl;
}

/// @nodoc
abstract class _$$FindLivraisonByIdImplCopyWith<$Res> {
  factory _$$FindLivraisonByIdImplCopyWith(_$FindLivraisonByIdImpl value,
          $Res Function(_$FindLivraisonByIdImpl) then) =
      __$$FindLivraisonByIdImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int idLivraison});
}

/// @nodoc
class __$$FindLivraisonByIdImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$FindLivraisonByIdImpl>
    implements _$$FindLivraisonByIdImplCopyWith<$Res> {
  __$$FindLivraisonByIdImplCopyWithImpl(_$FindLivraisonByIdImpl _value,
      $Res Function(_$FindLivraisonByIdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idLivraison = null,
  }) {
    return _then(_$FindLivraisonByIdImpl(
      idLivraison: null == idLivraison
          ? _value.idLivraison
          : idLivraison // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FindLivraisonByIdImpl implements FindLivraisonById {
  const _$FindLivraisonByIdImpl({required this.idLivraison});

  @override
  final int idLivraison;

  @override
  String toString() {
    return 'HomeEvent.findLivraisonById(idLivraison: $idLivraison)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FindLivraisonByIdImpl &&
            (identical(other.idLivraison, idLivraison) ||
                other.idLivraison == idLivraison));
  }

  @override
  int get hashCode => Object.hash(runtimeType, idLivraison);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FindLivraisonByIdImplCopyWith<_$FindLivraisonByIdImpl> get copyWith =>
      __$$FindLivraisonByIdImplCopyWithImpl<_$FindLivraisonByIdImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error) error,
    required TResult Function() userData,
    required TResult Function(dynamic index) setIndex,
    required TResult Function(dynamic index) setIndexHistory,
    required TResult Function(CategoryModel category) selectCategory,
    required TResult Function(List<CategoryModel> categoryList)
        updateListCategory,
    required TResult Function() getCategoryList,
    required TResult Function() openLivraisonModal,
    required TResult Function() homeStateLivraison,
    required TResult Function(int idLivraison) findLivraisonById,
  }) {
    return findLivraisonById(idLivraison);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function()? userData,
    TResult? Function(dynamic index)? setIndex,
    TResult? Function(dynamic index)? setIndexHistory,
    TResult? Function(CategoryModel category)? selectCategory,
    TResult? Function(List<CategoryModel> categoryList)? updateListCategory,
    TResult? Function()? getCategoryList,
    TResult? Function()? openLivraisonModal,
    TResult? Function()? homeStateLivraison,
    TResult? Function(int idLivraison)? findLivraisonById,
  }) {
    return findLivraisonById?.call(idLivraison);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function()? userData,
    TResult Function(dynamic index)? setIndex,
    TResult Function(dynamic index)? setIndexHistory,
    TResult Function(CategoryModel category)? selectCategory,
    TResult Function(List<CategoryModel> categoryList)? updateListCategory,
    TResult Function()? getCategoryList,
    TResult Function()? openLivraisonModal,
    TResult Function()? homeStateLivraison,
    TResult Function(int idLivraison)? findLivraisonById,
    required TResult orElse(),
  }) {
    if (findLivraisonById != null) {
      return findLivraisonById(idLivraison);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ErrorEvent value) error,
    required TResult Function(UserDataEvent value) userData,
    required TResult Function(SetIndexEvent value) setIndex,
    required TResult Function(SetIndexHistoryEvent value) setIndexHistory,
    required TResult Function(SelectCategory value) selectCategory,
    required TResult Function(UpdateListCategory value) updateListCategory,
    required TResult Function(GetCategoryList value) getCategoryList,
    required TResult Function(OpenLivraisonModal value) openLivraisonModal,
    required TResult Function(HomeStateLivraison value) homeStateLivraison,
    required TResult Function(FindLivraisonById value) findLivraisonById,
  }) {
    return findLivraisonById(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorEvent value)? error,
    TResult? Function(UserDataEvent value)? userData,
    TResult? Function(SetIndexEvent value)? setIndex,
    TResult? Function(SetIndexHistoryEvent value)? setIndexHistory,
    TResult? Function(SelectCategory value)? selectCategory,
    TResult? Function(UpdateListCategory value)? updateListCategory,
    TResult? Function(GetCategoryList value)? getCategoryList,
    TResult? Function(OpenLivraisonModal value)? openLivraisonModal,
    TResult? Function(HomeStateLivraison value)? homeStateLivraison,
    TResult? Function(FindLivraisonById value)? findLivraisonById,
  }) {
    return findLivraisonById?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorEvent value)? error,
    TResult Function(UserDataEvent value)? userData,
    TResult Function(SetIndexEvent value)? setIndex,
    TResult Function(SetIndexHistoryEvent value)? setIndexHistory,
    TResult Function(SelectCategory value)? selectCategory,
    TResult Function(UpdateListCategory value)? updateListCategory,
    TResult Function(GetCategoryList value)? getCategoryList,
    TResult Function(OpenLivraisonModal value)? openLivraisonModal,
    TResult Function(HomeStateLivraison value)? homeStateLivraison,
    TResult Function(FindLivraisonById value)? findLivraisonById,
    required TResult orElse(),
  }) {
    if (findLivraisonById != null) {
      return findLivraisonById(this);
    }
    return orElse();
  }
}

abstract class FindLivraisonById implements HomeEvent {
  const factory FindLivraisonById({required final int idLivraison}) =
      _$FindLivraisonByIdImpl;

  int get idLivraison;
  @JsonKey(ignore: true)
  _$$FindLivraisonByIdImplCopyWith<_$FindLivraisonByIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HomeState {
  User? get user => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;
  int get indexHistory => throw _privateConstructorUsedError;
  int? get isLoadedLivraison => throw _privateConstructorUsedError;
  int? get service_id => throw _privateConstructorUsedError;
  bool? get recupMailStatus => throw _privateConstructorUsedError;
  List<LivraisonUserHomeModel>? get userHomeLivraisonList =>
      throw _privateConstructorUsedError;
  dynamic get livraison => throw _privateConstructorUsedError;
  bool? get noOpen => throw _privateConstructorUsedError;
  int get isLoadedHomeStateLivraison => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {User? user,
      int index,
      int indexHistory,
      int? isLoadedLivraison,
      int? service_id,
      bool? recupMailStatus,
      List<LivraisonUserHomeModel>? userHomeLivraisonList,
      dynamic livraison,
      bool? noOpen,
      int isLoadedHomeStateLivraison});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? index = null,
    Object? indexHistory = null,
    Object? isLoadedLivraison = freezed,
    Object? service_id = freezed,
    Object? recupMailStatus = freezed,
    Object? userHomeLivraisonList = freezed,
    Object? livraison = freezed,
    Object? noOpen = freezed,
    Object? isLoadedHomeStateLivraison = null,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      indexHistory: null == indexHistory
          ? _value.indexHistory
          : indexHistory // ignore: cast_nullable_to_non_nullable
              as int,
      isLoadedLivraison: freezed == isLoadedLivraison
          ? _value.isLoadedLivraison
          : isLoadedLivraison // ignore: cast_nullable_to_non_nullable
              as int?,
      service_id: freezed == service_id
          ? _value.service_id
          : service_id // ignore: cast_nullable_to_non_nullable
              as int?,
      recupMailStatus: freezed == recupMailStatus
          ? _value.recupMailStatus
          : recupMailStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
      userHomeLivraisonList: freezed == userHomeLivraisonList
          ? _value.userHomeLivraisonList
          : userHomeLivraisonList // ignore: cast_nullable_to_non_nullable
              as List<LivraisonUserHomeModel>?,
      livraison: freezed == livraison
          ? _value.livraison
          : livraison // ignore: cast_nullable_to_non_nullable
              as dynamic,
      noOpen: freezed == noOpen
          ? _value.noOpen
          : noOpen // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLoadedHomeStateLivraison: null == isLoadedHomeStateLivraison
          ? _value.isLoadedHomeStateLivraison
          : isLoadedHomeStateLivraison // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {User? user,
      int index,
      int indexHistory,
      int? isLoadedLivraison,
      int? service_id,
      bool? recupMailStatus,
      List<LivraisonUserHomeModel>? userHomeLivraisonList,
      dynamic livraison,
      bool? noOpen,
      int isLoadedHomeStateLivraison});
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? index = null,
    Object? indexHistory = null,
    Object? isLoadedLivraison = freezed,
    Object? service_id = freezed,
    Object? recupMailStatus = freezed,
    Object? userHomeLivraisonList = freezed,
    Object? livraison = freezed,
    Object? noOpen = freezed,
    Object? isLoadedHomeStateLivraison = null,
  }) {
    return _then(_$HomeStateImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      indexHistory: null == indexHistory
          ? _value.indexHistory
          : indexHistory // ignore: cast_nullable_to_non_nullable
              as int,
      isLoadedLivraison: freezed == isLoadedLivraison
          ? _value.isLoadedLivraison
          : isLoadedLivraison // ignore: cast_nullable_to_non_nullable
              as int?,
      service_id: freezed == service_id
          ? _value.service_id
          : service_id // ignore: cast_nullable_to_non_nullable
              as int?,
      recupMailStatus: freezed == recupMailStatus
          ? _value.recupMailStatus
          : recupMailStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
      userHomeLivraisonList: freezed == userHomeLivraisonList
          ? _value._userHomeLivraisonList
          : userHomeLivraisonList // ignore: cast_nullable_to_non_nullable
              as List<LivraisonUserHomeModel>?,
      livraison: freezed == livraison
          ? _value.livraison
          : livraison // ignore: cast_nullable_to_non_nullable
              as dynamic,
      noOpen: freezed == noOpen
          ? _value.noOpen
          : noOpen // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLoadedHomeStateLivraison: null == isLoadedHomeStateLivraison
          ? _value.isLoadedHomeStateLivraison
          : isLoadedHomeStateLivraison // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl(
      {required this.user,
      required this.index,
      required this.indexHistory,
      required this.isLoadedLivraison,
      required this.service_id,
      required this.recupMailStatus,
      final List<LivraisonUserHomeModel>? userHomeLivraisonList,
      this.livraison,
      required this.noOpen,
      required this.isLoadedHomeStateLivraison})
      : _userHomeLivraisonList = userHomeLivraisonList;

  @override
  final User? user;
  @override
  final int index;
  @override
  final int indexHistory;
  @override
  final int? isLoadedLivraison;
  @override
  final int? service_id;
  @override
  final bool? recupMailStatus;
  final List<LivraisonUserHomeModel>? _userHomeLivraisonList;
  @override
  List<LivraisonUserHomeModel>? get userHomeLivraisonList {
    final value = _userHomeLivraisonList;
    if (value == null) return null;
    if (_userHomeLivraisonList is EqualUnmodifiableListView)
      return _userHomeLivraisonList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final dynamic livraison;
  @override
  final bool? noOpen;
  @override
  final int isLoadedHomeStateLivraison;

  @override
  String toString() {
    return 'HomeState(user: $user, index: $index, indexHistory: $indexHistory, isLoadedLivraison: $isLoadedLivraison, service_id: $service_id, recupMailStatus: $recupMailStatus, userHomeLivraisonList: $userHomeLivraisonList, livraison: $livraison, noOpen: $noOpen, isLoadedHomeStateLivraison: $isLoadedHomeStateLivraison)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.indexHistory, indexHistory) ||
                other.indexHistory == indexHistory) &&
            (identical(other.isLoadedLivraison, isLoadedLivraison) ||
                other.isLoadedLivraison == isLoadedLivraison) &&
            (identical(other.service_id, service_id) ||
                other.service_id == service_id) &&
            (identical(other.recupMailStatus, recupMailStatus) ||
                other.recupMailStatus == recupMailStatus) &&
            const DeepCollectionEquality()
                .equals(other._userHomeLivraisonList, _userHomeLivraisonList) &&
            const DeepCollectionEquality().equals(other.livraison, livraison) &&
            (identical(other.noOpen, noOpen) || other.noOpen == noOpen) &&
            (identical(other.isLoadedHomeStateLivraison,
                    isLoadedHomeStateLivraison) ||
                other.isLoadedHomeStateLivraison ==
                    isLoadedHomeStateLivraison));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      user,
      index,
      indexHistory,
      isLoadedLivraison,
      service_id,
      recupMailStatus,
      const DeepCollectionEquality().hash(_userHomeLivraisonList),
      const DeepCollectionEquality().hash(livraison),
      noOpen,
      isLoadedHomeStateLivraison);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {required final User? user,
      required final int index,
      required final int indexHistory,
      required final int? isLoadedLivraison,
      required final int? service_id,
      required final bool? recupMailStatus,
      final List<LivraisonUserHomeModel>? userHomeLivraisonList,
      final dynamic livraison,
      required final bool? noOpen,
      required final int isLoadedHomeStateLivraison}) = _$HomeStateImpl;

  @override
  User? get user;
  @override
  int get index;
  @override
  int get indexHistory;
  @override
  int? get isLoadedLivraison;
  @override
  int? get service_id;
  @override
  bool? get recupMailStatus;
  @override
  List<LivraisonUserHomeModel>? get userHomeLivraisonList;
  @override
  dynamic get livraison;
  @override
  bool? get noOpen;
  @override
  int get isLoadedHomeStateLivraison;
  @override
  @JsonKey(ignore: true)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
