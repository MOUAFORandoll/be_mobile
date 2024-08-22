import 'dart:async';

import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:BabanaExpress/application/model/exportmodel.dart';
import 'package:BabanaExpress/core.dart';
import 'package:BabanaExpress/presentation/components/Widget/app_dropdown.dart';
import 'package:BabanaExpress/presentation/components/Widget/delivry_widget_title.dart';
import 'package:BabanaExpress/presentation/components/Widget/global_bottom_sheet.dart';
import 'package:BabanaExpress/utils/Services/validators.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

import '../MapPagePointRecuperation.dart';

@RoutePage()
class InfoLIvraisonType1Page extends StatefulWidget {
  static const routeName = '/infolivraison/type1';
  InfoLIvraisonType1Page({super.key});

  @override
  State<InfoLIvraisonType1Page> createState() => _InfoLIvraisonType1PageState();
}

class _InfoLIvraisonType1PageState extends State<InfoLIvraisonType1Page> {
  late Marker _position;
  TextEditingController searchPointRecuperationController =
      TextEditingController();

  var loadPlaceInfo = true;
  var latitude = 0.0;
  var longitude = 0.0;
  var _kLake;
  initState() {
    setState(() {
      _kLake = CameraPosition(
          bearing: 0,
          target: LatLng(latitude, longitude),
          tilt: 45,
          zoom: 15.5);
    });
    print('-------${longitude}------${latitude}');
    super.initState();
    _position = Marker(
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
        markerId: MarkerId('1'),
        draggable: true,
        infoWindow: InfoWindow(
          title: 'Vous etes ici',
        ),
        onTap: () {},
        position: LatLng(latitude, longitude));
    context.read<LivraisonBloc>().add(GetMapPlaceInfo());
  }

  GoogleMapController? mapController;

  bool isOpen = false;
  opening() {
    setState(() {
      isOpen = true;
    });
  }

  close() {
    setState(() {
      isOpen = false;
    });
  }

  selectPoint(LivraisonState state, value) {
    print('-------000------');
    print(value);
    // state.setPositionRecuperation(LatLng(value.latitude, value.longitude));
    context
        .read<LivraisonBloc>()
        .add(SetLogLat(latLng: LatLng(value.latitude, value.longitude)));

    print('-------000------');

    print('-----1----------------');

    setState(() {
      _kLake = CameraPosition(
        bearing: 0,
        target: LatLng(value.latitude, value.longitude),
        tilt: 50,
        zoom: 18.5,
      );

      _position = Marker(
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
          markerId: MarkerId('1'),
          draggable: true,
          infoWindow: InfoWindow(
            title: 'Vous etes ici',
          ),
          onTap: () {},
          position: LatLng(value.latitude, value.longitude));
      mapController!.animateCamera(CameraUpdate.newCameraPosition(_kLake));
      context.read<LivraisonBloc>().add(GetMapPlaceInfo());
      print('Camera animation executed');

      // state.libelleLocalisationRecuperation.text = state.mapPlaceInfo!.ville;

      print('-------------');
      print('Updated _kLake: $_kLake');
      print('Updated _position: $_position');
    });

    close();
  }

