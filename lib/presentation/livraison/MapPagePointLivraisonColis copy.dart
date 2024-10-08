import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:BabanaExpress/presentation/livraison/NewLivraisonPage.dart';
import 'package:BabanaExpress/utils/Services/validators.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

import 'dart:async';

@RoutePage()
class MapPagePointLivraisonColis extends StatefulWidget {
  static const routeName = '/livraison/point_livraison';
  @override
  State<MapPagePointLivraisonColis> createState() =>
      _MapPagePointLivraisonColisState();
}

class _MapPagePointLivraisonColisState
    extends State<MapPagePointLivraisonColis> {
  late Marker _position;
  TextEditingController searchPointLivraisonController =
      TextEditingController();
  TextEditingController libelleLocalisation = TextEditingController();
  TextEditingController quartier = TextEditingController();

  var latitude = 0.0;
  var longitude = 0.0;
  var _kLake;
  initState() {
    setState(() {
      _kLake = CameraPosition(
          bearing: 0,
          target: LatLng(latitude, longitude),
          tilt: 50,
          zoom: 15.5);
    });
    print('-------${longitude}------${latitude}');
    super.initState();
    _position = Marker(
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
        markerId: MarkerId('1'),
        draggable: true,
        infoWindow: InfoWindow(
          title: 'Ici',
        ),
        onTap: () {},
        position: LatLng(latitude, longitude));
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

    setState(() {
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
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
            markerId: MarkerId('1'),
            draggable: true,
            infoWindow: InfoWindow(
              title: 'Ici',
            ),
            onTap: () {},
            position: LatLng(value.latitude, value.longitude));
        mapController!.animateCamera(CameraUpdate.newCameraPosition(_kLake));

        print('Camera animation executed');

        print('-------------');
        print('Updated _kLake: $_kLake');
        print('Updated _position: $_position');
      });
    });
    close();
  }

  validatePoint() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) => BlocBuilder<LivraisonBloc,
                LivraisonState>(
            builder: (context, state) => Container(
                height: getHeight(context) * .5,
                padding: EdgeInsets.symmetric(horizontal: kMarginX),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  color: ColorsApp.white,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                'yPointlivraison'.tr(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 14),
                              ),
                            ),
                            InkWell(
                                child: Icon(Icons.close),
                                onTap: () => AutoRouter.of(context).pop())
                          ],
                        ),
                      ),
                      Container(
                        child: SingleChildScrollView(
                            child: Column(children: [
                          Container(
                            margin: EdgeInsets.only(
                              top: kMarginY * 1.5,
                            ),
                            child: AppInputNew(
                              controller: libelleLocalisation,
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
                              controller: quartier,
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
                            width: getWith(context) * .8,
                            child: Text(
                              'Longitude : ${state.position!.longitude}',
                              style: TextStyle(overflow: TextOverflow.ellipsis),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: kMarginY * 1.5,
                            ),
                            width: getWith(context) * .8,
                            child: Text(
                              'Latitude : ${state.position!.latitude}',
                              style: TextStyle(overflow: TextOverflow.ellipsis),
                            ),
                          )
                        ])),
                      ),
                      Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              AppButton(
                                  size: MainAxisSize.max,
                                  // loading: _userState.isLoading,
                                  // bgColor: ColorsApp.primary,
                                  text: 'yvalid'.tr(),
                                  onTap: () async {
                                    context.read<LivraisonBloc>().add(
                                        MapValidatePointLivraison(
                                            libelle: libelleLocalisation.text,
                                            quartier: quartier.text));

                                    AutoRouter.of(context)
                                        .pushNamed(NewLivraisonPage.routeName);
                                  }),
                            ]),
                      )
                    ]))));
  }

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LivraisonBloc, LivraisonState>(
        builder: (context, state) => Scaffold(
            appBar: AppBar(
                title: Text('ylivraison'.tr()),
                leading: IconButton(
                  icon: Icon(
                    Icons.keyboard_arrow_left_outlined,
                    color: ColorsApp.primary,
                  ),
                  tooltip: MaterialLocalizations.of(context).backButtonTooltip,
                  onPressed: () {
                    AutoRouter.of(context).pop();
                  },
                ),
                backgroundColor: ColorsApp.white,
                elevation: 0),
            body: Stack(
              children: [
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
                        myLocationEnabled: true,
                        myLocationButtonEnabled: true,
                        markers: {_position},
                        // compassEnabled: true,
                        onMapCreated:
                            (GoogleMapController mapcontroller) async {
                          // _controller.animateCamera(
                          //     CameraUpdate.newCameraPosition(_kLake));
                          _controller.complete(mapcontroller);
                          mapController = await _controller.future;

                          // _controller.future.reactive;

                          print('-------000------');

                          print('-----1----------------');

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
                              infoWindow: InfoWindow(title: 'Ici'),
                              onTap: () {},
                              position: LatLng(state.position!.latitude,
                                  state.position!.longitude),
                            );
                            mapController!.animateCamera(
                                CameraUpdate.newCameraPosition(_kLake));

                            print('Camera animation executed');

                            print('-------------');
                            print('Updated _kLake: $_kLake');
                            print('Updated _position: $_position');
                          });
                        },
                        onTap: (LatLng value) {
                          print(value);
                          context
                              .read<LivraisonBloc>()
                              .add(SetLogLat(latLng: value));

                          setState(() {
                            _position = Marker(
                                icon: BitmapDescriptor.defaultMarkerWithHue(
                                    BitmapDescriptor.hueCyan),
                                markerId: MarkerId('1'),
                                draggable: true,
                                infoWindow: InfoWindow(
                                  title: 'Ici',
                                ),
                                onTap: () {},
                                position:
                                    LatLng(value.latitude, value.longitude));
                          });
                        })),
                Positioned(
                  top: 10,
                  left: 8,
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
                                height: getHeight(context) / 15,
                                width: getWith(context) * .88,
                                child: TextField(
                                  controller: searchPointLivraisonController,
                                  onChanged: (String value) {
                                    if (value.isNotEmpty) {
                                      opening();
                                      context
                                          .read<LivraisonBloc>()
                                          .add(SearchPointEvent(text: value));
                                    }
                                  },
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 5),
                                    prefixIcon: Icon(Icons.search,
                                        color: ColorsApp.second),
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
                        if (isOpen)
                          Container(
                            height:
                                state.list_search_point_localisation!.length < 5
                                    ? getHeight(context) * .15
                                    : getHeight(context) * .3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Color.fromARGB(255, 231, 229, 229),
                              ),
                              color: ColorsApp.white,
                            ),
                            child:
                                state.list_search_point_localisation!.length ==
                                        0
                                    ? Text('yemptypointliv'.tr())
                                    : SingleChildScrollView(
                                        child: Container(
                                          width: getWith(context) * .95,
                                          child: searchPointLivraisonController
                                                  .text.isEmpty
                                              ? ListView.builder(
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  shrinkWrap: true,
                                                  itemCount: state
                                                      .list_localisation_point!
                                                      .length,
                                                  itemBuilder:
                                                      (_, index) => InkWell(
                                                            onTap: () {
                                                              selectPoint(
                                                                  state,
                                                                  state.list_localisation_point![
                                                                      index]);
                                                              // state.setLibelleAndQuartier(
                                                              //     state.list_localisation_point![
                                                              //         index]);
                                                              FocusScope.of(
                                                                      context)
                                                                  .unfocus();
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
                                                                        child: Text(state
                                                                            .list_localisation_point![index]
                                                                            .libelle),
                                                                      ),
                                                                      Container(
                                                                        margin: EdgeInsets.only(
                                                                            left:
                                                                                10),
                                                                        child: Text(state
                                                                            .list_localisation_point![index]
                                                                            .quartier),
                                                                      ),
                                                                      Container(
                                                                        margin: EdgeInsets.only(
                                                                            left:
                                                                                10),
                                                                        child: Text(state
                                                                            .list_localisation_point![index]
                                                                            .ville),
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
                                                          ))
                                              : ListView.builder(
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  shrinkWrap: true,
                                                  itemCount: state
                                                      .list_search_point_localisation!
                                                      .length,
                                                  itemBuilder:
                                                      (_, index) => InkWell(
                                                            onTap: () {
                                                              selectPoint(
                                                                  state,
                                                                  state.list_search_point_localisation![
                                                                      index]);
                                                              // state.setLibelleAndQuartier(
                                                              //     state.list_search_point_localisation![
                                                              //         index]);
                                                              FocusScope.of(
                                                                      context)
                                                                  .unfocus();
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
                                                                        child: Text(state
                                                                            .list_search_point_localisation![index]
                                                                            .libelle),
                                                                      ),
                                                                      Container(
                                                                        margin: EdgeInsets.only(
                                                                            left:
                                                                                10),
                                                                        child: Text(state
                                                                            .list_search_point_localisation![index]
                                                                            .quartier),
                                                                      ),
                                                                      Container(
                                                                        margin: EdgeInsets.only(
                                                                            left:
                                                                                10),
                                                                        child: Text(state
                                                                            .list_search_point_localisation![index]
                                                                            .ville),
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
                                                          )),
                                        ),
                                      ),
                          ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  right: 10,
                  child: AppButton(
                    size: MainAxisSize.max,
                    bgColor: ColorsApp.primary,
                    text: 'yvalid'.tr(),
                    onTap: () async {
                      validatePoint();
                    },
                  ),
                ),
              ],
            )));
  }
}
