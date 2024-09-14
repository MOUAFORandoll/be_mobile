import 'dart:async';

import 'package:BabanaExpress/application/model/exportmodel.dart';
import 'package:BabanaExpress/presentation/components/Button/uploadImage.dart';
import 'package:BabanaExpress/presentation/components/Widget/app_dropdown.dart';
import 'package:BabanaExpress/presentation/components/Widget/app_input_contact.dart';
import 'package:BabanaExpress/presentation/components/Widget/app_input_second.dart';
import 'package:BabanaExpress/presentation/components/Widget/delivry_widget_title.dart';
import 'package:BabanaExpress/presentation/components/Widget/file_option.dart';
import 'package:BabanaExpress/presentation/components/Widget/global_bottom_sheet.dart';
import 'package:BabanaExpress/presentation/components/Widget/imageComp.dart';
import 'package:BabanaExpress/utils/Services/ContactService.dart';
import 'package:BabanaExpress/utils/Services/validators.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:contacts_service/contacts_service.dart';

@RoutePage()
class InfoColisType1Page extends StatefulWidget {
  static const routeName = '/infocolis/type1';

  @override
  State<InfoColisType1Page> createState() => _InfoColisType1PageState();
}

class _InfoColisType1PageState extends State<InfoColisType1Page> {
  late Marker _position;
  TextEditingController searchPointRecuperationController =
      TextEditingController();

