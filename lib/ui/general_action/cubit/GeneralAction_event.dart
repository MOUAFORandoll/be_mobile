import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class GeneralActionEvent extends Equatable {}

class WrapperEvent extends GeneralActionEvent {
  final int index;
  WrapperEvent({required this.index});
  @override
  List<Object> get props => [index];
}
