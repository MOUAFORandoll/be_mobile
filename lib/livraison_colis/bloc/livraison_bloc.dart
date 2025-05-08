import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:BabanaExpress/application/database/database_cubit.dart';
import 'package:BabanaExpress/application/livraison/repositories/livraisonRepo.dart';
import 'package:BabanaExpress/application/model/data/ConversationColisModel.dart';
import 'package:BabanaExpress/application/model/data/CurrentLivraisonPositionModel.dart';
import 'package:BabanaExpress/application/model/data/LivreurLivraisonPositionModel.dart';
import 'package:BabanaExpress/application/model/data/MapPlaceInfoModel.dart';
import 'package:BabanaExpress/application/model/data/PlaceModel.dart';
import 'package:BabanaExpress/application/model/exportmodel.dart';
import 'package:BabanaExpress/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dio/dio.dart';

import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart' hide PreferencesService;
part 'livraison_state.dart';

class LivraisonCubit extends Cubit<LivraisonState> {
  final LivraisonRepo livraisonRepo;
  final DatabaseCubit database;

  LivraisonCubit({required this.livraisonRepo, required this.database})
      : super(InitialLivraisonState()) {}
 
 

  // Ajoutez d'autres méthodes pour gérer les événements
}
