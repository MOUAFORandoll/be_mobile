part of 'callcenter_bloc.dart';

@freezed
class CallCenterState with _$CallCenterState {
  const factory CallCenterState(
      {TextEditingController? messageText,
      int? isLoadMessageCallCenter,
      int? isLoadSend,
      required bool isToUpdate,
      String? typeFile,
      ScrollController? callcenterSrollController,
      MessageModel? message_target,
      MessageModel? messageSelected,
      List<XFile>? filesMessage,
      List<MessageModel>? messages,
      FocusNode? focusNode}) = _CallCenterState;
  factory CallCenterState.initial() => CallCenterState(
        messages: [],
        messageSelected: null,
        isToUpdate: false,
        focusNode: FocusNode(),
        isLoadMessageCallCenter: 0,
        isLoadSend: null,
        typeFile: 'image',
        message_target: null,
        filesMessage: [],
        callcenterSrollController: new ScrollController(),
        messageText: TextEditingController(),
      );
}
