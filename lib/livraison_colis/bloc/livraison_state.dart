part of 'livraison_bloc.dart';

mixin LivraisonState on Equatable {}

class InitialLivraisonState extends CubitSuccessState with LivraisonState {
  const InitialLivraisonState() : super();
  @override
  List<Object?> get props => [];
}

class LivraisonNotLoggedState extends CubitSuccessState with LivraisonState {
  const LivraisonNotLoggedState() : super();
  @override
  List<Object?> get props => [];
}

class LivraisonLoadingState extends CubitLoadingState with LivraisonState {
  const LivraisonLoadingState() : super();
}

class LivraisonErrorState extends CubitErrorState with LivraisonState {
  LivraisonErrorState(super.error, [super.trace]);
}

class LivraisonSuccessState extends CubitInformationState with LivraisonState {
  const LivraisonSuccessState();
}

// Ajoutez d'autres états selon vos besoins
