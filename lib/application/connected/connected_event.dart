part of 'connected_bloc.dart';

@freezed
class ConnectedEvent with _$ConnectedEvent {
  const factory ConnectedEvent.started() = _Started;
  const factory ConnectedEvent.onConnected() = OnConnected;
  const factory ConnectedEvent.onNotConnected() = OnNotConnected;
}
