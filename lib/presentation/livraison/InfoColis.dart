import 'package:BabanaExpress/application/model/exportmodel.dart';
import 'package:BabanaExpress/presentation/components/Button/addColisComponent.dart';
import 'package:BabanaExpress/presentation/components/Button/uploadImage.dart';
import 'package:BabanaExpress/presentation/components/Widget/app_input_second.dart';
import 'package:BabanaExpress/presentation/components/Widget/imageComp.dart';
import 'package:BabanaExpress/presentation/components/Widget/colisComponent.dart';
import 'package:BabanaExpress/presentation/livraison/MapPagePointLivraisonColis.dart';
import 'package:BabanaExpress/utils/Services/validators.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

import 'package:BabanaExpress/application/export_bloc.dart';

// ignore: must_be_immutable
class InfoColis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LivraisonBloc, LivraisonState>(
        builder: (context, state) => Container(
              // width: getWith(context) * .8,
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
              child: Column(children: [
                Stack(children: [
                  GridView.builder(
                      shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          childAspectRatio: 20,
                          mainAxisExtent: getHeight(context) / 4.5,
                          mainAxisSpacing: 20.0),
                      itemCount: state.listColis!.length + 1,
                      itemBuilder: (_ctx, index) =>
                          index != state.listColis!.length
                              ? ColisComponent(colis: state.listColis![index])
                              : AddColisComponent(
                                  title: 'Mon colis',
                                  onTap: () {
                                    // state.cleanImage();
                                    // state.resetPointLivraison();
                                    openModalAddColis(context);
                                  },
                                )),
                ]),
              ]),
            ));
  }

  openModalAddColis(context) => showModalBottomSheet(
        context: context,
        builder: (BuildContext context) => BlocBuilder<LivraisonBloc,
                LivraisonState>(
            builder: (context, state) => Container(
                height: getHeight(context) * .9,
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
                                    'yinfoColis'.tr() + ' ',
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
                                    child: Text('ytypecolis'.tr())),
                                state.isLoadedVCategory == 0
                                    ? CircularProgressIndicator(
                                        color: ColorsApp.primary)
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
                                            height: getHeight(context) * .06,
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
                                                  'ytypecolis'.tr(),
                                                  style: TextStyle(
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                ),
                                              ),
                                              iconSize: 25,
                                              underline: SizedBox(),
                                              style: TextStyle(
                                                  color: ColorsApp.black,
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
                                        'eselecttype'.tr(),
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
                                    label: 'ynomcolis'.tr(),
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
                                    label: 'yycontactdest'.tr(),
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
                                    child: Text('ylivraison'.tr())),
                                Container(
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
                                            height: getHeight(context) * .06,
                                            width: getWith(context) * .75,
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
                                                width: getWith(context) * .65,
                                                alignment: Alignment.center,
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 7,
                                                ),
                                                child: Text(
                                                  'yselectpointliv'.tr(),
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
                                                  color: ColorsApp.black,
                                                  fontSize: 12),
                                              onChanged: (PointLivraisonModel?
                                                  newValue) {
                                                context.read<LivraisonBloc>().add(
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
                                            height: getHeight(context) * .06,
                                            alignment: Alignment.center,
                                            width: getWith(context) * .75,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
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
                                                          ClearPointLivraison()),
                                                  child: Container(
                                                    child: Icon(
                                                      Icons
                                                          .keyboard_arrow_down_outlined,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: kMarginX),
                                                  child: Text(state
                                                      .selected_livraison_point!
                                                      .libelle),
                                                ),
                                                Container()
                                              ],
                                            )),
                                    InkWell(
                                        child: Container(
                                            height: getHeight(context) * .06,
                                            width: getHeight(context) * .06,

                                            // padding: EdgeInsets.all(20),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                color: ColorsApp.primary,
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Icon(
                                              Icons.location_on,
                                              color: ColorsApp.white,
                                            )),
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
                                        'eselectpoitnliv'.tr(),
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
                                            label: 'yprixcolis'.tr(),
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
                                            child: Text('yQuantitecolis'.tr())),
                                        Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: kMarginY,
                                                horizontal: kMarginX),
                                            height: getHeight(context) * .06,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
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
                                                    child: Icon(Icons.remove),
                                                    onTap: () {
                                                      context
                                                          .read<LivraisonBloc>()
                                                          .add(ManageQte(
                                                              state: false));
                                                    }),
                                                Container(
                                                  // decoration: BoxDecoration(
                                                  //     borderRadius:
                                                  //         BorderRadius.circular(
                                                  //             12),
                                                  //     color: ColorsApp.greyNew),
                                                  width: getWith(context) / 5.5,
                                                  // height: 35,
                                                  // alignment: Alignment.center,
                                                  margin: EdgeInsets.only(
                                                    bottom: kMarginY,
                                                  ),
                                                  child: AppInputSecond(
                                                    controller:
                                                        state.quantiteColis!,
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
                                        'eQuantitecolis'.tr(),
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
                                              margin: EdgeInsets.only(
                                                top: kMarginY,
                                              ),
                                              child: ImageComp(
                                                  file: state.imageColis![0],
                                                  index: 0))
                                          : UploadImage(
                                              color: ColorsApp.primary,
                                              title: 'yphotoColis'.tr(),
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
                                                        padding:
                                                            EdgeInsets.symmetric(
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
                                                                  margin: EdgeInsets.only(
                                                                      top:
                                                                          kMarginY /
                                                                              2,
                                                                      bottom:
                                                                          kMarginY),
                                                                  child: Text(
                                                                    'yphotoColisT'
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
                                                                          text: 'yCamera'.tr(),
                                                                          // width: getWith(context) / 2.5,
                                                                          size: MainAxisSize.max,
                                                                          // bgColor: AppColors.primaryGreen,
                                                                          onTap: () {
                                                                            context.read<LivraisonBloc>().add(GetImageColisAppareil());
                                                                            AutoRouter.of(context).pop();
                                                                          })),
                                                                  AppButton(
                                                                      text: 'yGalerie'
                                                                          .tr(),
                                                                      // width: getWith(context) / 2.5,
                                                                      size: MainAxisSize
                                                                          .max,
                                                                      // bgColor: AppColors.redarytext,
                                                                      onTap:
                                                                          () {
                                                                        context
                                                                            .read<LivraisonBloc>()
                                                                            .add(GetImageColisGalerie());
                                                                        AutoRouter.of(context)
                                                                            .pop();
                                                                      })
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
                                        'ephotoColisT'.tr(),
                                        style: TextStyle(
                                            fontSize: 8,
                                            fontFamily: 'Lato',
                                            color: ColorsApp.red),
                                      ))
                              ])))),
                      AppButton(
                          size: MainAxisSize.max,
                          bgColor: ColorsApp.primary,
                          text: 'lbaddprod'.tr(),
                          onTap: () async {
                            context.read<LivraisonBloc>().add(AddColis());
                            if (state.isColisOK!) {
                              AutoRouter.of(context).pop();
                            }
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


























































// import '../../presentation/components/exportcomponent.dart';
// import 'package:BabanaExpress/application/export_bloc.dart';

// import 'package:webview_flutter/webview_flutter.dart';
// @RoutePage()
// class PaimentPage extends StatefulWidget {
//   static const routeName = '/paiement';

//   const PaimentPage({Key? key}) : super(key: key);

//   @override
//   State<PaimentPage> createState() => _PaimentPageState();
// }

// class _PaimentPageState extends State<PaimentPage> {
//   late WebViewController? controller; // Déclarer controller comme nullable
  
//   @override
//   void initState() {
//     super.initState();
//     controller = null; // Initialiser controller à null
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<LivraisonBloc, LivraisonState>(
//       listener: (ctx, state) {
//         if (state.paiement_url != null) {
//           setState(() {
//             controller = WebViewController()..loadUrl(state.paiement_url!);
//           });
//         }
//       },
//       builder: (context, state) {
//         return Scaffold(
//           appBar: AppBar(
//             leading: AppBackButton(),
//             title: const Text('Paiement de votre livraison'),
//             centerTitle: true,
//           ),
//           body: controller != null // Vérifier si controller n'est pas null
//               ? WebView(
//                   initialUrl: '', // Remplacez par l'URL initiale si nécessaire
//                   onWebViewCreated: (WebViewController webViewController) {
//                     controller = webViewController;
//                   },
//                 )
//               : Center(
//                   child: CircularProgressIndicator(), // Afficher un indicateur de chargement si controller est null
//                 ),
//         );
//       },
//     );
//   }
// }
