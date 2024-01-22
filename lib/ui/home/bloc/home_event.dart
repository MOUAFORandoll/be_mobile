import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class HomeEvent extends Equatable {}

class ErrorEvent extends HomeEvent {
  final String error;

  ErrorEvent(this.error);

  List<Object?> get props => [];
}

class UserDataEvent extends HomeEvent {
   
  
  List<Object?> get props => [ ];
}

class SetIndexEvent extends HomeEvent {
  final index;

  SetIndexEvent(this.index);

  List<Object?> get props => [];
}
