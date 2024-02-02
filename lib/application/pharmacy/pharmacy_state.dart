part of 'pharmacy_bloc.dart';

@freezed
class PharmacyState with _$PharmacyState {
  const factory PharmacyState({
    int? isLoading,
  }) = _PharmacyState;

  factory PharmacyState.initial() => PharmacyState(
        isLoading: 0,
      );
}
