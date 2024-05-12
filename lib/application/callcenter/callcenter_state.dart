part of 'callcenter_bloc.dart';

@freezed
class CallcenterState with _$CallcenterState {
  const factory CallcenterState({
    TextEditingController? messageText,
    int? isLoadMessageCallCenter,
    int? isLoadSend,
    int? message_target,
    List<MessageModel>? messages,
  }) = _CallcenterState;
  factory CallcenterState.initial() => CallcenterState(
        messages: [],
        isLoadMessageCallCenter: 0,
        isLoadSend: null,
        message_target: null,
        messageText: TextEditingController(),
      );
}
