 
part of 'database_cubit.dart';

@freezed
class DatabaseState with _$DatabaseState {
  const factory DatabaseState.initial() = DatabaseInitialState;
  const factory DatabaseState.loading() = DatabaseLoadingState;
  const factory DatabaseState.initialized({required Store store}) = DatabaseInitializedState;
  const factory DatabaseState.error({required String error}) = DatabaseErrorState;
}
