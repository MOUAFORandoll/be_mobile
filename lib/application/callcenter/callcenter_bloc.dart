import 'dart:developer';

import 'package:BabanaExpress/application/callcenter/repositories/callcenterRepo.dart';
import 'package:BabanaExpress/application/database/database_cubit.dart';
import 'package:BabanaExpress/application/model/data/MessageModel.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'callcenter_bloc.freezed.dart';
part 'callcenter_event.dart';
part 'callcenter_state.dart';

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
    on<TargetMessage>(targetMessage);
    on<FilesMessage>(fileMessage);
    on<RemoveFilesMessage>(removeFilesMessage);
    on<DeleteMessage>(deleteMessage);
    on<SetMessageToUpdate>(setMessageToUpdate);
    on<CancelSetMessageToUpdate>(cancelSetMessageToUpdate);
    on<UpdateMessage>(updateMessage);
  }

  removeFilesMessage(
      RemoveFilesMessage event, Emitter<CallCenterState> emit) async {
    List<XFile>? filesMessage = state.filesMessage!;
    int index = filesMessage.indexWhere((element) => element == event.file);
    print('------${index}--------${event.file}------*');

    if (index != -1) {
      List<XFile>? filesMessage = List.from(state.filesMessage as Iterable);
      filesMessage.removeAt(index);
      emit(state.copyWith(
        filesMessage: filesMessage,
      ));
    }
  }

  fileMessage(FilesMessage event, Emitter<CallCenterState> emit) async {
    var data = null;
    switch (event.type) {
      case 0:
        data = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 100,
          maxHeight: 500,
          maxWidth: 500,
        );

        break;
      case 1:
        data = await ImagePicker().pickImage(
          source: ImageSource.camera,
          imageQuality: 100,
          maxHeight: 500,
          maxWidth: 500,
        );

        break;
      case 2:
        data = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['jpg', 'pdf', 'doc'],
        );

        break;
      case 3:
        data = await ImagePicker().pickImage(
          source: ImageSource.camera,
          imageQuality: 100,
          maxHeight: 500,
          maxWidth: 500,
        );

        break;
    }
    List<XFile>? filesMessage = List.from(state.filesMessage as Iterable)
      ..add(data);
    emit(state.copyWith(
        filesMessage: filesMessage,
        typeFile: event.type == 0 || event.type == 1 ? 'image' : 'file'));
  }

  Future<void> targetMessage(
      TargetMessage event, Emitter<CallCenterState> emit) async {
    emit(state.copyWith(message_target: event.message_target));
  }

  Future<void> newMessage(
      NewMessage event, Emitter<CallCenterState> emit) async {
    var key = await database.getKey();
    var data = {
      'typeFile': state.typeFile!,
      'keySecret': key,
      'message': state.messageText!.text,
      'message_target':
          state.message_target != null ? state.message_target!.id : null
    };
    log(data.toString());
    FormData formData = FormData.fromMap(data);
    if (state.filesMessage!.length != 0) {
      for (int i = 0; i < state.filesMessage!.length; i++) {
        var file = state.filesMessage![i];

        var fileKey = 'file${i}';

        formData.files.add(
          MapEntry(
            fileKey,
            await MultipartFile.fromFile(file.path, filename: file.name),
          ),
        );
      }
    }

    var _pendindMessage = state.messageText!.text;
    emit(state.copyWith(messageText: TextEditingController()));
    emit(state.copyWith(
      isLoadSend: 0,
      isToUpdate: false,
      messageSelected: null,
    ));
    await callcenterRepo.newMessage(formData).then((response) {
      print(response.data);

      print('-----------response.data');

      if (response.data != null) {
        emit(state.copyWith(message_target: null));
        if (response.data['message'] != null) {
          List<MessageModel> saveM = List.from(state.messages as Iterable)
            ..add(MessageModel.fromJson(response.data['message']));
          emit(state.copyWith(
              filesMessage: [],
              isLoadSend: 1,
              messages: saveM,
              message_target: null));

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

  Future<void> deleteMessage(
      DeleteMessage event, Emitter<CallCenterState> emit) async {
    emit(state.copyWith(isLoadSend: 0));
    await callcenterRepo.deleteMessage(event.message!.id).then((response) {
      if (response.data != null) {
        if (response.data['message'] != null) {
          MessageModel? messageToUpdate = state.messages?.firstWhere(
            (message) => message.id == event.message!.id,
          );
          print('---------index');

          // Trouver l'index du message à mettre à jour
          int index = state.messages!.indexOf(messageToUpdate!);
          print('---------index');
          print(index);
          if (index != -1) {
            // Mettre à jour le message dans la liste
            List<MessageModel> updatedMessages = List.from(state.messages!);
            updatedMessages[index] = MessageModel.fromJson(response
                .data['message']); // Appliquer les mises à jour nécessaires

            // Ajouter le nouveau message

            // Émettre les nouveaux états
            final newState = state.copyWith(
              messages: updatedMessages,
              filesMessage: [],
              isLoadSend: 1,
              message_target: null,
              isToUpdate: false,
              messageSelected: null,
            );
            emit(newState);
          }
        }
      }

      emit(state.copyWith(isLoadSend: null));
    }).onError((e, s) {
      emit(state.copyWith(
        isLoadSend: 2,
      ));
    });
  }

  Future<void> setMessageToUpdate(
      SetMessageToUpdate event, Emitter<CallCenterState> emit) async {
    emit(state.copyWith(
        isToUpdate: true,
        isLoadSend: 2,
        messageSelected: event.message!,
        messageText: TextEditingController(text: event.message!.message)));
  }

  Future<void> cancelSetMessageToUpdate(
      CancelSetMessageToUpdate event, Emitter<CallCenterState> emit) async {
    emit(state.copyWith(
        isToUpdate: false, messageText: TextEditingController(text: '')));
    emit(state.copyWith(
      isToUpdate: false,
      messageSelected: null,
    ));
  }

  Future<void> updateMessage(
      UpdateMessage event, Emitter<CallCenterState> emit) async {
    var key = await database.getKey();

    var _pendindMessage = state.messageText!.text;
    var data = {
      'keySecret': key,
      'message': state.messageText!.text,
    };
    emit(state.copyWith(isLoadSend: 0));
    await callcenterRepo
        .updateMessage(state.messageSelected!.id, data)
        .then((response) {
      if (response.data != null) {
        if (response.data != null) {
          if (response.data['message'] != null) {
            MessageModel? messageToUpdate = state.messages?.firstWhere(
              (message) => message.id == state.messageSelected!.id,
            );
            print('---------index');

            int index = state.messages!.indexOf(messageToUpdate!);
            print('---------index');
            print(index);
            if (index != -1) {
              List<MessageModel> updatedMessages = List.from(state.messages!);
              updatedMessages[index] =
                  MessageModel.fromJson(response.data['message']);

              final newState = state.copyWith(
                messages: updatedMessages,
                filesMessage: [],
                isLoadSend: 1,
                message_target: null,
                isToUpdate: false,
                messageText: TextEditingController(text: ''),
                messageSelected: null,
              );
              emit(newState);
            }
          }
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
    emit(state.copyWith(
        isToUpdate: false,
        messageSelected: null,
        isLoadMessageCallCenter: 0,
        filesMessage: []));
    var key = await database.getKey();

    await callcenterRepo.getMessage(key).then((response) {
      print(response.data);
      if (response.data != null) {
        if (response.data['data'] != null) {
          emit(state.copyWith(
              isLoadMessageCallCenter: 1,
              message_target: null,
              messages: (response.data['data'] as List)
                  .map((e) => MessageModel.fromJson(e))
                  .toList()));
          // final position =
          //     state.callcenterSrollController!.position.maxScrollExtent;
          // state.callcenterSrollController!.animateTo(
          //   position + 30,
          //   duration: Duration(seconds: 1),
          //   curve: Curves.easeOut,
          // );

          // emit(
          //   state.copyWith(
          //     callcenterSrollController: state.callcenterSrollController,
          //   ),
          // ); margin: EdgeInsets.only(top: kMarginY * 2)
          // .add(EdgeInsets.symmetric(horizontal: kMarginX * 2)),
        } else {
          emit(state.copyWith(isLoadMessageCallCenter: 2));
        }
      }
    }).onError((e, s) {
      emit(state.copyWith(isLoadMessageCallCenter: 2));
    });
  }
}
