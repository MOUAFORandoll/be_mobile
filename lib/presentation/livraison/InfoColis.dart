import 'package:BananaExpress/application/model/exportmodel.dart';
import 'package:BananaExpress/presentation/components/Button/addColisComponent.dart';
import 'package:BananaExpress/presentation/components/Button/app_button.dart';
import 'package:BananaExpress/presentation/components/Button/uploadImage.dart';
import 'package:BananaExpress/presentation/components/Widget/app_input_new.dart';
import 'package:BananaExpress/presentation/components/Widget/imageComp.dart';
import 'package:BananaExpress/presentation/components/Widget/colisComponent.dart';
import 'package:BananaExpress/presentation/livraison/MapPagePointLivraisonColis.dart';
import 'package:BananaExpress/styles/colorApp.dart';
import 'package:BananaExpress/styles/textStyle.dart';
import 'package:BananaExpress/utils/Services/validators.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:BananaExpress/routes/app_router.gr.dart';

import 'package:BananaExpress/utils/functions/app_loader.dart';
import 'package:BananaExpress/utils/functions/showToast.dart';

import 'package:BananaExpress/application/export_bloc.dart';

class InfoColis extends StatelessWidget {
  var loader = AppLoader.bounceLargeColorLoaderController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LivraisonBloc, LivraisonState>(
        listener: (context, state) {
          if (state.isRequest == 1) {
            loader.open(context);
          } else if (state.isRequest == 3) {
            loader.close();
            showError('Une erreur est survenue', context);
          } else if (state.isRequest == 2) {
            loader.close();
            Navigator.of(context).pop();
            validateLivraison(context);
            print('-----44--------*********');
          } else if (state.isRequest == 4) {
            AutoRouter.of(context).pop();
            loader.open(context);

            print('-----AutoRouter.of(context).pop()--------*********');
          } else if (state.isRequest == 5) {
            loader.close();
            AutoRouter.of(context).replaceAll([SuccesLivraisonRoute()]);
            showSuccess('Livraison Validee avec succes', context);

            print('-----44--------*********');
          }
        },
        builder: (context, state) => SingleChildScrollView(
                child: Column(children: [
              SizedBox(
                  height: state.listColis!.length == 0
                      ? 0
                      : getHeight(context) * .65,
                  child: Stack(children: [
                    GridView.builder(
                        shrinkWrap: true,
                        // physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.0,
                            childAspectRatio: 20,
                            mainAxisExtent: 150,
                            mainAxisSpacing: 20.0),
                        itemCount: state.listColis!.length,
                        itemBuilder: (_ctx, index) =>
                            ColisComponent(colis: state.listColis![index])),
                  ])),
              AddColisComponent(
                color: ColorsApp.tird,
                title: 'Colis',
                icon: Icons.collections,
                onTap: () {
                  // state.cleanImage();
                  // state.resetPointLivraison();
                  openModalAddColis(context);
                },
              ),
            ])));
  }

  validateLivraison(context) => showModalBottomSheet(
        context: context,
        builder: (BuildContext context) => BlocBuilder<LivraisonBloc,
                LivraisonState>(
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
                            onTap: () => AutoRouter.of(context).pop(),
                            child: Icon(Icons.close),
                          )),
                      Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(vertical: kMarginY * 2),
                          child: Row(
                            children: [
                              Text(
                                'Les frais de livraison seront de : '.tr(),
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              Text(
                                '${state.frais} FCFA  ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                            ],
                          )),
                      Container(
                          margin: EdgeInsets.symmetric(vertical: kMarginY * 2),
                          child: Text(
                            ' a payer par l\'emetteur: '.tr(),
                            style: TextStyle(fontWeight: FontWeight.w500),
                          )),
                      Container(
                          margin: EdgeInsets.only(top: kMarginY),
                          child: Column(
                            // mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 8),
                                child: AppButton(
                                    text: 'Valider Ma Demande'.tr(),
                                    // width: getWith(context) / 2.5,
                                    size: MainAxisSize.max,
                                    bgColor: ColorsApp.second,
                                    onTap: () => context
                                        .read<LivraisonBloc>()
                                        .add(NewLivraison())),
                              ),
                            ],
                          ))
                    ]))),
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        backgroundColor: Colors.transparent,
      );

  openModalAddColis(context) => showModalBottomSheet(
        context: context,
        builder: (BuildContext context) => BlocBuilder<LivraisonBloc,
                LivraisonState>(
            builder: (context, state) => Container(
                height: getHeight(context) * .8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: ColorsApp.white,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: kMarginX,
                ).add(EdgeInsets.only(top: kMarginY)),
                child: Form(
                    key: state.formKeyColis,
                    child: Column(children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: kMarginX / 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.symmetric(vertical: kMarginX / 2),
                              child: Row(
                                children: [
                                  Text(
                                    'Informations de votre colis'.tr() + ' ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                                alignment: Alignment.topRight,
                                margin: EdgeInsets.symmetric(
                                    vertical: kMarginX / 2),

                                // padding:
                                //     EdgeInsets.symmetric(horizontal: kMarginX / 2),
                                child: InkWell(
                                  onTap: () => AutoRouter.of(context).pop(),
                                  child: Icon(
                                    Icons.close,
                                    // color: ColorsApp.white,
                                  ),
                                )),
                          ],
                        ),
                      ),
                      Expanded(
                          child: Container(
                              margin: EdgeInsets.only(top: kMarginY),
                              padding: EdgeInsets.symmetric(
                                  horizontal: kMarginX / 2),
                              decoration: BoxDecoration(),
                              child: SingleChildScrollView(
                                  child: Column(children: [
                                Container(
                                    padding: EdgeInsets.only(
                                      top: kMarginY,
                                    ),
                                    alignment: Alignment.centerLeft,
                                    child: Text('Category de colis')),
                                state.isLoadedVCategory == 0
                                    ? CircularProgressIndicator()
                                    : state.isLoadedVCategory == 2
                                        ? Text('Error')
                                        : Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: (state.errorCategory!)
                                                      ? ColorsApp.red
                                                      : ColorsApp.grey,
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            height: getHeight(context) * .08,
                                            width: getWith(context),
                                            margin: EdgeInsets.only(
                                              top: kMarginY * 1.5,
                                            ),
                                            alignment: Alignment.center,
                                            child: DropdownButton(
                                              value: state.categoryColis,
                                              icon: Container(
                                                // padding: EdgeInsets.only(top: 4),
                                                child: Icon(
                                                  Icons
                                                      .keyboard_arrow_down_outlined,
                                                ),
                                              ),
                                              hint: Container(
                                                width: getWith(context) * .65,
                                                alignment: Alignment.center,
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 7,
                                                ),
                                                child: Text(
                                                  'Selectionner une category',
                                                  style: TextStyle(
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                ),
                                              ),
                                              iconSize: 25,
                                              underline: SizedBox(),
                                              style: TextStyle(
                                                  color: ColorsApp.primary,
                                                  fontSize: 12),
                                              onChanged:
                                                  (CategoryModel? newValue) {
                                                context
                                                    .read<LivraisonBloc>()
                                                    .add(SelectedCategory(
                                                        categoryColis:
                                                            newValue!));
                                              },
                                              items: state.list_category_colis!
                                                  .map((value) {
                                                return DropdownMenuItem(
                                                  value: value,
                                                  child: Center(
                                                    child: Text(
                                                      value.libelle!,
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                            ),
                                          ),
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
                                        'Veuillez selectionner une Categorie',
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
                                    controller: state.nomColis!,
                                    icon: Icon(Icons.label),
                                    onChanged: (newValue) {
                                      // state.verifyFormColis();
                                    },
                                    label: 'Nom du colis'.tr(),
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
                                    controller: state.contactRecepteur!,
                                    textInputType: TextInputType.number,
                                    icon: Icon(Icons.phone),
                                    label: 'Contact du recepteur'.tr(),
                                    validator: (value) {
                                      return Validators.usPhoneValid(value!);
                                    },
                                  ),
                                ),
                                Container(
                                    padding: EdgeInsets.only(
                                      top: kMarginY,
                                    ),
                                    alignment: Alignment.centerLeft,
                                    child: Text('Point de livraison')),
                                Container(
                                    margin: EdgeInsets.only(
                                      top: kMarginY,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        (!state.isMapSelectedPointLivraison)
                                            ? Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: (state
                                                              .errorPointRecuperation!)
                                                          ? ColorsApp.red
                                                          : ColorsApp.grey,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                height:
                                                    getHeight(context) * .08,
                                                width: getWith(context) * .65,
                                                margin: EdgeInsets.only(
                                                  top: kMarginY * 1.5,
                                                ),
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 7,
                                                ),
                                                alignment: Alignment.center,
                                                child: DropdownButton<
                                                    PointLivraisonModel>(
                                                  isExpanded: true,
                                                  value: state
                                                      .selected_livraison_point,
                                                  hint: Container(
                                                    width:
                                                        getWith(context) * .65,
                                                    alignment: Alignment.center,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal: 7,
                                                    ),
                                                    child: Text(
                                                      'Selectionner un point',
                                                      style: TextStyle(
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
                                                      color: ColorsApp.primary,
                                                      fontSize: 12),
                                                  onChanged:
                                                      (PointLivraisonModel?
                                                          newValue) {
                                                    context
                                                        .read<LivraisonBloc>()
                                                        .add(
                                                            SelectPointLivraisonColis(
                                                                point_livraison:
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
                                                        BorderRadius.circular(
                                                            90),
                                                    color: ColorsApp.grey),
                                                child: Icon(Icons.location_on)),
                                            onTap: () {
                                              AutoRouter.of(context).pushNamed(
                                                  MapPagePointLivraisonColis
                                                      .routeName);
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
                                        'Veuillez selectionner un point de livraison',
                                        style: TextStyle(
                                            fontSize: 8,
                                            fontFamily: 'Lato',
                                            color: ColorsApp.red),
                                      )),
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
                                          width: getWith(context) / 2.5,
                                          child: AppInputNew(
                                            textInputType: TextInputType.number,
                                            controller: state.valeurColis!,
                                            icon: Icon(Icons.monetization_on),
                                            onChanged: (newValue) {
                                              // state.verifyFormColis();
                                            },
                                            label: 'Valeur du Colis'.tr(),
                                            validator: (value) {
                                              return Validators.usNumeriqValid(
                                                  value!);
                                            },
                                          ),
                                        ),
                                      ]),
                                    ),
                                    Container(
                                      width: getWith(context) / 2.5,
                                      margin: EdgeInsets.only(
                                        bottom: kMarginY * 1.5,
                                      ),
                                      child: Column(children: [
                                        Container(
                                            padding: EdgeInsets.only(
                                              top: kMarginY,
                                            ),
                                            alignment: Alignment.centerLeft,
                                            child: Text('Quantite')),
                                        Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: kMarginY,
                                                horizontal: kMarginX),
                                            height: getHeight(context) * .08,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border: Border.all(
                                                    color: (state.errorQte!)
                                                        ? ColorsApp.red
                                                        : ColorsApp.grey,
                                                    width: 1),
                                                color: ColorsApp.grey),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                    child: Icon(Icons.remove),
                                                    onTap: () {
                                                      context
                                                          .read<LivraisonBloc>()
                                                          .add(ManageQte(
                                                              state: false));
                                                    }),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      color: ColorsApp.grey),
                                                  width: getWith(context) / 5.5,
                                                  // height: 35,
                                                  // alignment: Alignment.center,
                                                  margin: EdgeInsets.only(
                                                    bottom: kMarginY,
                                                  ),
                                                  child: AppInputNew(
                                                    controller:
                                                        state.quantiteColis!,
                                                    label: '',
                                                    // border: true,
                                                    alignStart: false,
                                                    textInputType:
                                                        TextInputType.number,
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
                                                          .read<LivraisonBloc>()
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
                                        'Veuillez entrer une quantite',
                                        style: TextStyle(
                                            fontSize: 8,
                                            fontFamily: 'Lato',
                                            color: ColorsApp.red),
                                      )),
                                Container(
                                    width: getWith(context),
                                    child: InkWell(
                                      child: state.imageColis!.length != 0
                                          ? Container(
                                              height: getHeight(context) * 2,
                                              margin: EdgeInsets.only(
                                                top: kMarginY,
                                              ),
                                              child: ImageComp(
                                                  file: state.imageColis![0],
                                                  index: 0))
                                          : UploadImage(
                                              color: ColorsApp.tird,
                                              title: 'Appareil photo',
                                              icon: Icons.camera_alt),
                                      onTap: () => showModalBottomSheet(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            BlocBuilder<LivraisonBloc,
                                                    LivraisonState>(
                                                builder: (context, state) =>
                                                    Container(
                                                        height:
                                                            getHeight(context) *
                                                                .4,
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    kMarginX),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    10),
                                                            topRight:
                                                                Radius.circular(
                                                                    10),
                                                          ),
                                                          color:
                                                              ColorsApp.white,
                                                        ),
                                                        child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .topRight,
                                                                  margin: EdgeInsets.symmetric(
                                                                      vertical:
                                                                          kMarginY *
                                                                              2),
                                                                  // padding: EdgeInsets.symmetric(
                                                                  //     horizontal: kMarginX / 2),
                                                                  child:
                                                                      InkWell(
                                                                    onTap: () =>
                                                                        AutoRouter.of(context)
                                                                            .pop(),
                                                                    child: Icon(
                                                                        Icons
                                                                            .close),
                                                                  )),
                                                              Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  margin: EdgeInsets
                                                                      .symmetric(
                                                                          vertical:
                                                                              kMarginY),
                                                                  child: Text(
                                                                    'Selectionner la photo de votre produit'
                                                                        .tr(),
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.w500
                                                                        // color: AppColors.redarytext,
                                                                        ),
                                                                  )),
                                                              Container(
                                                                  child: Column(
                                                                // mainAxisSize: MainAxisSize.max,
                                                                children: [
                                                                  Container(
                                                                    margin: EdgeInsets.only(
                                                                        bottom:
                                                                            8),
                                                                    child: AppButton(
                                                                        text: 'Camera'.tr(),
                                                                        // width: getWith(context) / 2.5,
                                                                        size: MainAxisSize.max,
                                                                        // bgColor: AppColors.primaryGreen,
                                                                        onTap: () => context.read<LivraisonBloc>().add(GetImageColisAppareil())),
                                                                  ),
                                                                  AppButton(
                                                                      text: 'Galerie'
                                                                          .tr(),
                                                                      // width: getWith(context) / 2.5,
                                                                      size: MainAxisSize
                                                                          .max,
                                                                      // bgColor: AppColors.redarytext,
                                                                      onTap: () => context
                                                                          .read<
                                                                              LivraisonBloc>()
                                                                          .add(
                                                                              GetImageColisGalerie()))
                                                                ],
                                                              ))
                                                            ]))),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(16)),
                                        ),
                                        backgroundColor: Colors.transparent,
                                      ),
                                    )),
                                if (state.errorImage!)
                                  Container(
                                      padding: EdgeInsets.only(
                                        top: kMarginY,
                                      ),
                                      margin: EdgeInsets.only(
                                        left: 10,
                                      ),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Veuillez selectionner une image',
                                        style: TextStyle(
                                            fontSize: 8,
                                            fontFamily: 'Lato',
                                            color: ColorsApp.red),
                                      ))
                              ])))),
                      AppButton(
                          size: MainAxisSize.max,
                          bgColor: ColorsApp.primary,
                          text: 'Ajouter'.tr(),
                          onTap: () async {
                            context.read<LivraisonBloc>().add(AddColis());
                          }),
                    ])))),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        isScrollControlled: true,
        useSafeArea: true,
        backgroundColor: Colors.transparent,
      );
}
