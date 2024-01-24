// part of 'user_bloc.dart';
// // ignore_for_file: must_be_immutable

// import 'package:BananaExpress/utils/datebase.dart'; 
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:flutter/material.dart';

// @freezed
// class UserState with _$UserState {
//   UserState();
//   const factory UserState.initial() = _Initial;
// }

// // ignore: must_be_immutable
// class InitialDataState extends UserState {
//   final formKey = new GlobalKey<FormState>();
//   final formKeyReg = new GlobalKey<FormState>();
//   int isLoading = 0;
//   InitialDataState({this.isLoading = 0});
//   List<Object> get props => [formKey, formKeyReg, isLoading];
// }

// // class GetDataBateState extends InitialDataState {
// //   final DataBaseController database;

// //   GetDataBateState({required this.database});

// //   @override
// //   List<Object> get props => [database];
// // }
// class AuthenticationFailed extends InitialDataState {
//   final String message;
//   AuthenticationFailed({required this.message});
// }

// class UnAuthenticated extends InitialDataState {}

// class CheckingUserState extends InitialDataState {}

// class LoginIngUser extends InitialDataState {}

// class LoginIngFailed extends InitialDataState {
//   final String message;
//   LoginIngFailed({required this.message});
// }

// class Authenticated extends InitialDataState {
//   // final User user;
//   // Authenticated(this.user);
// }

// // class RegisteringUser extends UserState {}

// // class RegisterFailed extends UserState {
// //   final String message;

// //   RegisterFailed({required this.message});
// // }

// // class SendingResetPasswordMail extends UserState {}

// // class ResetPasswordEmailSent extends UserState {}

// // class ResetPasswordEmailFailed extends UserState {
// //   final String message;

// //   ResetPasswordEmailFailed({required this.message});
// // }
