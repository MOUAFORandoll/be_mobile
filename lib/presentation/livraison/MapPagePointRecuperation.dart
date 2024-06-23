import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:BabanaExpress/presentation/components/Widget/ShimmerBox.dart';
import 'package:BabanaExpress/presentation/components/Widget/app_bar_custom.dart';
import 'package:BabanaExpress/utils/Services/validators.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/utils/constants/assets.dart';

import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';

@RoutePage()
class MapPagePointRecuperation extends StatefulWidget {
  const MapPagePointRecuperation({super.key});
  static const routeName = '/livraison/recuperation';
  @override
  State<MapPagePointRecuperation> createState() =>
      _MapPagePointRecuperationState();
}

class _MapPagePointRecuperationState extends State<MapPagePointRecuperation> {
  late Marker _position;
  TextEditingController searchPointRecuperationController =
      TextEditingController();
  TextEditingController libelleLocalisation = TextEditingController();
  TextEditingController quartier = TextEditingController();

  var loadPlaceInfo = true;
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
    // libelleLocalisation.text = state.mapPlaceInfo!.ville;
    quartier.text = state.mapPlaceInfo!.quartier;

    setState(() {
      quartier.text = state.mapPlaceInfo!.quartier;
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

      // libelleLocalisation.text = state.mapPlaceInfo!.ville;
      quartier.text = state.mapPlaceInfo!.quartier;

      print('-------------');
      print('Updated _kLake: $_kLake');
      print('Updated _position: $_position');
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
                                'yrecup'.tr(),
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
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              AppButton(
                                  size: MainAxisSize.max,
                                  // loading: _userState.isLoading,
                                  // bgColor: ColorsApp.primary,
                                  text: 'Valider'.tr(),
                                  onTap: () async {
                                    context.read<LivraisonBloc>().add(
                                        MapValidatePoint(
                                            libelle: libelleLocalisation.text,
                                            quartier: quartier.text));

                                    AutoRouter.of(context).pop();
                                    // AutoRouter.of(context)
                                    //     .pushNamed(NewLivraisonPage.routeName);
                                  }),
                            ]),
                      )
                    ]))));
  }

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LivraisonBloc, LivraisonState>(
      listener: (context, state) {
        if (state.isLoadingPlaceSearchInfo == 0) {
          EasyLoading.show(
              dismissOnTap: true,
              status: 'En cours',
              maskType: EasyLoadingMaskType.black);
        } else if (state.isLoadingPlaceSearchInfo == 1) {
          FocusScope.of(context).unfocus();
          EasyLoading.dismiss();
          // showSuccess('Trouve', context);
          selectPoint(state, state.findedPlaceInfo!);
        } else if (state.isLoadingPlaceSearchInfo == 2) {
          showError('Error', context);

          EasyLoading.dismiss();
          print('-----44--------*********');
        }
        if (state.loadingMapPlaceInfo == 1) {
          libelleLocalisation.text = '';
          quartier.text = state.mapPlaceInfo!.quartier;
        }
      },
      builder: (context, state) => Scaffold(
        appBar: AppBarCustom(
          title: 'Selectionner un point de recuperation'.tr(),
        ),
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
                    onMapCreated: (GoogleMapController mapcontroller) async {
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
                          infoWindow: InfoWindow(
                            title: 'Vous etes ici',
                          ),
                          onTap: () {},
                          position: LatLng(state.position!.latitude,
                              state.position!.longitude),
                        );
                        mapController!.animateCamera(
                            CameraUpdate.newCameraPosition(_kLake));

                        print('Camera animation executed');
                        setState(() {
                          libelleLocalisation.text = state.mapPlaceInfo!.ville;
                          quartier.text = state.mapPlaceInfo!.quartier;
                        });
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
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 5),
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
                                              child:
                                                  Text('yemptyrecupliv'.tr())))
                                      : SingleChildScrollView(
                                          child: Container(
                                            width: getWidth(context) * .88,
                                            child: ListView.builder(
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount: state
                                                    .list_search_place!.length,
                                                itemBuilder:
                                                    (_, index) => InkWell(
                                                          onTap: () {
                                                            context
                                                                    .read<
                                                                        LivraisonBloc>()
                                                                    .add(GetPlaceData(
                                                                        place: state
                                                                            .list_search_place![index]))
                                                                /*    .then((e) {
                                                      selectPoint(
                                                          state,
                                                          state.list_search_place![
                                                              index]);
                                                    }) */
                                                                ;
                                                          },
                                                          child: Container(
                                                            margin:
                                                                EdgeInsets.all(
                                                                    8),
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
              child: Column(
                children: [
                  Container(
                    // height: getHeight(context) * .15,
                    padding: EdgeInsets.symmetric(vertical: kMarginY * 1.2),
                    margin: EdgeInsets.symmetric(
                        horizontal: kMarginX, vertical: kMarginY / 2),
                    decoration: BoxDecoration(
                        color: ColorsApp.white,
                        boxShadow: [
                          BoxShadow(
                            color: ColorsApp.primary.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(8)),
                    child: state.loadingMapPlaceInfo == 0
                        ? Container(
                            height: getHeight(context) / 10,
                            child: Center(
                                child: CircularProgressIndicator(
                              color: ColorsApp.primary,
                            )))
                        : state.loadingMapPlaceInfo == 2
                            ? InkWell(
                                onTap: () => context
                                    .read<LivraisonBloc>()
                                    .add(GetMapPlaceInfo()),
                                child: Container(
                                    height: getHeight(context) / 10,
                                    child: Center(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.warning,
                                          color: ColorsApp.red,
                                          size: 25,
                                        ),
                                        Text(
                                          'Appuyer pour Reessayer',
                                          style: TextStyle(
                                            color: ColorsApp.red,
                                          ),
                                        )
                                      ],
                                    ))),
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                    Container(
                                        margin: EdgeInsets.symmetric(
                                          horizontal: kMarginX,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: CachedNetworkImage(
                                          height: getHeight(context) / 10,
                                          width: getHeight(context) / 10,
                                          fit: BoxFit.cover,
                                          imageUrl:
                                              'livraison.colis[0].images[0].src',
                                          imageBuilder:
                                              (context, imageProvider) {
                                            return Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                image: DecorationImage(
                                                    image: imageProvider,
                                                    fit: BoxFit.cover,
                                                    colorFilter:
                                                        ColorFilter.mode(
                                                            Colors.transparent,
                                                            BlendMode
                                                                .colorBurn)),
                                              ),
                                            );
                                          },
                                          placeholder: (context, url) {
                                            return ShimmerBox();
                                          },
                                          errorWidget: (context, url, error) {
                                            return Container(
                                              // height: getHeight(context) / 10,
                                              // width: getHeight(context) / 10,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                    Assets.login,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        )),
                                    Container(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: getWidth(context) * .53,
                                          child: Text(
                                              state.mapPlaceInfo!.quartier,
                                              maxLines: 2,
                                              // overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: ColorsApp.primary,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700)),
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: kMarginY),
                                          width: getWidth(context) * .53,
                                          child: Text(state.mapPlaceInfo!.ville,
                                              maxLines: 2,
                                              // overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700)),
                                        ),
                                      ],
                                    )),
                                  ]),
                  ),
                  AppButton(
                    size: MainAxisSize.max,
                    bgColor: ColorsApp.primary,
                    text: 'yvalid'.tr(),
                    onTap: () async {
                      validatePoint();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
