import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class HomeState extends Equatable {
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class InitialDataState extends HomeState {
  final int index;
  InitialDataState({this.index = 0, this.user});

  List<Object> get props => [user, index];

  var user;
}
