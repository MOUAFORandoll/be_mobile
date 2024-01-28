import 'package:BananaExpress/old/components/Button/app_button.dart';
import 'package:BananaExpress/old/components/Widget/app_input_new.dart';
import 'package:BananaExpress/old/components/exportcomponent.dart';
import 'package:BananaExpress/old/controller/LivraisonController.dart';
import 'package:BananaExpress/utils/Services/validators.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class MapPagePointLivraisonColis extends StatefulWidget {
  @override
  State<MapPagePointLivraisonColis> createState() =>
      _MapPagePointLivraisonColisState();
}

class _MapPagePointLivraisonColisState
    extends State<MapPagePointLivraisonColis> {
  late Marker _position;
  var livraison = Get.find<LivraisonController>();
  var latitude = 0.0;
  var longitude = 0.0;
  var _kLake;
  initState() {
    latitude = livraison.position.latitude;
    longitude = livraison.position.longitude;
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
    livraison.setClear();
  }

  selectPoint(value) {
    print(value);
    livraison.setPosition(LatLng(value.latitude, value.longitude));

    setState(() {
      _controller.future.reactive;

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
    Get.dialog(AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      title: Text('Votre point de livraison'),
      actions: [
        InkWell(
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ColorsApp.grey),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Text(
                  'Retour',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                ),
                Icon(Icons.close, weight: 50)
              ]),
            ),
            onTap: () => Get.back()),
        InkWell(
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ColorsApp.orange),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Text(
                  'Valider',
                  style: TextStyle(
                      color: ColorsApp.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 13),
                ),
                Icon(Icons.check, color: ColorsApp.white, weight: 50)
              ]),
            ),
            onTap: () {
              Get.back();
              Get.back();
            })
      ],
      content: Container(
        child: SingleChildScrollView(
            child: Column(children: [
          Container(
            margin: EdgeInsets.only(
              top: kMarginY * 1.5,
            ),
            child: AppInputNew(
              controller: livraison.libelleLocalisationColis,
              icon: Icon(Icons.label),
              label: 'Libelle'.tr,
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
              controller: livraison.quartierColis,
              icon: Icon(Icons.label),
              label: 'Quartier'.tr,
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
              'Longitude : ${livraison.latitudeColis}',
              style: TextStyle(overflow: TextOverflow.ellipsis),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: kMarginY * 1.5,
            ),
            width: getWith(context) * .8,
            child: Text(
              'Latitude : ${livraison.longitudeColis}',
              style: TextStyle(overflow: TextOverflow.ellipsis),
            ),
          )
        ])),
      ),
    ));
  }

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LivraisonController>(
        builder: (controller) => Scaffold(
            appBar: AppBar(
                title: Text('Selectionner un point de livraison'.tr),
                leading: IconButton(
                  icon: Icon(
                    Icons.keyboard_arrow_left_outlined,
                    color: ColorsApp.primary,
                  ),
                  tooltip: MaterialLocalizations.of(context).backButtonTooltip,
                  onPressed: () {
                    Get.back();
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

                          _controller.future.reactive;

                          print('-------000------');

                          print('-----1----------------');

                          setState(() {
                            _kLake = CameraPosition(
                              bearing: 0,
                              target: LatLng(controller.position.latitude,
                                  controller.position.longitude),
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
                              position: LatLng(controller.position.latitude,
                                  controller.position.longitude),
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
                          controller.setPosition(value);
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
                                width: getWith(context) * .95,
                                child: TextField(
                                  controller: controller.searchController,
                                  onChanged: (String value) {
                                    if (value.isNotEmpty) {
                                      opening();
                                      controller.searchPointLivraison();
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
                            height: controller.search_livraison_point.length < 5
                                ? getHeight(context) * .15
                                : getHeight(context) * .3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Color.fromARGB(255, 231, 229, 229),
                              ),
                              color: ColorsApp.white,
                            ),
                            child: controller.search_livraison_point.length == 0
                                ? Text('Aucun point de livraison trouve')
                                : SingleChildScrollView(
                                    child: Container(
                                      width: getWith(context) * .95,
                                      child: controller
                                              .searchController.text.isEmpty
                                          ? ListView.builder(
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: controller
                                                  .livraison_point.length,
                                              itemBuilder: (_, index) =>
                                                  InkWell(
                                                    onTap: () {
                                                      selectPoint(controller
                                                              .livraison_point[
                                                          index]);
                                                      livraison.setPositionLabel(
                                                          controller
                                                              .livraison_point[
                                                                  index]
                                                              .libelle);

                                                      controller
                                                          .setLibelleAndQuartierColis(
                                                              controller
                                                                      .livraison_point[
                                                                  index]);
                                                      FocusScope.of(context)
                                                          .unfocus();
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
                                                                child: Text(controller
                                                                    .livraison_point[
                                                                        index]
                                                                    .libelle),
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            10),
                                                                child: Text(controller
                                                                    .livraison_point[
                                                                        index]
                                                                    .quartier),
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            10),
                                                                child: Text(controller
                                                                    .livraison_point[
                                                                        index]
                                                                    .ville),
                                                              ),
                                                            ],
                                                          ),
                                                          Container(
                                                              child: Icon(Icons
                                                                  .location_on)),
                                                        ],
                                                      ),
                                                    ),
                                                  ))
                                          : ListView.builder(
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: controller
                                                  .search_livraison_point
                                                  .length,
                                              itemBuilder: (_, index) =>
                                                  InkWell(
                                                    onTap: () {
                                                      selectPoint(controller
                                                              .search_livraison_point[
                                                          index]);
                                                      livraison.setPositionLabel(
                                                          controller
                                                              .search_livraison_point[
                                                                  index]
                                                              .libelle);
                                                      controller
                                                          .setLibelleAndQuartierColis(
                                                              controller
                                                                      .search_livraison_point[
                                                                  index]);
                                                      FocusScope.of(context)
                                                          .unfocus();
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
                                                                child: Text(controller
                                                                    .search_livraison_point[
                                                                        index]
                                                                    .libelle),
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            10),
                                                                child: Text(controller
                                                                    .search_livraison_point[
                                                                        index]
                                                                    .quartier),
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            10),
                                                                child: Text(controller
                                                                    .search_livraison_point[
                                                                        index]
                                                                    .ville),
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
                Positioned(
                  bottom: 10,
                  left: 10,
                  right: 10,
                  child: AppButton(
                    size: MainAxisSize.max,
                    bgColor: ColorsApp.primary,
                    text: 'Valider'.tr,
                    onTap: () async {
                      validatePoint();
                    },
                  ),
                ),
              ],
            )));
  }
}
