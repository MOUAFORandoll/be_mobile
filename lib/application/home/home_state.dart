import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../old/model/exportmodel.dart';

class HomeState extends Equatable {
  final int index;
  final user;
  HomeState({this.index = 0, this.user});

  List<Object> get props => [user, index];
  HomeState copyWith({int? index}) {
    print(index);
    return HomeState(index: index ?? this.index, user: user ?? this.user);
  }
}

class LoadState extends HomeState {}

class ServiceState extends HomeState {
  final categorySelect;
  final bool? isLoadedCat;
  final List<CategoryModel>? categoryList;
  ServiceState({this.isLoadedCat, this.categorySelect, this.categoryList});
  List<Object> get props => [categorySelect];
}

class OpenLivraionModalState extends HomeState {}
