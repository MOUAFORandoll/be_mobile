part of 'callcenter_bloc.dart';

@freezed
class CallcenterEvent with _$CallcenterEvent {
  const factory CallcenterEvent.started() = _Started;
  const factory CallcenterEvent.getMessage() = GetMessage;
  const factory CallcenterEvent.newMessage() = NewMessage;
}
