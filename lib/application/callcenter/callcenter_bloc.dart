import 'package:BabanaExpress/application/callcenter/repositories/callcenterRepo.dart';
import 'package:BabanaExpress/application/database/database_cubit.dart';
import 'package:BabanaExpress/application/model/data/MessageModel.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'callcenter_event.dart';
part 'callcenter_state.dart';
part 'callcenter_bloc.freezed.dart';

class CallcenterBloc extends Bloc<CallcenterEvent, CallcenterState> {
  final CallcenterRepo callcenterRepo;
  final DatabaseCubit database;
  CallcenterBloc({required this.callcenterRepo, required this.database})
      : super(CallcenterState.initial()) {
    on<CallcenterEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetMessage>(getMessage);
    on<NewMessage>(newMessage);
  }
  
  Future<void> newMessage(
      NewMessage event, Emitter<CallcenterState> emit) async {
    var key = await database.getKey();
    var data = {
      'keySecret': key,
      'message': state.messageText!.text,
      'message_target': state.message_target
    };
    emit(state.copyWith(isLoadSend: 0));
    await callcenterRepo.newMessage(data).then((response) {
      print(response.data);
      if (response.data != null) {
        if (response.data['status'] == 'ok') {
          emit(state.copyWith(isLoadSend: 1));
        } else {
          emit(state.copyWith(isLoadSend: 2));
        }
      } else {
        emit(state.copyWith(isLoadSend: 2));
      }
      emit(state.copyWith(isLoadSend: null));
    }).onError((e, s) {
      emit(state.copyWith(isLoadSend: 2));
    });
  }

  Future<void> getMessage(
      GetMessage event, Emitter<CallcenterState> emit) async {
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
      } else {
        emit(state.copyWith(isLoadMessageCallCenter: 2));
      }
    }).onError((e, s) {
      emit(state.copyWith(isLoadMessageCallCenter: 2));
    });
  }
}
