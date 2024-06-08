part of 'callcenter_bloc.dart';

@freezed
class CallCenterState with _$CallCenterState {
  const factory CallCenterState({
    TextEditingController? messageText,
    int? isLoadMessageCallCenter,
    int? isLoadSend,
    ScrollController? callcenterSrollController,
    MessageModel? message_target,
    XFile? fileMessage,
    List<MessageModel>? messages,
  }) = _CallCenterState;
  factory CallCenterState.initial() => CallCenterState(
        messages: [],
        isLoadMessageCallCenter: 0,
        isLoadSend: null,
        message_target: null,
        fileMessage: null,
        callcenterSrollController: new ScrollController(),
        messageText: TextEditingController(),
      );
}
