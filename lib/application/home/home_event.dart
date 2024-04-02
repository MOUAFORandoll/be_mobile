part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.error({required String error}) = ErrorEvent;

  const factory HomeEvent.userData() = UserDataEvent;

  const factory HomeEvent.setIndex({required dynamic index}) = SetIndexEvent;
  const factory HomeEvent.setIndexHistory({required dynamic index}) =
      SetIndexHistoryEvent;

  const factory HomeEvent.selectCategory({required CategoryModel category}) =
      SelectCategory;

  const factory HomeEvent.updateListCategory(
      {required List<CategoryModel> categoryList}) = UpdateListCategory;

  const factory HomeEvent.getCategoryList() = GetCategoryList;

  const factory HomeEvent.openLivraisonModal() = OpenLivraisonModal;  
}
