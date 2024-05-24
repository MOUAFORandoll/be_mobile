import 'package:BabanaExpress/application/callcenter/repositories/callcenterRepo.dart';
import 'package:BabanaExpress/application/database/database_cubit.dart';
import 'package:BabanaExpress/application/model/data/MessageModel.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'callcenter_event.dart';
part 'callcenter_state.dart';
part 'callcenter_bloc.freezed.dart';

class CallCenterBloc extends Bloc<CallCenterEvent, CallCenterState> {
  final CallCenterRepo callcenterRepo;
  final DatabaseCubit database;
  CallCenterBloc({required this.callcenterRepo, required this.database})
      : super(CallCenterState.initial()) {
    on<CallCenterEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetMessage>(getMessage);
    on<NewMessage>(newMessage);
  }

  Future<void> newMessage(
      NewMessage event, Emitter<CallCenterState> emit) async {
    var key = await database.getKey();
    var data = {
      'keySecret': key,
      'message': state.messageText!.text,
      'message_target': state.message_target
    };
    var _pendindMessage = state.messageText!.text;
    emit(state.copyWith(messageText: TextEditingController()));
    emit(state.copyWith(isLoadSend: 0));
    await callcenterRepo.newMessage(data).then((response) {
      print(response.data);

      if (response.data != null) {
        if (response.data['message'] != null) {
          List<MessageModel> saveM = List.from(state.messages as Iterable)
            ..add(MessageModel.fromJson(response.data['message']));
          emit(state.copyWith(isLoadSend: 1, messages: saveM));
          final position =
              state.callcenterSrollController!.position.maxScrollExtent;
          state.callcenterSrollController!.animateTo(
            position + 30,
            duration: Duration(seconds: 1),
            curve: Curves.easeOut,
          );
          emit(
            state.copyWith(
              callcenterSrollController: state.callcenterSrollController,
            ),
          );
          emit(state.copyWith(isLoadSend: 1, messages: saveM));
        } else {
          emit(state.copyWith(
              isLoadSend: 2,
              messageText: TextEditingController(text: _pendindMessage)));
        }
      } else {
        emit(state.copyWith(
            isLoadSend: 2,
            messageText: TextEditingController(text: _pendindMessage)));
      }
      emit(state.copyWith(isLoadSend: null));
    }).onError((e, s) {
      emit(state.copyWith(
          isLoadSend: 2,
          messageText: TextEditingController(text: _pendindMessage)));
    });
  }

  Future<void> getMessage(
      GetMessage event, Emitter<CallCenterState> emit) async {
    emit(state.copyWith(isLoadMessageCallCenter: 0));
    var key = await database.getKey();

    await callcenterRepo.getMessage(key).then((response) {
      print(response.data);
      if (response.data != null) {
        emit(state.copyWith(
            isLoadMessageCallCenter: 1,
            messages: (response.data['data'] as List)
                .map((e) => MessageModel.fromJson(e))
                .toList()));
        final position =
            state.callcenterSrollController!.position.maxScrollExtent;
        state.callcenterSrollController!.animateTo(
          position + 30,
          duration: Duration(seconds: 1),
          curve: Curves.easeOut,
        );
        emit(
          state.copyWith(
            callcenterSrollController: state.callcenterSrollController,
          ),
        );
      } else {
        emit(state.copyWith(isLoadMessageCallCenter: 2));
      }
    }).onError((e, s) {
      emit(state.copyWith(isLoadMessageCallCenter: 2));
    });
  }
}
