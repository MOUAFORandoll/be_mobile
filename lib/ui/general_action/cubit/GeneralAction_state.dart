import 'package:carousel_slider/carousel_controller.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class GeneralActionState {
  static GeneralActionState get initialState => GeneralActionState();
}

// ignore: must_be_immutable
class InitialDataState extends GeneralActionState {
  int index = 0;
  final CarouselController controller = CarouselController();

  List<Object> get props => [index, controller];
}
