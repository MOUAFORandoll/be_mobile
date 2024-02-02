import 'dart:async';
import 'package:BananaExpress/application/database/database_cubit.dart';

import 'package:BananaExpress/application/pharmacy/repositories/pharmacy_repository.dart';
import 'package:BananaExpress/routes/app_router.gr.dart';

import 'package:BananaExpress/utils/functions/app_loader.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:BananaExpress/presentation/components/exportcomponent.dart';

import '/entity.dart';
import '../export_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
part 'pharmacy_event.dart';
part 'pharmacy_state.dart';
part 'pharmacy_bloc.freezed.dart';

class PharmacyBloc extends Bloc<PharmacyEvent, PharmacyState> {
  final PharmacyRepo pharmacyRepo;
  
  PharmacyBloc({required this.pharmacyRepo })
      : super(PharmacyState.initial()) {}

  var fn = new ViewFunctions();

  @override
  Future<void> close() async {
    await super.close();
  }
}
