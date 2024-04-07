part of 'compte_bloc.dart';

@freezed
class CompteEvent with _$CompteEvent {
  const factory CompteEvent.started() = _Started;
  const factory CompteEvent.historiqueTransaction() = HistoriqueTransaction;

  const factory CompteEvent.creditCompte() = CreditCompte; 
  const factory CompteEvent.retraitCompte() = RetraitCompte;
}
