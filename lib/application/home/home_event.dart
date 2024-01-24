import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../old/model/exportmodel.dart';


@immutable
abstract class HomeEvent extends Equatable {}

class ErrorEvent extends HomeEvent {
  final String error;

  ErrorEvent(this.error);

  List<Object?> get props => [];
}

class UserDataEvent extends HomeEvent {
  List<Object?> get props => [];
}

class SetIndexEvent extends HomeEvent {
  final index;

  SetIndexEvent(this.index);

  List<Object?> get props => [];
}

class SelectCategory extends HomeEvent {
  final CategoryModel category;

  SelectCategory(this.category);

  List<Object?> get props => [];
}

class UpdateListCategory extends HomeEvent {
  final List<CategoryModel> categoryList;

  UpdateListCategory(this.categoryList);

  List<Object?> get props => [];
}

class GetCategoryList extends HomeEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class OpenLivraisonModal extends HomeEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

// class SetIndexEvent extends HomeEvent {
//   final index;

//   SetIndexEvent(this.index);

//   List<Object?> get props => [];
// }
