import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:BabanaExpress/application/model/exportmodel.dart';
import 'package:BabanaExpress/utils/Services/validators.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

import 'MapPagePointRecuperation.dart';

class InfoLIvraison extends StatefulWidget {
  InfoLIvraison({super.key});

  @override
  State<InfoLIvraison> createState() => _InfoLIvraisonState();
}

class _InfoLIvraisonState extends State<InfoLIvraison> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LivraisonBloc, LivraisonState>(
        builder: (context, state) {
      return Form(
        key: state.formKeyLivraison,
        child: Container(
          decoration: BoxDecoration(
              color: ColorsApp.white,
              boxShadow: [
                BoxShadow(
                  color: ColorsApp.primary.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
                BoxShadow(
                  color: ColorsApp.greyNew.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
              borderRadius: BorderRadius.circular(8)),
          margin: EdgeInsets.symmetric(horizontal: kMarginX),
          padding: EdgeInsets.all(kMarginX * 1.5),
          child: SingleChildScrollView(
            child: Column(children: [
              // Container(
              //   margin: EdgeInsets.only(
              //     top: kMarginY * 1.5,
              //   ),
              //   child: AppInputNew(
              //     controller: state.libelle!,
              //     icon: Icon(Icons.label),
              //     label: 'yLibelle'.tr(),
              //     onChanged: (value) {
              //       // verifyForm();
              //     },
              //     validator: (value) {
              //       return Validators.isValidUsername(value!);
              //     },
              //   ),
              // ),
              Container(
                  padding: EdgeInsets.only(
                    top: kMarginY,
                  ),
                  alignment: Alignment.centerLeft,
                  child: Text('yVille'.tr())),
              state.isLoadedVille == 0
                  ? CircularProgressIndicator(color: ColorsApp.primary)
                  : state.isLoadedVille == 2
                      ? Text('Error')
                      : Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            border: Border.all(
                                color: (state.errorVille!)
                                    ? ColorsApp.red
                                    : Colors.grey.shade200,
                                width: 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          height: getHeight(context) * .06,
                          width: getWith(context),
                          alignment: Alignment.center,
                          child: state.villeList!.isEmpty
                              ? Container()
                              : DropdownButton<VilleModel>(
                                  value: state.selectedVIlle,
                                  icon: Container(
                                    // padding: EdgeInsets.only(top: 4),
                                    child: Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                    ),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 7,
                                  ),
                                  hint: Container(
                                    width: getWith(context) * .65,
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 7,
                                    ),
                                    child: Text(
                                      'yselectville'.tr(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: ColorsApp.grey,
                                          fontFamily: 'Lato',
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  ),
                                  iconSize: 25,
                                  isExpanded: true,
                                  underline: SizedBox(),
                                  style: TextStyle(
                                      color: ColorsApp.black, fontSize: 12),
                                  onChanged: (newValue) {
                                    context.read<LivraisonBloc>().add(
                                        SelectedVille(
                                            ville: newValue as VilleModel));
                                    context.read<LivraisonBloc>().add(
                                        GetRecupPointEvent(ville: newValue.id));
                                  },
                                  items: state.villeList!.map((value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Center(
                                        child: Text(
                                          value.libelle,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                        ),
              if (state.errorVille!)
                Container(
                    padding: EdgeInsets.only(
                      top: kMarginY,
                    ),
                    margin: EdgeInsets.only(
                      left: 10,
                    ),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'eselectville'.tr(),
                      style: TextStyle(
                          fontSize: 8,
                          fontFamily: 'Lato',
                          color: ColorsApp.red),
                    )),

              state.isLoadedPLivraison == 0
                  ? Container(
                      padding: EdgeInsets.symmetric(
                        vertical: kMarginY * 1.2,
                      ),
                      alignment: Alignment.center,
                      child:
                          CircularProgressIndicator(color: ColorsApp.primary))
                  : state.isLoadedPLivraison == 2
                      ? Text('Error')
                      : state.isLoadedPLivraison == null
                          ? Container()
                          : Column(
                              children: [
                                Container(
                                    padding: EdgeInsets.only(
                                      top: kMarginY,
                                    ),
                                    alignment: Alignment.centerLeft,
                                    child: Text('yrecup'.tr())),
                                Container(
                                    margin: EdgeInsets.only(),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        (!state.isMapSelectedPointRecuperation)
                                            ? Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.grey.shade200,
                                                  border: Border.all(
                                                      color: (state
                                                              .errorPointRecuperation!)
                                                          ? ColorsApp.red
                                                          : Colors
                                                              .grey.shade200,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                height:
                                                    getHeight(context) * .06,
                                                width: getWith(context) * .65,
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 7,
                                                ),
                                                alignment: Alignment.center,
                                                child: DropdownButton<
                                                    PointLivraisonModel>(
                                                  isExpanded: true,
                                                  value: state
                                                      .selected_recuperation_point,
                                                  hint: Container(
                                                    width:
                                                        getWith(context) * .65,
                                                    alignment: Alignment.center,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal: 7,
                                                    ),
                                                    child: Text(
                                                      'yselectrecupp'.tr(),
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 12,
                                                          color: ColorsApp.grey,
                                                          fontFamily: 'Lato',
                                                          overflow: TextOverflow
                                                              .ellipsis),
                                                    ),
                                                  ),
                                                  icon: Container(
                                                    // padding: EdgeInsets.only(top: 4),
                                                    child: Icon(
                                                      Icons
                                                          .keyboard_arrow_down_outlined,
                                                    ),
                                                  ),
                                                  iconSize: 25,
                                                  underline: SizedBox(),
                                                  style: TextStyle(
                                                      color: ColorsApp.black,
                                                      fontSize: 12),
                                                  onChanged:
                                                      (PointLivraisonModel?
                                                          newValue) {
                                                    context
                                                        .read<LivraisonBloc>()
                                                        .add(
                                                            SelectPointRecuperation(
                                                                point_recup:
                                                                    newValue!));
                                                  },
                                                  items: state
                                                      .list_localisation_point!
                                                      .map((PointLivraisonModel
                                                          value) {
                                                    return DropdownMenuItem(
                                                      value: value,
                                                      child: Center(
                                                        child: Text(
                                                          value.libelle,
                                                        ),
                                                      ),
                                                    );
                                                  }).toList(),
                                                ),
                                              )
                                            : Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: kMarginY,
                                                    horizontal: kMarginX),
                                                height:
                                                    getHeight(context) * .06,
                                                alignment: Alignment.center,
                                                width: getWith(context) * .65,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: ColorsApp.greyNew),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    InkWell(
                                                      onTap: () => context
                                                          .read<LivraisonBloc>()
                                                          .add(
                                                              ClearPointRecuperation()),
                                                      child: Container(
                                                        child: Icon(
                                                          Icons
                                                              .keyboard_arrow_down_outlined,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              horizontal:
                                                                  kMarginX),
                                                      child: Text(state
                                                          .selected_recuperation_point!
                                                          .libelle),
                                                    ),
                                                    Container()
                                                  ],
                                                )),
                                        InkWell(
                                            child: Container(
                                                height:
                                                    getHeight(context) * .06,
                                                width: getHeight(context) * .06,

                                                // padding: EdgeInsets.all(20),
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    color: ColorsApp.primary,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Icon(
                                                  Icons.location_on,
                                                  color: ColorsApp.white,
                                                )),
                                            onTap: () {
                                              AutoRouter.of(context).pushNamed(
                                                  MapPagePointRecuperation
                                                      .routeName);
                                              /*    showModalBottomSheet(
                                                  context: context,
                                                  isScrollControlled: true,
                                                  isDismissible: true,
                                                  enableDrag: false,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(30.0),
                                                      topRight:
                                                          Radius.circular(30.0),
                                                    ),
                                                  ),
                                                  builder: (BuildContext
                                                          context) =>
                                                      Container(
                                                          height: getHeight(
                                                                  context) *
                                                              .9,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(10),
                                                              topRight: Radius
                                                                  .circular(10),
                                                            ),
                                                            // color: ColorsApp.white,
                                                          ),
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top:
                                                                      kMarginY *
                                                                          2),
                                                          child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          bottom:
                                                                              kMarginY),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      SizedBox(),
                                                                      Container(
                                                                        child:
                                                                            Text(
                                                                          'Selectionner un point de recuperation'
                                                                              .tr(),
                                                                          style: TextStyle(
                                                                              fontFamily: 'Lato',
                                                                              color: ColorsApp.primary),
                                                                        ),
                                                                      ),
                                                                      InkWell(
                                                                          child: Container(
                                                                              margin: EdgeInsets.only(right: kMarginX * 2),
                                                                              child: Icon(Icons.close, size: 25)),
                                                                          onTap: () => AutoRouter.of(context).pop())
                                                                    ],
                                                                  ),
                                                                ),
                                                                MapPagePointRecuperation()
                                                              ])));
                                           */
                                            }),
                                      ],
                                    )),
                              ],
                            ),
              if (state.errorPointRecuperation!)
                Container(
                    padding: EdgeInsets.only(
                      top: kMarginY,
                    ),
                    margin: EdgeInsets.only(
                      left: 10,
                    ),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'eselectrecup'.tr(),
                      style: TextStyle(
                          fontSize: 8,
                          fontFamily: 'Lato',
                          color: ColorsApp.red),
                    )),
              Container(
                margin: EdgeInsets.only(
                  top: kMarginY * 1.5,
                ),
                child: AppInputNew(
                  controller: state.contactEmetteur!,
                  icon: Icon(Icons.phone),
                  textInputType: TextInputType.number,
                  // maxLength:13,
                  label: 'yycontact'.tr(),
                  onChanged: (value) {},
                  validator: (value) {
                    return Validators.usPhoneValid(value!);
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: kMarginY * 1.5,
                ),
                child: TextFormField(
                  controller: state.description,
                  onChanged: (value) {},
                  validator: (value) {
                    return Validators.isValidUsername(value!);
                  },
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    fontFamily: 'Lato',
                  ),
                  maxLines: 10,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ColorsApp.primary, width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorsApp.red, width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorsApp.grey, width: 1),
                      borderRadius: BorderRadius.circular(8),
                      // borderSide:
                      //     BorderSide(color: ColorsApp.tird, width: 1),
                    ),
                    errorStyle: TextStyle(
                      fontSize: 8,
                      fontFamily: 'Lato',
                    ),
                    labelStyle: TextStyle(
                      color: ColorsApp.grey,
                      fontFamily: 'Lato',
                      // fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                    labelText: 'ydescript'.tr(),
                    fillColor: ColorsApp.tird,
                    counter: Offstage(),
                    // hintText: 'lbdescprod'.tr(),
                    alignLabelWithHint: true,
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      );
    });
  }
}