  var loadPlaceInfoLivraison = true;
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
      searchPointRecuperationController.clear();
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
      title: 'ylivraison'.tr(),
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
                        controller: searchPointRecuperationController,
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
                                  searchPointRecuperationController.text.isEmpty
                                      ? Icons.search
                                      : Icons.close,
                                  color: searchPointRecuperationController
                                          .text.isEmpty
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
            initialChildSize: 0.35,
            minChildSize: 0.3,
            maxChildSize: 0.65,
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
                          title: 'Informations de livraison du colis',
                          icon: FontAwesomeIcons.locationDot,
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(
                            top: 0,
                          ).add(
                            EdgeInsets.symmetric(horizontal: kMarginX),
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () => searchPoint(),
                                  child: (state.isLoadEmplacementInfo == 0 ||
                                          state.selected_livraison_point ==
                                              null)
                                      ? Skeletonizer(
                                          enabled: true,
                                          child: Container(
                                            width: getWidth(context),
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade100,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
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
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade100,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                  child: Text(
                                                state.selected_livraison_point!
                                                    .quartier,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: kBasics * 1.3),
                                              )),
                                              Container(
                                                  child: Text(
                                                state.selected_livraison_point!
                                                    .ville,
                                                style: TextStyle(),
                                              )),
                                            ],
                                          ),
                                        ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: kMarginY,
                                  ),
                                  child: SingleChildScrollView(
                                      child: Column(children: [
                                    state.isLoadVCategory == 0
                                        ? Skeletonizer(
                                            enabled: true,
                                            child: Container(
                                              width: getWidth(context),
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade100,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
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
                                        : state.isLoadVCategory == 2
                                            ? Text('Error')
                                            : AppDropdown<CategoryModel>(
                                                value: state.categoryColis,
                                                title: 'ytypecolis'.tr(),
                                                hint: 'ytypecolis'.tr(),
                                                onChanged:
                                                    (CategoryModel? newValue) {
                                                  context
                                                      .read<LivraisonBloc>()
                                                      .add(SelectedCategory(
                                                          categoryColis:
                                                              newValue!));
                                                },
                                                items:
                                                    state.list_category_colis!,
                                                itemLabelBuilder:
                                                    (CategoryModel value) =>
                                                        value.libelle!,
                                                hasError: state.errorCategory!),
                                    if (state.errorCategory!)
                                      Container(
                                          padding: EdgeInsets.only(
                                            top: kMarginY,
                                          ),
                                          margin: EdgeInsets.only(
                                            left: 10,
                                          ),
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'eselecttype'.tr(),
                                            style: TextStyle(
                                                fontSize: 8,
                                                color: ColorsApp.red),
                                          )),
                                    Container(
                                      margin: EdgeInsets.only(
                                        top: kMarginY * 1.5,
                                      ),
                                      child: AppInputNew(
                                        controller: state.nomColis!,
                                        icon: Icon(Icons.label),
                                        onChanged: (newValue) {
                                          // state.verifyFormColis();
                                        },
                                        label: 'ynomcolis'.tr(),
                                        validator: (value) {
                                          return Validators.isValidUsername(
                                              value!);
                                        },
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        top: kMarginY * 1.5,
                                      ),
                                      child: AppInputContact(
                                        controller: state.contactRecepteur!,
                                        icon: Icon(Icons.phone),
                                        textInputType: TextInputType.number,
                                        // maxLength:13,
                                        label: 'yycontactdest'.tr(),
                                        onTap: () {
                                          ContactService()
                                              .openContactSelectionModal(
                                                  context: context,
                                                  onTap: (Contact contact) {
                                                    state.contactRecepteur!
                                                            .text =
                                                        contact
                                                            .phones!.first.value
                                                            .toString();
                                                    AutoRouter.of(context)
                                                        .pop();

                                                    showSuccessGetContact(
                                                      'Vous avez choisi ${contact.displayName}',
                                                      context,
                                                    );
                                                  });
                                        },
                                        onChanged: (value) {},
                                        validator: (value) {
                                          return Validators.usPhoneValid(
                                              value!);
                                        },
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Column(children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                top: kMarginY * 1.5,
                                              ),
                                              // height: 150,
                                              width: getWidth(context) / 2.5,
                                              child: AppInputNew(
                                                textInputType:
                                                    TextInputType.number,
                                                controller: state.valeurColis!,
                                                icon:
                                                    Icon(Icons.monetization_on),
                                                onChanged: (newValue) {
                                                  // state.verifyFormColis();
                                                },
                                                label: 'yprixcolis'.tr(),
                                                validator: (value) {
                                                  return Validators
                                                      .usNumeriqValid(value!);
                                                },
                                              ),
                                            ),
                                          ]),
                                        ),
                                        Container(
                                          width: getWidth(context) / 2.5,
                                          margin: EdgeInsets.only(
                                            bottom: kMarginY * 1.5,
                                          ),
                                          child: Column(children: [
                                            Container(
                                                padding: EdgeInsets.only(
                                                  top: kMarginY,
                                                ),
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                    'yQuantitecolis'.tr())),
                                            Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: kMarginX),
                                                height:
                                                    getHeight(context) * .05,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    border: Border.all(
                                                        color: (state.errorQte!)
                                                            ? ColorsApp.red
                                                            : ColorsApp.greyNew,
                                                        width: 1),
                                                    color: ColorsApp.greyNew),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    InkWell(
                                                        child:
                                                            Icon(Icons.remove),
                                                        onTap: () {
                                                          context
                                                              .read<
                                                                  LivraisonBloc>()
                                                              .add(ManageQte(
                                                                  state:
                                                                      false));
                                                        }),
                                                    Container(
                                                      // decoration: BoxDecoration(
                                                      //     borderRadius:
                                                      //         BorderRadius.circular(
                                                      //             12),
                                                      //     color: ColorsApp.greyNew),
                                                      width: getWidth(context) /
                                                          5.5,
                                                      // height: 35,
                                                      // alignment: Alignment.center,
                                                      margin: EdgeInsets.only(
                                                        bottom: kMarginY,
                                                      ),
                                                      child: AppInputSecond(
                                                        controller: state
                                                            .quantiteColis!,
                                                        textInputType:
                                                            TextInputType
                                                                .number,
                                                        validator: (value) {
                                                          return Validators
                                                              .usNumeriqValid(
                                                                  value!);
                                                        },
                                                      ),
                                                    ),
                                                    InkWell(
                                                        child: Icon(Icons.add),
                                                        onTap: () {
                                                          context
                                                              .read<
                                                                  LivraisonBloc>()
                                                              .add(ManageQte(
                                                                  state: true));
                                                        })
                                                  ],
                                                )),
                                          ]),
                                        )
                                      ],
                                    ),
                                    if (state.errorQte!)
                                      Container(
                                          padding: EdgeInsets.only(
                                            top: kMarginY,
                                          ),
                                          margin: EdgeInsets.only(
                                            left: 10,
                                          ),
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'eQuantitecolis'.tr(),
                                            style: TextStyle(
                                                fontSize: 8,
                                                color: ColorsApp.red),
                                          )),
                                    Container(
                                        // width: getWidth(context),
                                        child: InkWell(
                                      child: state.imageColis!.length != 0
                                          ? Container(
                                              margin: EdgeInsets.only(
                                                top: kMarginY,
                                              ),
                                              child: ImageComp(
                                                file: state.imageColis![0],
                                              ))
                                          : UploadImage(
                                              color: ColorsApp.primary,
                                              title: 'yphotoColis'.tr(),
                                              icon: Icons.camera_alt),
                                      onTap: () => GlobalBottomSheet.show(
                                          maxHeight: getHeight(context) * .3,
                                          context: context,
                                          title: 'yphotoColisT'.tr(),
                                          widget: BlocBuilder<LivraisonBloc,
                                              LivraisonState>(
                                            builder: (context, state) =>
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        top: kMarginY),
                                                    height:
                                                        getHeight(context) * .2,
                                                    child: GridView.count(
                                                        crossAxisCount:
                                                            2, // Two items per row
                                                        mainAxisSpacing:
                                                            28.0, // Spacing between rows
                                                        crossAxisSpacing:
                                                            28.0, // Spacing between columns
                                                        childAspectRatio: 1,
                                                        children: [
                                                          FileOptionWidget(
                                                              title: 'yGalerie'
                                                                  .tr(),
                                                              icon:
                                                                  FontAwesomeIcons
                                                                      .image,
                                                              onTap: () {
                                                                context
                                                                    .read<
                                                                        LivraisonBloc>()
                                                                    .add(
                                                                        GetImageColisGalerie());
                                                                AutoRouter.of(
                                                                        context)
                                                                    .pop();
                                                              }),
                                                          FileOptionWidget(
                                                            title:
                                                                'yCamera'.tr(),
                                                            onTap: () {
                                                              context
                                                                  .read<
                                                                      LivraisonBloc>()
                                                                  .add(
                                                                      GetImageColisAppareil());
                                                              AutoRouter.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            icon:
                                                                FontAwesomeIcons
                                                                    .cameraRetro,
                                                          ),
                                                        ])),
                                          )),
                                    )),
                                    if (state.errorImage!)
                                      Container(
                                          padding: EdgeInsets.only(
                                            top: kMarginY,
                                          ),
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'ephotoColisT'.tr(),
                                            style: TextStyle(
                                                fontSize: 8,
                                                color: ColorsApp.red),
                                          ))
                                  ])),
                                ),
                              ])),
                      AppButtonSecond(
                          bgColor: ThemeApp.second,
                          marginAdd: EdgeInsets.symmetric(horizontal: kMarginX),
                          disabled: !(state.categoryColis != null &&
                              state.nomColis!.text.length != 0 &&
                              state.contactRecepteur!.text.length != 0 &&
                              state.valeurColis!.text.length != 0 &&
                              state.quantiteColis!.text.length != 0 &&
                              state.selected_livraison_point != null &&
                              state.imageColis!.length != 0),
                          text: 'lbaddprod'.tr(),
                          onTap: () async {
                            context.read<LivraisonBloc>().add(AddColisType1());
                            if (state.isColisOK!) {
                              AutoRouter.of(context).pop();
                            }
                          }),
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
