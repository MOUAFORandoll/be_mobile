import 'package:carousel_slider/carousel_controller.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AppActionState extends Equatable {}

class InitialState extends AppActionState {
  List<Object> get props => [];
}

class OnboardingState extends AppActionState {
  final int? index;
  OnboardingState({this.index = 0});
  final CarouselController controller = CarouselController();

  List<Object> get props => [index!, controller];
}

class ToLoginState extends AppActionState {
  List<Object> get props => [];
}

class ToRegisterState extends AppActionState {
  List<Object> get props => [];
}
 