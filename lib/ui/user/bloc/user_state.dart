import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class InitialDataState extends UserState {
  TextEditingController phone = TextEditingController();
  
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController re_password = TextEditingController();

  final formKey = new GlobalKey<FormState>();
  final formKeyReg = new GlobalKey<FormState>();

  List<Object> get props =>
      [phone, password, formKey, name, re_password, formKeyReg];
}

class GetDataBateState extends InitialDataState {
  final database;

  GetDataBateState({required this.database});

  @override
  List<Object> get props => [database];
}

class AuthenticatedState extends UserState {
  final bool isConnected;

  AuthenticatedState({required this.isConnected});

  @override
  List<Object> get props => [isConnected];
}

class UnauthenticatedState extends UserState {}
