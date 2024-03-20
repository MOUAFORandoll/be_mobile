import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:BabanaExpress/application/model/exportmodel.dart';
import 'package:BabanaExpress/presentation/pharmacy/paiement_pharmacy_page.dart';
import 'package:BabanaExpress/utils/Services/validators.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

import 'MapPagePointLivraison.dart';

// ignore: must_be_immutable
class InfoLieuxLIvraisonView extends StatelessWidget {
  var loader = AppLoader.bounceLargeColorLoaderController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PharmacyBloc, PharmacyState>(
        builder: (context, state) => BlocBuilder<LivraisonBloc, LivraisonState>(
            builder: (context, state_livraison) => Form(
                key: state.formKeyLivraison,
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: kMarginX),
                    child: SingleChildScrollView(
                        child: Column(children: [
                      Column(children: [
                        Container(
                            padding: EdgeInsets.only(
                              top: kMarginY,
                            ),
                            alignment: Alignment.centerLeft,
                            child: Text('yVille'.tr())),
                        state_livraison.isLoadedVille == 0
                            ? CircularProgressIndicator(color: ColorsApp.second)
                            : state_livraison.isLoadedVille == 2
                                ? Text('Error')
                                : Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: (state.errorVille!)
                                              ? ColorsApp.red
                                              : ColorsApp.grey,
                                          width: 1),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    height: getHeight(context) * .08,
                                    width: getWith(context),
                                    alignment: Alignment.center,
                                    child: state_livraison.villeList!.isEmpty
                                        ? Container()
                                        : DropdownButton<VilleModel>(
                                            value: state.selectedVIlle,
                                            icon: Container(
                                              // padding: EdgeInsets.only(top: 4),
                                              child: Icon(
                                                Icons
                                                    .keyboard_arrow_down_outlined,
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
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                              ),
                                            ),
                                            iconSize: 25,
                                            isExpanded: true,
                                            underline: SizedBox(),
                                            style: TextStyle(
                                                color: ColorsApp.black,
                                                fontSize: 12),
                                            onChanged: (newValue) {
                                              context.read<PharmacyBloc>().add(
                                                  SelectedVilleP(
                                                      ville: newValue
                                                          as VilleModel));
                                              context.read<LivraisonBloc>().add(
                                                  GetRecupPointEvent(
                                                      ville: newValue.id));
                                              context.read<PharmacyBloc>().add(
                                                  SelectPointLivraisonP(
                                                      point_livraison: null));
                                            },
                                            items: state_livraison.villeList!
                                                .map((value) {
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
                        Container(
                            padding: EdgeInsets.only(
                              top: kMarginY,
                            ),
                            alignment: Alignment.centerLeft,
                            child: Text('yselectpointliv'.tr())),
                        state_livraison.isLoadedPLivraison == 0
                            ? Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: kMarginY * 1.2,
                                ),
                                alignment: Alignment.center,
                                child: CircularProgressIndicator(
                                    color: ColorsApp.primary))
                            : state_livraison.isLoadedPLivraison == 2
                                ? Text('Error')
                                : Container(
                                    padding: EdgeInsets.only(
                                      top: kMarginY,
                                    ),
                                    alignment: Alignment.centerLeft,
                                    child: Text('eselectpoitnliv'.tr())),
                        if (state_livraison.isLoadedPLivraison == 1 &&
                            state_livraison.list_localisation_point != null &&
                            state_livraison.list_localisation_point!.length !=
                                0)
                          Container(
                              margin: EdgeInsets.only(),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  (!state.isMapSelectedPointLivraison)
                                      ? Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color:
                                                    (state.errorPointLivraison!)
                                                        ? ColorsApp.red
                                                        : ColorsApp.grey,
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          height: getHeight(context) * .08,
                                          width: getWith(context) * .65,
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 7,
                                          ),
                                          alignment: Alignment.center,
                                          child: DropdownButton<
                                              PointLivraisonModel>(
                                            isExpanded: true,
                                            value:
                                                state.selected_livraison_point,
                                            hint: Container(
                                              width: getWith(context) * .65,
                                              alignment: Alignment.center,
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 7,
                                              ),
                                              child: Text(
                                                'yselectpointliv'.tr(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12,
                                                    color: ColorsApp.grey,
                                                    fontFamily: 'Lato',
                                                    overflow:
                                                        TextOverflow.ellipsis),
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
                                            onChanged: (PointLivraisonModel?
                                                newValue) {
                                              context.read<PharmacyBloc>().add(
                                                  SelectPointLivraisonP(
                                                      point_livraison:
                                                          newValue!));
                                            },
                                            items: state_livraison
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
                                          height: getHeight(context) * .06,
                                          alignment: Alignment.center,
                                          width: getWith(context) * .65,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: ColorsApp.grey),
                                          child: Text(state
                                              .selected_livraison_point!
                                              .libelle)),
                                  InkWell(
                                      child: Container(
                                          padding: EdgeInsets.all(10),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(90),
                                              color: ColorsApp.grey),
                                          child: Icon(Icons.location_on)),
                                      onTap: () {
                                        showModalBottomSheet(
                                            context: context,
                                            isScrollControlled: true,
                                            isDismissible: true,
                                            enableDrag: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(30.0),
                                                topRight: Radius.circular(30.0),
                                              ),
                                            ),
                                            builder: (BuildContext context) =>
                                                Container(
                                                    height:
                                                        getHeight(context) * .9,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(10),
                                                        topRight:
                                                            Radius.circular(10),
                                                      ),
                                                      // color: ColorsApp.white,
                                                    ),
                                                    margin: EdgeInsets.only(
                                                        top: kMarginY * 2),
                                                    child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              SizedBox(),
                                                              Container(
                                                                child: Text(
                                                                  'Selectionner un point de recuperation'
                                                                      .tr(),
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontFamily:
                                                                          'Lato',
                                                                      color: ColorsApp
                                                                          .primary),
                                                                ),
                                                              ),
                                                              InkWell(
                                                                  child: Container(
                                                                      margin: EdgeInsets.only(
                                                                          right: kMarginX *
                                                                              2),
                                                                      child: Icon(
                                                                          Icons
                                                                              .close,
                                                                          size:
                                                                              25)),
                                                                  onTap: () =>
                                                                      AutoRouter.of(
                                                                              context)
                                                                          .pop())
                                                            ],
                                                          ),
                                                          MapPagePointLivraison()
                                                        ])));
                                      }),
                                ],
                              )),
                        if (state.errorPointLivraison!)
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
                            controller: state.contactRecepteur!,
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
                      ]),
                    ]))))));
  }
}