  validatePoint() => GlobalBottomSheet.show(
      maxHeight: getHeight(context) * .5,
      context: context,
      title: 'yrecup'.tr(),
      subtitle: 'Valider les informations de votre point de recuperation'.tr(),
      widget: BlocBuilder<LivraisonBloc, LivraisonState>(
          builder: (context, state) =>
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Container(
                  child: SingleChildScrollView(
                      child: Column(children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: kMarginY * 1.5,
                      ),
                      child: AppInputNew(
                        controller: state.libelleLocalisationRecuperation,
                        icon: Icon(Icons.label),
                        label: 'yLibellePl'.tr(),
                        validator: (value) {
                          return Validators.isValidUsername(value!);
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: kMarginY * 1.5,
                      ),
                      child: AppInputNew(
                        controller: state.quartierRecuperation,
                        icon: Icon(Icons.label),
                        label: 'yQuartierPl'.tr(),
                        validator: (value) {
                          return Validators.isValidUsername(value!);
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: kMarginY * 1.5,
                      ),
                      width: getWidth(context) * .8,
                      child: Text(
                        'Ville de : ${state.mapPlaceInfo!.ville}',
                        style: TextStyle(overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: kMarginY * 1.5,
                      ),
                      width: getWidth(context) * .8,
                      child: Text(
                        'Longitude : ${state.position!.longitude}',
                        style: TextStyle(overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: kMarginY * 1.5,
                      ),
                      width: getWidth(context) * .8,
                      child: Text(
                        'Latitude : ${state.position!.latitude}',
                        style: TextStyle(overflow: TextOverflow.ellipsis),
                      ),
                    )
                  ])),
                ),
                Container(
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    AppButton(
                        size: MainAxisSize.max,
                        // loading: _userState.isLoading,
                        // bgColor: ColorsApp.primary,
                        text: 'Valider'.tr(),
                        onTap: () async {
                          context.read<LivraisonBloc>().add(MapValidatePoint(
                              libelle:
                                  state.libelleLocalisationRecuperation.text,
                              quartier: state.quartierRecuperation.text));

                          Navigator.of(context).pop(true);
                          AutoRouter.of(context).pop();
                          // AutoRouter.of(context)
                          //     .pushNamed(NewLivraisonPage.routeName);
                        }),
                  ]),
                )
              ])));

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  void _onCameraMove(CameraPosition position) {
    // Méthode appelée lorsque la carte est déplacée
    print(
        "Camera position: ${position.target.latitude}, ${position.target.longitude}");
    // Vous pouvez appeler votre méthode ici
    _onMapMoved(position.target);
  }

  void _onMapMoved(LatLng position) {
    // Implémentez ici la logique à exécuter lorsque la carte bouge
    // Exemple: Mettez à jour la position de l'utilisateur ou autre
    print(
        "La carte a bougé. Nouvelle position : ${position.latitude}, ${position.longitude}");
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LivraisonBloc, LivraisonState>(
        builder: (context, state) {
      return Scaffold(
        backgroundColor: ColorsApp.bg,
        appBar: AppBarCustom(
          title: 'Point de récupération'.tr(),
        ),
        body: Stack(children: [
          Container(
              height: getHeight(context) * .95,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                color: ColorsApp.white,
              ),
              child: GoogleMap(
                  initialCameraPosition: _kLake,
                  myLocationEnabled:
                      true, // Active la localisation de l'utilisateur
                  myLocationButtonEnabled:
                      false, // Bouton pour centrer sur la position actuelle
                  compassEnabled: false, // Boussole
                  mapToolbarEnabled: false, // Barre d'outils de la carte
                  indoorViewEnabled: true, // Vue intérieure des bâtiments
                  trafficEnabled: true, // Trafic en temps réel
                  buildingsEnabled: true, // Affiche les bâtiments en 3D
                  onCameraMove: _onCameraMove,
                  tiltGesturesEnabled:
                      true, // Active le contrôle de l'inclinaison
                  zoomGesturesEnabled: true, // Active le contrôle du zoom
                  rotateGesturesEnabled:
                      true, // Active le contrôle de la rotation
                  scrollGesturesEnabled: true, // Active le défilement
                  mapType: MapType
                      .normal, // Type de carte (peut être normal, satellite, terrain ou hybride)
                  // markers: {_position},
                  // compassEnabled: true,
                  onMapCreated: (GoogleMapController mapcontroller) async {
                    _controller.complete(mapcontroller);
                    mapController = await _controller.future;

                    setState(() {
                      _kLake = CameraPosition(
                        bearing: 0,
                        target: LatLng(state.position!.latitude,
                            state.position!.longitude),
                        tilt: 50,
                        zoom: 15.5,
                      );

                      _position = Marker(
                        icon: BitmapDescriptor.defaultMarkerWithHue(
                            BitmapDescriptor.hueCyan),
                        markerId: MarkerId('1'),
                        draggable: true,
                        infoWindow: InfoWindow(
                          title: 'Vous etes ici',
                        ),
                        onTap: () {},
                        position: LatLng(state.position!.latitude,
                            state.position!.longitude),
                      );
                      mapController!.animateCamera(
                          CameraUpdate.newCameraPosition(_kLake));

                      print('-------------');
                      print('Updated _kLake: $_kLake');
                      print('Updated _position: $_position');
                    });
                  },
                  onTap: (LatLng value) {
                    print(value);
                    context.read<LivraisonBloc>().add(SetLogLat(latLng: value));
                    context.read<LivraisonBloc>().add(GetMapPlaceInfo());

                    setState(() {
                      _position = Marker(
                          icon: BitmapDescriptor.defaultMarkerWithHue(
                              BitmapDescriptor.hueCyan),
                          markerId: MarkerId('1'),
                          draggable: true,
                          infoWindow: InfoWindow(
                            title: 'Vous etes ici',
                          ),
                          onTap: () {},
                          position: LatLng(value.latitude, value.longitude));
                    });
                  })),
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Container(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Color.fromARGB(255, 231, 229, 229),
                            ),
                            color: ColorsApp.white,
                          ),
                          // height: getHeight(context) / 15,
                          width: getWidth(context) * .88,
                          child: TextField(
                            controller: searchPointRecuperationController,
                            onChanged: (String value) {
                              print('---------**-**-${value}');
                              if (value.isNotEmpty) {
                                opening();
                                context
                                    .read<LivraisonBloc>()
                                    .add(OnAutoComplet(text: value));
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 5),
                              prefixIcon:
                                  Icon(Icons.search, color: ColorsApp.second),
                              suffixIcon: InkWell(
                                  child: Icon(Icons.close,
                                      color: ColorsApp.second),
                                  onTap: () {
                                    close();
                                    FocusScope.of(context).unfocus();
                                  }),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.zero,
                              ),
                              prefixStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 5,
                  ),
                  if (state.isLoadingPlaceSearch != null && isOpen)
                    (state.isLoadingPlaceSearch! == 0)
                        ? Container(
                            height: getHeight(context) * .15,
                            width: getWidth(context) * .88,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Color.fromARGB(255, 231, 229, 229),
                              ),
                              color: ColorsApp.white,
                            ),
                            child: Center(
                                child: CircularProgressIndicator(
                              color: ColorsApp.primary,
                            )))
                        : (state.isLoadingPlaceSearch! == 2)
                            ? Container()
                            : Container(
                                height: state.list_search_place!.length < 5
                                    ? getHeight(context) * .15
                                    : getHeight(context) * .3,
                                width: getWidth(context) * .88,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: Color.fromARGB(255, 231, 229, 229),
                                  ),
                                  color: ColorsApp.white,
                                ),
                                child: state.list_search_place!.length == 0
                                    ? Container(
                                        height: getHeight(context) / 10,
                                        child: Center(
                                            child: Text('yemptyrecupliv'.tr())))
                                    : SingleChildScrollView(
                                        child: Container(
                                          width: getWidth(context) * .88,
                                          child: ListView.builder(
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: state
                                                  .list_search_place!.length,
                                              itemBuilder: (_, index) =>
                                                  InkWell(
                                                    onTap: () {
                                                      context
                                                              .read<
                                                                  LivraisonBloc>()
                                                              .add(GetPlaceData(
                                                                  place: state
                                                                          .list_search_place![
                                                                      index]))
                                                          /*    .then((e) {
                                                      selectPoint(
                                                          state,
                                                          state.list_search_place![
                                                              index]);
                                                    }) */
                                                          ;
                                                    },
                                                    child: Container(
                                                      margin: EdgeInsets.all(8),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Container(
                                                                width: getWidth(
                                                                        context) *
                                                                    .65,
                                                                child: Text(
                                                                  state
                                                                      .list_search_place![
                                                                          index]
                                                                      .libelle,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Container(
                                                              child: Icon(Icons
                                                                  .location_on)),
                                                        ],
                                                      ),
                                                    ),
                                                  )),
                                        ),
                                      ),
                              ),
                ],
              ),
            ),
          ),
          Stack(children: [
            Center(
              child: Icon(
                Icons.location_pin,
                size: 50,
                color: Colors.red,
              ),
            ),
            Positioned(
              top: 330,
              left: 150,
              child: Container(
                height: 68,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Douala 5e,',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Douala, Cameroon',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
          DraggableScrollableSheet(
            initialChildSize: 0.33,
            minChildSize: 0.3,
            maxChildSize: 0.7,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, -5),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: DelivryWidgetTitle(
                          title: 'Information de recuperation',
                          icon: FontAwesomeIcons.locationDot,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: kMarginY * 1.5,
                        ),
                        child: AppInput(
                          controller: state.contactEmetteur!,
                          icon: Icon(Icons.phone),
                          textInputType: TextInputType.number,
                          placeholder: 'yycontact'.tr(),
                          onChanged: (value) {},
                          validator: (value) {
                            return Validators.usPhoneValid(value!);
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: kMarginY),
                        child: AppButtonSecond(
                            size: MainAxisSize.max,
                            // loading: _userState.isLoading,
                            bgColor: ColorsApp.second,
                            text: 'Valider'.tr(),
                            onTap: () async {
                              context.read<LivraisonBloc>().add(
                                  MapValidatePoint(
                                      libelle: state
                                          .libelleLocalisationRecuperation.text,
                                      quartier:
                                          state.quartierRecuperation.text));

                              Navigator.of(context).pop(true);
                              AutoRouter.of(context).pop();
                              // AutoRouter.of(context)
                              //     .pushNamed(NewLivraisonPage.routeName);
                            }),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ]),
      );
    });
  }
}
