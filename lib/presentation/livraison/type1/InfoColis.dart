import 'package:BabanaExpress/application/model/exportmodel.dart';
import 'package:BabanaExpress/presentation/components/Button/addColisComponent.dart';
import 'package:BabanaExpress/presentation/components/Button/uploadImage.dart';
import 'package:BabanaExpress/presentation/components/Widget/app_dropdown.dart';
import 'package:BabanaExpress/presentation/components/Widget/app_input_contact.dart';
import 'package:BabanaExpress/presentation/components/Widget/app_input_second.dart';
import 'package:BabanaExpress/presentation/components/Widget/file_option.dart';
import 'package:BabanaExpress/presentation/components/Widget/global_bottom_sheet.dart';
import 'package:BabanaExpress/presentation/components/Widget/imageComp.dart';
import 'package:BabanaExpress/presentation/components/Widget/colisComponent.dart';
import 'package:BabanaExpress/presentation/livraison/MapPagePointLivraisonColis.dart';
import 'package:BabanaExpress/utils/Services/ContactService.dart';
import 'package:BabanaExpress/utils/Services/validators.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:contacts_service/contacts_service.dart';

// ignore: must_be_immutable
class InfoColis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LivraisonBloc, LivraisonState>(
        builder: (context, state) => Container(
              // width: getWidth(context) * .8,
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

  openModalAddColis(context) => GlobalBottomSheet.show(
        context: context,
        title: 'Informations du colis',
        subtitle: 'Renseignez nous les informations de votre colis'.tr(),
        widget: BlocBuilder<LivraisonBloc, LivraisonState>(
            builder: (context, state) => Form(
                key: state.formKeyColis,
                child: Column(children: [
                  Container(
                      margin: EdgeInsets.only(top: kMarginY),
                      padding: EdgeInsets.symmetric(horizontal: kMarginX / 2),
                      decoration: BoxDecoration(),
                      child: SingleChildScrollView(
                          child: Column(children: [
                        state.isLoadVCategory == 0
                            ? CircularProgressIndicator(
                                color: ColorsApp.primary)
                            : state.isLoadVCategory == 2
                                ? Text('Error')
                                : AppDropdown<CategoryModel>(
                                    value: state.categoryColis,
                                    hint: 'ytypecolis'.tr(),
                                    onChanged: (CategoryModel? newValue) {
                                      context.read<LivraisonBloc>().add(
                                          SelectedCategory(
                                              categoryColis: newValue!));
                                    },
                                    items: state.list_category_colis!,
                                    itemLabelBuilder: (CategoryModel value) =>
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
                          child: AppInputContact(
                            controller: state.contactRecepteur!,
                            icon: Icon(Icons.phone),
                            textInputType: TextInputType.number,
                            // maxLength:13,
                            label: 'yycontactdest'.tr(),
                            onTap: () {
                              ContactService().openContactSelectionModal(
                                  context: context,
                                  onTap: (Contact contact) {
                                    state.contactRecepteur!.text =
                                        contact.phones!.first.value.toString();
                                    AutoRouter.of(context).pop();

                                    showSuccessGetContact(
                                      'Vous avez choisi ${contact.displayName}',
                                      context,
                                    );
                                  });
                            },
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                (!state.isMapSelectedPointLivraison)
                                    ? AppDropdown<PointLivraisonModel>(
                                        maxWidth: getWidth(context) * .76,
                                        value: state.selected_livraison_point,
                                        hint: 'yselectpointliv'.tr(),
                                        onChanged:
                                            (PointLivraisonModel? newValue) {
                                          context.read<LivraisonBloc>().add(
                                              SelectPointLivraisonColis(
                                                  point_livraison: newValue!));
                                        },
                                        items: state.list_localisation_point!,
                                        itemLabelBuilder:
                                            (PointLivraisonModel value) =>
                                                value.libelle,
                                        hasError: state.errorPointRecuperation!,
                                      )
                                    : Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: kMarginY,
                                            horizontal: kMarginX),
                                        height: getHeight(context) * .06,
                                        alignment: Alignment.center,
                                        width: getWidth(context) * .75,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: ColorsApp.greyNew),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: () => context
                                                  .read<LivraisonBloc>()
                                                  .add(ClearPointLivraison()),
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
                                          MapPagePointLivraisonColis.routeName);
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    textInputType: TextInputType.number,
                                    controller: state.valeurColis!,
                                    icon: Icon(Icons.monetization_on),
                                    onChanged: (newValue) {
                                      // state.verifyFormColis();
                                    },
                                    label: 'yprixcolis'.tr(),
                                    validator: (value) {
                                      return Validators.usNumeriqValid(value!);
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
                                    child: Text('yQuantitecolis'.tr())),
                                Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: kMarginX),
                                    height: getHeight(context) * .05,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: (state.errorQte!)
                                                ? ColorsApp.red
                                                : ColorsApp.greyNew,
                                            width: 1),
                                        color: ColorsApp.greyNew),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        InkWell(
                                            child: Icon(Icons.remove),
                                            onTap: () {
                                              context
                                                  .read<LivraisonBloc>()
                                                  .add(ManageQte(state: false));
                                            }),
                                        Container(
                                          // decoration: BoxDecoration(
                                          //     borderRadius:
                                          //         BorderRadius.circular(
                                          //             12),
                                          //     color: ColorsApp.greyNew),
                                          width: getWidth(context) / 5.5,
                                          // height: 35,
                                          // alignment: Alignment.center,
                                          margin: EdgeInsets.only(
                                            bottom: kMarginY,
                                          ),
                                          child: AppInputSecond(
                                            controller: state.quantiteColis!,
                                            textInputType: TextInputType.number,
                                            validator: (value) {
                                              return Validators.usNumeriqValid(
                                                  value!);
                                            },
                                          ),
                                        ),
                                        InkWell(
                                            child: Icon(Icons.add),
                                            onTap: () {
                                              context
                                                  .read<LivraisonBloc>()
                                                  .add(ManageQte(state: true));
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
                            width: getWidth(context),
                            child: InkWell(
                              child: state.imageColis!.length != 0
                                  ? Container(
                                      margin: EdgeInsets.only(
                                        top: kMarginY,
                                      ),
                                      child: ImageComp(
                                          file: state.imageColis![0], index: 0))
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
                                    builder: (context, state) => Container(
                                        margin: EdgeInsets.only(top: kMarginY),
                                        height: getHeight(context) * .2,
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
                                                  title: 'yGalerie'.tr(),
                                                  icon: FontAwesomeIcons.image,
                                                  onTap: () {
                                                    context
                                                        .read<LivraisonBloc>()
                                                        .add(
                                                            GetImageColisGalerie());
                                                    AutoRouter.of(context)
                                                        .pop();
                                                  }),
                                              FileOptionWidget(
                                                title: 'yCamera'.tr(),
                                                onTap: () {
                                                  context
                                                      .read<LivraisonBloc>()
                                                      .add(
                                                          GetImageColisAppareil());
                                                  AutoRouter.of(context).pop();
                                                },
                                                icon: FontAwesomeIcons
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
                      ]))),
                  AppButton(
                      size: MainAxisSize.max,
                      bgColor: ColorsApp.primary,
                      text: 'lbaddprod'.tr(),
                      onTap: () async {
                        context.read<LivraisonBloc>().add(AddColisType1());
                        if (state.isColisOK!) {
                          AutoRouter.of(context).pop();
                        }
                      }),
                ]))),
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
