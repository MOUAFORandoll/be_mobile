import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
 
@immutable
abstract class UserEvent extends Equatable {
  const UserEvent();
  
  @override
  List<Object> get props => [];
}

class ErrorEvent extends UserEvent {
  final String error;

  ErrorEvent(this.error);
}

class SignInEvent extends UserEvent {
  final String phone;
  final String password;

  SignInEvent({required this.phone, required this.password});

  @override
  List<Object> get props => [phone, password];
}

class RegisterEvent extends UserEvent {
  final String name;
  final String phone;
  final String password;
  final String re_password;

  RegisterEvent(
      {required this.name,
      required this.phone,
      required this.password,
      required this.re_password});

  @override
  List<Object> get props => [name, password, phone, re_password];
}

class SignOutEvent extends UserEvent {}

class GetDataBateEvent extends UserEvent {}

class CheckUserIsConnectedEvent extends UserEvent {}

class GetUserDBEvent extends UserEvent {}
