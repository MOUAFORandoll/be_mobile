import 'package:objectbox/objectbox.dart';

abstract class DatabaseState {}

class DatabaseInitialState extends DatabaseState {}

class DatabaseLoadingState extends DatabaseState {}

class DatabaseInitializedState extends DatabaseState {
  final Store store;

  DatabaseInitializedState({required this.store});
}

class DatabaseErrorState extends DatabaseState {
  final String error;

  DatabaseErrorState({required this.error});
}
