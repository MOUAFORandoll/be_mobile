import 'dart:async';
import 'package:BabanaExpress/application/database/database_cubit.dart';
import 'package:BabanaExpress/application/model/data/ModePaiementModel.dart';

import 'package:BabanaExpress/application/user/repositories/user_repository.dart';
import 'package:BabanaExpress/routes/app_router.gr.dart';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
// import 'package:google_sign_in/google_sign_in.dart';

import '/entity.dart';
import '../export_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepo userRepo;
  final DatabaseCubit database;
  UserBloc({required this.userRepo, required this.database})
      : super(UserState.initial()) {
    // on<GetDataBateEvent>((event, emit) async {
    //   print('okkof');
    //   // final database = await DataBaseController.getInstance();
    //   // emit(GetDataBateState(database: database));
    // });
    on<SignInEvent>(_Login);
    on<SignOutEvent>(_OnSignOut);
    on<RegisterEvent>(_Register);
    on<SendCode>(_SendCode);
    on<VerifyCode>(_VerifyCode);
    on<ResetPassword>(_ResetPassword);

    on<GetUserEvent>(_GetUserEvent);
    on<UpdateUserInfo>(_UpdateData);
    on<GetVilleQuartier>(_getVilleQuartier);
    on<UpdateUserImage>(_updateUserProfile);
    on<GetModePaiement>(getModePaiement);
    on<SignInSocialEvent>(signInSocialEvent);
    on<RegisterSocialEvent>(registerSocial);
  }

  signInSocialEvent(SignInSocialEvent event, Emitter<UserState> emit) async {
    // try {
    //   GoogleSignIn _googleSignIn = GoogleSignIn(
    //     serverClientId:
    //         '255400953271-cpqp7fnn2khmcekjuad4858pm91lj55r.apps.googleusercontent.com',
    //     scopes: [
    //       'email',
    //     ],
    //   );

    //   print('-------- ------- ------- ---------**-*-*');

    //   GoogleSignInAccount? googleUser =
    //       await _googleSignIn.signIn().onError((error, stackTrace) {
    //     print('----------------${error}--**-*-*');
    //   });
    //   googleUser!.authentication
    //       .then((value) => print('----------------${value}--**-*-*'))
    //       .onError(
    //           (error, stackTrace) => print('----------------${error}--**-*-*'));

    //   print(googleUser);
    //   print('-------- ------- ------- ---------**-*-*');
    //   print(googleUser.toString());
    //   print('-------- ------- ------- ---------**-*-*');
    //   var data = null;
    //   // if (googleUser.email != null) {
    //   //   data = {
    //   //     'email': googleUser.email,
    //   //   };
    //   // }

    //   if (data == null) {
    //     emit(state.copyWith(
    //         isLoading: 3,
    //         isSocialAuthentification: 3,
    //         authenticationFailedMessage:
    //             'Une erreur est survenue recommencer'));

    //     return 0;
    //   }
    //   emit(state.copyWith(isLoading: 1, isSocialAuthentification: 1));
    //   await userRepo.LoginSocial(data).then((response) async {
    //     if (response.statusCode == 201) {
    //       database.saveKeyKen(response.data);

    //       await userRepo.getUser().then((value) async {
    //         if (value != null) {
    //           print('------------------value----------${value.data}-');
    //           if (value.data['data'] != null) {
    //             emit(state.copyWith(
    //                 isSocialAuthentification: 2,
    //                 isLoading: 2,
    //                 authenticationFailedMessage: ''));
    //             emit(UserState.authenticated());

    //             var _UserSave = User.fromJson(value.data['data']);

    //             await database.saveUser(_UserSave);
    //           }
    //         }
    //       }).catchError((error) {
    //         emit(state.copyWith(
    //             isLoading: 3,
    //             isSocialAuthentification: 3,
    //             authenticationFailedMessage:
    //                 'Une erreur est survenue recommencer'));
    //       });
    //     } else {
    //       emit(state.copyWith(
    //           isSocialAuthentification: 3,
    //           isLoading: 3,
    //           authenticationFailedMessage: response.data['message']));
    //     }
    //   }).onError((error, s) {
    //     emit(state.copyWith(
    //         isSocialAuthentification: 3,
    //         isLoading: 3,
    //         authenticationFailedMessage: 'Phone ou mot de passe incorrect'));
    //   });
    // } catch (e) {}
  }

  registerSocial(RegisterSocialEvent event, Emitter<UserState> emit) async {
    // try {
    //   GoogleSignIn _googleSignIn = GoogleSignIn(
    //     clientId:
    //         '255400953271-cpqp7fnn2khmcekjuad4858pm91lj55r.apps.googleusercontent.com',
    //     scopes: [
    //       'email',
    //     ],
    //   );
    //   GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    //   var data = null;
    //   if (googleUser!.email != null) {
    //     data = {
    //       'email': googleUser.email,
    //       'nom': googleUser.displayName,
    //       'prenom': '',
    //       'isSocialGoogle': true
    //     };
    //   }

    //   if (data == null) {
    //     emit(state.copyWith(
    //         isLoading: 3,
    //         isSocialAuthentification: 3,
    //         authenticationFailedMessage:
    //             'Une erreur est survenue recommencer'));

    //     return 0;
    //   }
    //   emit(state.copyWith(isLoading: 1, isSocialAuthentification: 1));

    //   print(data);
    //   emit(state.copyWith(isLoading: 1));
    //   await userRepo.Login(data).then((response) async {
    //     if (response.statusCode == 201) {
    //       database.saveKeyKen(response.data);

    //       await userRepo.getUser().then((value) async {
    //         if (value != null) {
    //           print('------------------value----------${value.data}-');
    //           if (value.data['data'] != null) {
    //             emit(state.copyWith(
    //                 isLoading: 2, authenticationFailedMessage: ''));
    //             emit(UserState.authenticated());

    //             var _UserSave = User.fromJson(value.data['data']);

    //             await database.saveUser(_UserSave);
    //           }
    //         }
    //       }).catchError((error) {
    //         emit(state.copyWith(
    //             isLoading: 3,
    //             authenticationFailedMessage:
    //                 'Une erreur est survenue recommencer'));
    //       });
    //     } else {
    //       emit(state.copyWith(
    //           isLoading: 3,
    //           authenticationFailedMessage: response.data['message']));
    //     }
    //   }).onError((error, s) {
    //     emit(state.copyWith(
    //         isLoading: 3,
    //         authenticationFailedMessage: 'Phone ou mot de passe incorrect'));
    //   });
    // } catch (e) {}
  }

  Future<void> getModePaiement(
      GetModePaiement event, Emitter<UserState> emit) async {
    emit(state.copyWith(loadModePaiement: 0));

    await userRepo.getModePaiement().then((response) {
      print(response.data);
      if (response.data != null) {
        emit(state.copyWith(
            listModePaiement: (response.data['data'] as List)
                .map((e) => ModePaiementModel.fromJson(e))
                .toList(),
            loadModePaiement: 1));
      } else {
        emit(state.copyWith(loadModePaiement: 2));
      }
    }).onError((e, s) {
      emit(state.copyWith(loadModePaiement: 2));
    });
  }

  Future<void> _getVilleQuartier(
      GetVilleQuartier event, Emitter<UserState> emit) async {
    emit(state.copyWith(isVilleQuartier: 0));
    var position;

    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {}

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.always ||
          permission == LocationPermission.unableToDetermine ||
          permission == LocationPermission.whileInUse) {
        position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
      }
    }
    position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    position = await Geolocator.getCurrentPosition();
    await userRepo
        .getVilleQuartier(position.longitude, position.latitude)
        .then((response) {
      print(response.data);
      if (response.data != null) {
        emit(state.copyWith(
            quartierUser: response.data['quartier'],
            villeUser: response.data['ville'],
            isVilleQuartier: 1));
      } else {
        emit(state.copyWith(isVilleQuartier: 2));
      }
    }).onError((e, s) {
      emit(state.copyWith(isVilleQuartier: 2));
    });
  }

  _OnSignOut(SignOutEvent event, Emitter<UserState> emit) async {
    EasyLoading.show(
        indicator: CircularProgressIndicator(
          color: ColorsApp.second,
        ),
        dismissOnTap: true,
        
        maskType: EasyLoadingMaskType.black);
    await Future.delayed(Duration(seconds: 5), () {
      EasyLoading.dismiss();
      database.disconnect();

      AutoRouter.of(event.context).replaceAll([AuthRoute()]);
    });
  }
  
  _GetUserEvent(GetUserEvent event, Emitter<UserState> emit) async {
    await userRepo.getUser().then((value) async {
      if (value.data['data'] != null) {
        print('------------------saveee----------${value.data}-');
        var _UserSave = User.fromJson(value.data['data']);

        await database.saveUser(_UserSave);
      }
    }).catchError((error) {});
  }

  _UpdateData(UpdateUserInfo event, Emitter<UserState> emit) async {
    var key = await database.getKey();
    var data = Map.from(
        event.data); // Create a new modifiable map from the existing data
    data['keySecret'] = key;

    print(data);

    emit(state.copyWith(updating: true));
    await userRepo.updateUser(data).then((response) async {
      if (response.statusCode == 201) {
        database.saveKeyKen(response.data);

        await userRepo.getUser().then((value) async {
          if (value != null) {
            print('------------------value----------${value.data}-');
            if (value.data['data'] != null) {
              emit(state.copyWith(
                  updating: false,
                  isLoading: 2,
                  authenticationFailedMessage: ''));
              emit(UserState.authenticated());

              var _UserSave = User.fromJson(value.data['data']);

              await database.saveUser(_UserSave);
            }
          }
        }).catchError((error) {
          emit(state.copyWith(
              updating: false,
              isLoading: 3,
              authenticationFailedMessage:
                  'Une erreur est survenue recommencer'));
        });
      } else {
        emit(state.copyWith(
            updating: false,
            isLoading: 3,
            authenticationFailedMessage: response.data['message']));
      }
    }).onError((error, s) {
      // print('----${s}-----');
      // print('------${error}---');
      emit(state.copyWith(
          isLoading: 3,
          authenticationFailedMessage: 'Phone ou mot de passe incorrect'));
    });
  }

  _Login(SignInEvent event, Emitter<UserState> emit) async {
    var data = {
      'phone': event.phone,
      'password': event.password,
    };
    print(data);
    emit(state.copyWith(isLoading: 1));
    await userRepo.Login(data).then((response) async {
      if (response.statusCode == 201) {
        database.saveKeyKen(response.data);

        await userRepo.getUser().then((value) async {
          if (value != null) {
            print('------------------value----------${value.data}-');
            if (value.data['data'] != null) {
              emit(state.copyWith(
                  isLoading: 2, authenticationFailedMessage: ''));
              emit(UserState.authenticated());

              var _UserSave = User.fromJson(value.data['data']);

              await database.saveUser(_UserSave);
            }
          }
        }).catchError((error) {
          emit(state.copyWith(
              isLoading: 3,
              authenticationFailedMessage:
                  'Une erreur est survenue recommencer'));
        });
      } else {
        emit(state.copyWith(
            isLoading: 3,
            authenticationFailedMessage: response.data['message']));
      }
    }).onError((error, s) {
      // print('----${s}-----');
      // print('------${error}---');
      emit(state.copyWith(
          isLoading: 3,
          authenticationFailedMessage: 'Phone ou mot de passe incorrect'));
    });
  }

  _Register(RegisterEvent event, Emitter<UserState> emit) async {
    var data = {
      'phone': int.parse(event.phone),
      'password': event.password,
      'nom': event.name,
      'prenom': event.name,
    };
    print(data);
    emit(state.copyWith(isLoading: 1));
    // emit(UserState.loginIngUser());

    try {
      Response response = await userRepo.SignUp(data);

      if (response.statusCode == 201) {
        database.saveKeyKen(response.data);

        await userRepo.getUser().then((value) async {
          print('------------------value----------${value.data}-');
          if (value.data['data'] != null &&
              value.data['data'] != [] &&
              value.data['data'].length != 0) {
            emit(state.copyWith(isLoading: 2, authenticationFailedMessage: ''));
            emit(UserState.authenticated());

            var _UserSave = User.fromJson(value.data['data']);

            await database.saveUser(_UserSave);
          }
        }).catchError((error) {
          emit(state.copyWith(
              isLoading: 3,
              authenticationFailedMessage:
                  'Une erreur est survenue recommencer'));
        });
      } else {
        emit(state.copyWith(
            isLoading: 3,
            authenticationFailedMessage: response.data['message']));
      }
    } catch (e) {
      emit(state.copyWith(
          isLoading: 3,
          authenticationFailedMessage: 'Une erreur est survenue recommencer'));
    }
  }

  _SendCode(SendCode event, Emitter<UserState> emit) async {
    var data = {
      'data': event.data,
    };
    print(data);
    emit(state.copyWith(
      isLoadingForgot: 1,
      isCode: 0,
      successReset: false,
    ));
    await userRepo.SendCode(data).then((response) async {
      if (response.statusCode == 201) {
        emit(state.copyWith(
          isLoadingForgot: 2,
          isCode: 1,
        ));
      } else {
        emit(state.copyWith(
            isLoadingForgot: 3,
            isCode: 2,
            authenticationFailedMessage: response.data['message']));
      }
    }).onError((error, s) {
      emit(state.copyWith(
          isCode: 2,
          isLoadingForgot: 3,
          authenticationFailedMessage: 'System error'));
    });
  }

  _VerifyCode(VerifyCode event, Emitter<UserState> emit) async {
    var data = {
      'code': event.code,
      'data': event.data,
    };
    print(data);
    emit(state.copyWith(
      isLoadingForgot: 1,
    ));
    await userRepo.VerifyCode(data).then((response) async {
      if (response.statusCode == 201) {
        emit(state.copyWith(
          isLoadingForgot: 2,
          isCorrectCode: 1,
        ));
      } else {
        emit(state.copyWith(
            isLoadingForgot: 3,
            isCorrectCode: 2,
            authenticationFailedMessage: response.data['message']));
      }
    }).onError((error, s) {
      emit(state.copyWith(
          isCorrectCode: 3,
          isLoadingForgot: 3,
          authenticationFailedMessage: 'System error'));
    });
  }

  _ResetPassword(ResetPassword event, Emitter<UserState> emit) async {
    var data = {
      'data': event.data,
      'password': event.password,
    };
    print(data);
    emit(state.copyWith(
      isLoadingForgot: 1,
    ));
    await userRepo.ResetPassword(data).then((response) async {
      if (response.statusCode == 201) {
        database.saveKeyKen(response.data);
        await userRepo.getUser().then((value) async {
          print('------------------value----------${value.data}-');
          if (value.data['data'] != null &&
              value.data['data'] != [] &&
              value.data['data'].length != 0) {
            emit(state.copyWith(
              isLoadingForgot: 2,
              successReset: true,
            ));

            var _UserSave = User.fromJson(value.data['data']);

            await database.saveUser(_UserSave);
          }
        }).catchError((error) {
          emit(state.copyWith(
              isCorrectCode: 3,
              successReset: false,
              isLoadingForgot: 3,
              authenticationFailedMessage: 'System error'));
        });
      } else {
        emit(state.copyWith(
          isLoadingForgot: 3,
          successReset: false,
        ));
      }
    }).onError((error, s) {
      emit(state.copyWith(
          isCorrectCode: 3,
          successReset: false,
          isLoadingForgot: 3,
          authenticationFailedMessage: 'System error'));
    });
  }

  _updateUserProfile(UpdateUserImage event, Emitter<UserState> emit) async {
    try {
      emit(state.copyWith(isUpdateUserImage: 0));
      var key = await database.getKey();
      print('----------***********-----adding');
      var image = await ImagePicker().pickImage(
        source: ImageSource.camera,
        imageQuality: 100,
        maxHeight: 500,
        maxWidth: 500,
      );
      if (image != null) {
        emit(state.copyWith(isUpdateUserImage: 1));
        FormData formData = FormData.fromMap({'keySecret': key});
        formData.files.add(MapEntry(
            'file',
            await MultipartFile.fromFile(
              image.path,
              filename: 'Image.jpg',
            )));
        Response response = await userRepo.updateImageUser(formData);
        print(response.data);
        if (response.statusCode == 201) {
          database.saveKeyKen(response.data);
          await userRepo.getUser().then((value) async {
            print('------------------value----------${value.data}-');
            if (value.data['data'] != null) {
              emit(state.copyWith(isUpdateUserImage: 2));

              var _UserSave = User.fromJson(value.data['data']);

              await database.saveUser(_UserSave);
            }
          }).catchError((error) {
            emit(state.copyWith(
                isLoading: 3,
                authenticationFailedMessage:
                    'Une erreur est survenue recommencer'));
          });
        } else {
          emit(state.copyWith(isUpdateUserImage: 3));
        }
      }
    } catch (e) {
      print('Error getting image: $e');
    }
  }

  Stream<UserState> mapEventToState(UserEvent event) async* {}

  Future<bool> connected() async {
    var isConnected = await database.getUser() != null;

    print('-----isConnected-----***----------${isConnected}');
    return isConnected;
  }

  var fn = new ViewFunctions();

  @override
  Future<void> close() async {
    await super.close();
  }
}
