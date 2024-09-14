import 'dart:async';

import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:BabanaExpress/presentation/components/Widget/delivry_widget_title.dart';
import 'package:BabanaExpress/presentation/components/Widget/global_bottom_sheet.dart';
import 'package:BabanaExpress/utils/Services/validators.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

@RoutePage()
class InfoLivraisonType2Page extends StatefulWidget {
  static const routeName = '/infolivraison/type2';
  InfoLivraisonType2Page({super.key});

  @override
  State<InfoLivraisonType2Page> createState() => _InfoLivraisonType2PageState();
}

class _InfoLivraisonType2PageState extends State<InfoLivraisonType2Page> {
  late Marker _position;
  TextEditingController searchPointController = TextEditingController();

  var loadPlaceInfoRecuperation = true;
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

  close() {
    setState(() {
      searchPointController.clear();
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

  searchPoint() => GlobalBottomSheet.show(
      maxHeight: getHeight(context) * .9,
      context: context,
      title: 'yrecup'.tr(),
      subtitle: 'Rechercher votre lieux de livraison'.tr(),
      widget: BlocBuilder<LivraisonBloc, LivraisonState>(
          builder: (context, state) => Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: kMarginX) / 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Color.fromARGB(255, 231, 229, 229),
                        ),
                        color: ColorsApp.white,
                      ),
                      child: TextField(
                        controller: searchPointController,
                        onChanged: (String value) {
                          print('---------**-**-${value}');
                          if (value.isNotEmpty) {
                            context
                                .read<LivraisonBloc>()
                                .add(OnAutoComplet(text: value));
                          }
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          suffixIcon: InkWell(
                              child: Icon(
                                  searchPointController.text.isEmpty
                                      ? Icons.search
                                      : Icons.close,
                                  color: searchPointController.text.isEmpty
                                      ? ThemeApp.second
                                      : ColorsApp.red),
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
                    if (state.isLoadingPlaceSearch != null)
                      (state.isLoadingPlaceSearch! == 0)
                          ? Container(

                              // decoration: BoxDecoration(
                              //   borderRadius: BorderRadius.circular(5),
                              //   border: Border.all(
                              //     color: Color.fromARGB(255, 231, 229, 229),
                              //   ),
                              //   color: ColorsApp.white,
                              // ),
                              alignment: Alignment.center,
                              child: Center(
                                  child: CircularProgressIndicator(
                                color: ColorsApp.primary,
                              )))
                          : (state.isLoadingPlaceSearch! == 2)
                              ? Container()
                              : Container(
                                  // height: state.list_search_place!.length < 5
                                  //     ? getHeight(context) * .15
                                  //     : getHeight(context) * .3,
                                  // width: getWidth(context) * .88,
                                  // decoration: BoxDecoration(
                                  //   borderRadius: BorderRadius.circular(5),
                                  //   border: Border.all(
                                  //     color: Color.fromARGB(255, 231, 229, 229),
                                  //   ),
                                  //   color: ColorsApp.white,
                                  // ),
                                  child: state.list_search_place!.length == 0
                                      ? Container(
                                          height: getHeight(context) / 10,
                                          child: Center(
                                              child:
                                                  Text('yemptyrecupliv'.tr())))
                                      : SingleChildScrollView(
                                          child: Container(
                                              margin: EdgeInsets.only(
                                                  top: kMarginY * 2),
                                              height: getHeight(context) * .73,
                                              child: ListView.builder(
                                                  shrinkWrap: true,
                                                  itemCount: state
                                                      .list_search_place!
                                                      .length,
                                                  itemBuilder:
                                                      (_, index) => InkWell(
                                                            onTap: () {
                                                              context
                                                                  .read<
                                                                      LivraisonBloc>()
                                                                  .add(GetPlaceDataRecuperation(
                                                                      place: state
                                                                              .list_search_place![
                                                                          index]));
                                                            },
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .all(8),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Container(
                                                                        width: getWidth(context) *
                                                                            .65,
                                                                        child:
                                                                            Text(
                                                                          state
                                                                              .list_search_place![index]
                                                                              .libelle,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Container(
                                                                      child: Icon(
                                                                          Icons
                                                                              .location_on)),
                                                                ],
                                                              ),
                                                            ),
                                                          ))),
                                        ),
                                ),
                  ],
                ),
              )));
  var _userPosition;
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  void _onCameraMove(CameraPosition position) {
    // Méthode appelée lorsque la carte est déplacée

    setState(() {
      _userPosition = position.target;
    });
    print(
        'Camera position: ${_userPosition.latitude}, ${_userPosition.longitude}');
    // Vous pouvez appeler votre méthode ici
  }

  void _onMapMoved() {
    // Implémentez ici la logique à exécuter lorsque la carte bouge
    // Exemple: Mettez à jour la position de l'utilisateur ou autre
    print(
        'La carte a bougé. Nouvelle position : ${_userPosition.latitude}, ${_userPosition.longitude}');

    context.read<LivraisonBloc>().add(LoadPlaceInfoLivraison(
        latLng: new LatLng(_userPosition.latitude, _userPosition.longitude)));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LivraisonBloc, LivraisonState>(
        listener: (context, state) {
      if (state.isLoadingPlaceSearchInfo == 0) {
        // AutoRouter.of(context).pop();
      }
      if (state.isLoadingPlaceSearchInfo == 1) {
        setState(() {
          print('-----------------------changement.*******----------------');
          _kLake = CameraPosition(
              bearing: 0,
              target: LatLng(state.selected_livraison_point!.latitude,
                  state.selected_livraison_point!.longitude),
              tilt: 45,
              zoom: 15.5);
          print(
              '--------mapController---------------changement.*******----------------');
          mapController!.animateCamera(CameraUpdate.newCameraPosition(_kLake));
        });
      }
    }, builder: (context, state) {
      return Scaffold(
        backgroundColor: ColorsApp.bg,
        // appBar: AppBarCustom(
        //   title: 'Point de récupération'.tr(),
        // ),
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
                  onCameraIdle: _onMapMoved,
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
                    context.read<LivraisonBloc>().add(LoadPlaceInfoLivraison(
                        latLng: new LatLng(state.position!.latitude,
                            state.position!.longitude)));
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
                    context.read<LivraisonBloc>().add(LoadPlaceInfoLivraison(
                        latLng: new LatLng(state.position!.latitude,
                            state.position!.longitude)));
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
            top: 40,
            child: Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: kMarginX) / 2,
                    // alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => AutoRouter.of(context).pop(),
                          child: Container(
                            margin:
                                EdgeInsets.symmetric(horizontal: kMarginX / 2),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: Color.fromARGB(255, 231, 229, 229),
                              ),
                              color: ThemeApp.second,
                            ),
                            alignment: Alignment.center,
                            child: Icon(Icons.arrow_back_ios_new,
                                color: ColorsApp.white, size: kSmIcon * .7),
                          ),
                        ),
                        InkWell(
                          onTap: () => searchPoint(),
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: Color.fromARGB(255, 231, 229, 229),
                                ),
                                color: ColorsApp.white,
                              ),
                              width: getWidth(context) * .83,
                              height: getHeight(context) * .05,
                              alignment: Alignment.center,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                        left: kMarginX,
                                      ),
                                      child: Text(
                                        'Appuyer pour rechercher',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: ColorsApp.grey,
                                        ),
                                      ),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(
                                          right: kMarginX,
                                        ),
                                        child: Icon(
                                          Icons.search,
                                          color: ColorsApp.grey,
                                        ))
                                  ])),
                        ),
                      ],
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
              top: 380,
              left: 150,
              child: (state.isLoadEmplacementInfo == 0 ||
                      state.selected_livraison_point == null)
                  ? Skeletonizer(
                      enabled: true,
                      child: Container(
                          height: 68,
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Douala, Cameroon',
                                style: TextStyle(
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          )),
                    )
                  : Container(
                      height: 68,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.selected_livraison_point!.quartier,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text(
                            state.selected_livraison_point!.ville,
                          ),
                        ],
                      ),
                    ),
            ),
          ]),
          DraggableScrollableSheet(
            initialChildSize: 0.351,
            minChildSize: 0.35,
            maxChildSize: 0.5,
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: kMarginY),
                        decoration: BoxDecoration(
                          color: ThemeApp.second,
                          borderRadius: BorderRadius.circular(20),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.black26,
                          //     blurRadius: 10,
                          //     offset: Offset(0, -5),
                          //   ),
                          // ],
                        ),
                        height: 13,
                        width: 70,
                        alignment: Alignment.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: DelivryWidgetTitle(
                          title: 'Information de livraison',
                          icon: FontAwesomeIcons.locationDot,
                        ),
                      ),
                      InkWell(
                        onTap: () => searchPoint(),
                        child: (state.isLoadEmplacementInfo == 0 ||
                                state.selected_livraison_point == null)
                            ? Skeletonizer(
                                enabled: true,
                                child: Container(
                                  width: getWidth(context),
                                  padding: EdgeInsets.all(8),
                                  margin: EdgeInsets.only(
                                    top: 0,
                                  ).add(
                                    EdgeInsets.symmetric(horizontal: kMarginX),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(
                                          'Douala-Douala Douala-Douala',
                                          style: TextStyle(
                                            color: ColorsApp.white,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          'Douala-Douala',
                                          style: TextStyle(
                                            color: ColorsApp.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : Container(
                                width: getWidth(context),
                                padding: EdgeInsets.all(8),
                                margin: EdgeInsets.only(
                                  top: 0,
                                ).add(
                                  EdgeInsets.symmetric(horizontal: kMarginX),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        child: Text(
                                      state.selected_livraison_point!.quartier,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: kBasics * 1.3),
                                    )),
                                    Container(
                                        child: Text(
                                      state.selected_livraison_point!.ville,
                                      style: TextStyle(),
                                    )),
                                  ],
                                ),
                              ),
                      ),
                      Container(
                        // margin: EdgeInsets.only(top: kMarginY),
                        child: AppInput(
                          controller: state.contactRecepteur!,
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
                        // margin: EdgeInsets.only(top: kMarginY),
                        child: AppButtonSecond(

                            // loading: _userState.isLoading,
                            bgColor: ThemeApp.second,
                            text: 'Valider'.tr(),
                            marginAdd:
                                EdgeInsets.symmetric(horizontal: kMarginX),
                            onTap: () async {
                              // context.read<LivraisonBloc>().add(
                              //     MapValidatePoint(
                              //         libelle: state
                              //             .libelleLocalisationRecuperation.text,
                              //         quartier:
                              //             state.quartierRecuperation.text));

                              // Navigator.of(context).pop(true);
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