validateLivraisonMedicaments(context) => showModalBottomSheet(
      context: context,
      builder: (BuildContext context) => BlocBuilder<PharmacyBloc,
              PharmacyState>(
          builder: (context, state) => Container(
              height: getHeight(context) * .4,
              padding: EdgeInsets.symmetric(horizontal: kMarginX),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: ColorsApp.white,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        alignment: Alignment.topRight,
                        margin: EdgeInsets.only(top: kMarginY * 2),
                        // padding: EdgeInsets.symmetric(
                        //     horizontal: kMarginX / 2),
                        child: InkWell(
                          onTap: () {
                            AutoRouter.of(context).pop();

                            context.read<PharmacyBloc>().add(NoValidateP());
                          },
                          child: Icon(Icons.close),
                        )),
                    Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(vertical: kMarginY * 2),
                        child: Row(
                          children: [
                            Text(
                              'yfrais'.tr(),
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '${state.frais} FCFA  ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                          ],
                        )),
                    // Container(
                    //     margin: EdgeInsets.symmetric(vertical: kMarginY * 2),
                    //     child: Text(
                    //       ' a payer par l\'emetteur: '.tr(),
                    //       style: TextStyle(fontWeight: FontWeight.w500),
                    //     )),
                    Container(
                        margin: EdgeInsets.only(top: kMarginY),
                        child: Column(
                          // mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 8),
                              child: AppButton(
                                  text: 'yvalidate'.tr(),
                                  // width: getWith(context) / 2.5,
                                  size: MainAxisSize.max,
                                  bgColor: ColorsApp.second,
                                  onTap: () => context
                                      .read<PharmacyBloc>()
                                      .add(NewLivraisonPharmacy())),
                            ),
                          ],
                        ))
                  ]))),
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      backgroundColor: Colors.transparent,
    ).whenComplete(() {
      BlocProvider.of<PharmacyBloc>(context).add(NoValidateP());
    });
