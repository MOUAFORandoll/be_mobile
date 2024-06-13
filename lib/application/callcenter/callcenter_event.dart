part of 'callcenter_bloc.dart';

@freezed
class CallCenterEvent with _$CallCenterEvent {
  const factory CallCenterEvent.started() = _Started;
  const factory CallCenterEvent.getMessage() = GetMessage;
  const factory CallCenterEvent.newMessage() = NewMessage;
  const factory CallCenterEvent.targetMessage({MessageModel? message_target}) =
      TargetMessage;
  const factory CallCenterEvent.filesMessage({int? type}) = FilesMessage;
  const factory CallCenterEvent.removeFilesMessage({XFile? file}) =
      RemoveFilesMessage;

  const factory CallCenterEvent.deleteMessage({MessageModel? message}) =
      DeleteMessage;
  const factory CallCenterEvent.setMessageToUpdate({MessageModel? message}) =
      SetMessageToUpdate;
  const factory CallCenterEvent.cancelSetMessageToUpdate(
      {MessageModel? message}) = CancelSetMessageToUpdate;
  const factory CallCenterEvent.updateMessage() = UpdateMessage;
}
