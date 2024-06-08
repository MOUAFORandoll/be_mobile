part of 'callcenter_bloc.dart';

@freezed
class CallCenterEvent with _$CallCenterEvent {
  const factory CallCenterEvent.started() = _Started;
  const factory CallCenterEvent.getMessage() = GetMessage;
  const factory CallCenterEvent.newMessage() = NewMessage;
  const factory CallCenterEvent.targetMessage({MessageModel? message_target}) =
      TargetMessage;
  const factory CallCenterEvent.fileMessage({  int? type}) = FileMessage;
}
