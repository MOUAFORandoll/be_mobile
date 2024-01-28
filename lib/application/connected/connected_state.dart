part of 'connected_bloc.dart';

@freezed
class ConnectedState with _$ConnectedState {
  const factory ConnectedState.initial() = _Initial;
  const factory ConnectedState.connectedSucessState() = ConnectedSucessState;
  const factory ConnectedState.connectedFailureState() = ConnectedFailureState;
}
