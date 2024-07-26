import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:BabanaExpress/application/model/exportmodel.dart';

import 'package:BabanaExpress/presentation/components/Widget/app_input_contact.dart';
import 'package:BabanaExpress/presentation/market/MapPagePointLivraisonMarket.dart';
import 'package:BabanaExpress/presentation/market/PaiementMarketPage.dart';
import 'package:BabanaExpress/presentation/market/SuccesLivraisonMarketPage.dart';
import 'package:BabanaExpress/utils/Services/ContactService.dart';
import 'package:BabanaExpress/utils/Services/validators.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/utils/functions/formatData.dart';
import 'package:contacts_service/contacts_service.dart';

@RoutePage()
class InfoLieuxLivraisonMarketPage extends StatefulWidget {
  static const routeName = '/livraison/lieux/market';
  @override
  State<InfoLieuxLivraisonMarketPage> createState() =>
      _InfoLieuxLivraisonMarketPageState();
}

class _InfoLieuxLivraisonMarketPageState
    extends State<InfoLieuxLivraisonMarketPage> {
  var _format = new FormatData();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MarketBloc, MarketState>(
        listener: (context, state) async {
          if (state.isRequest == 1) {
            EasyLoading.show(
                dismissOnTap: true,
                status: 'En cours',
                maskType: EasyLoadingMaskType.black);
          } else if (state.isRequest == 3) {
            EasyLoading.dismiss();

            showError('Une erreur est survenue', context);
            print('-----err[orr--------**000*******');
          } else if (state.isRequest == 4) {
            // AutoRouter.of(context).pop();
            EasyLoading.show(
                dismissOnTap: true,
                status: 'En cours',
                maskType: EasyLoadingMaskType.black);
          } else if (state.isRequest == 5) {
            print('-----000.of(context).pop()--------*********');
            AutoRouter.of(context).pop();
            EasyLoading.dismiss();
            if (state.paiement_url != null) {
              if (state.paiement_url == 'next') {
                AutoRouter.of(context)
                    .pushNamed(SuccesLivraisonMarketPage.routeName);
              } else {
                AutoRouter.of(context).pushNamed(PaiementMarketPage.routeName);
              }
            }

            print('-----44--------*********');
          }
        },
        builder: (context, state) => BlocBuilder<LivraisonBloc, LivraisonState>(
            builder: (context, state_livraison) => Scaffold(
                appBar: AppBarCustom(
                  title: 'Remplissez vos informations de livraisons'.tr(),
                ),
                backgroundColor: ColorsApp.bg,
                body: Column(children: [
                  Expanded(
                      child: Container(
                          height: getHeight(context),
                          margin: EdgeInsets.symmetric(
                              horizontal: kMarginX, vertical: kMarginY),
                          child: Form(
                              key: state_livraison.formKeyLivraison,
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: ColorsApp.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: ColorsApp.primary
                                              .withOpacity(0.1),
                                          spreadRadius: 5,
                                          blurRadius: 5,
                                          offset: Offset(0, 2),
                                        ),
                                        BoxShadow(
                                          color: ColorsApp.greyNew
                                              .withOpacity(0.1),
                                          spreadRadius: 5,
                                          blurRadius: 5,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(8)),
                                  margin: EdgeInsets.symmetric(
                                      horizontal: kMarginX),
                                  padding: EdgeInsets.all(kMarginX * 1.5),
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
                                          ? CircularProgressIndicator(
                                              color: ColorsApp.second)
                                          : state_livraison.isLoadedVille == 2
                                              ? Text('Error')
                                              : Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey.shade200,
                                                    border: Border.all(
                                                        color: (state_livraison
                                                                .errorVille!)
                                                            ? ColorsApp.red
                                                            : Colors
                                                                .grey.shade200,
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  height:
                                                      getHeight(context) * .06,
                                                  width: getWidth(context),
                                                  alignment: Alignment.center,
                                                  child: state_livraison
                                                          .villeList!.isEmpty
                                                      ? Container()
                                                      : DropdownButton<
                                                          VilleModel>(
                                                          value: state
                                                              .selectedVIlle,
                                                          icon: Container(
                                                            // padding: EdgeInsets.only(top: 4),
                                                            child: Icon(
                                                              Icons
                                                                  .keyboard_arrow_down_outlined,
                                                            ),
                                                          ),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                            horizontal: 7,
                                                          ),
                                                          hint: Container(
                                                            width: getWidth(
                                                                    context) *
                                                                .65,
                                                            alignment: Alignment
                                                                .center,
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                              horizontal: 7,
                                                            ),
                                                            child: Text(
                                                              'yselectville'
                                                                  .tr(),
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 12,
                                                                  color:
                                                                      ColorsApp
                                                                          .grey,
                                                                  fontFamily:
                                                                      'Lato',
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis),
                                                            ),
                                                          ),
                                                          iconSize: 25,
                                                          isExpanded: true,
                                                          underline: SizedBox(),
                                                          style: TextStyle(
                                                              color: ColorsApp
                                                                  .black,
                                                              fontSize: 12),
                                                          onChanged:
                                                              (newValue) {
                                                            context
                                                                .read<
                                                                    MarketBloc>()
                                                                .add(SelectedVilleMarket(
                                                                    ville: newValue
                                                                        as VilleModel));
                                                            context
                                                                .read<
                                                                    LivraisonBloc>()
                                                                .add(GetRecupPointEvent(
                                                                    ville:
                                                                        newValue
                                                                            .id));
                                                            context
                                                                .read<
                                                                    MarketBloc>()
                                                                .add(SelectPointLivraisonMarket(
                                                                    point_livraison:
                                                                        null));
                                                          },
                                                          items: state_livraison
                                                              .villeList!
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
                                      if (state_livraison.errorVille!)
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
                                      state_livraison.isLoadedPLivraison == 0
                                          ? Container(
                                              padding: EdgeInsets.symmetric(
                                                vertical: kMarginY * 1.2,
                                              ),
                                              alignment: Alignment.center,
                                              child: CircularProgressIndicator(
                                                  color: ColorsApp.primary))
                                          : state_livraison
                                                      .isLoadedPLivraison ==
                                                  2
                                              ? Text('Error')
                                              : state_livraison
                                                          .isLoadedPLivraison ==
                                                      null
                                                  ? Container()
                                                  : Column(
                                                      children: [
                                                        Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                              top: kMarginY,
                                                            ),
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Text(
                                                                'yselectpointliv'
                                                                    .tr())),
                                                        Container(
                                                            margin: EdgeInsets
                                                                .only(),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                (!state
                                                                        .isMapSelectedPointLivraison)
                                                                    ? Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color: Colors
                                                                              .grey
                                                                              .shade200,
                                                                          border: Border.all(
                                                                              color: (state.errorPointLivraison!) ? ColorsApp.red : Colors.grey.shade200,
                                                                              width: 1),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8),
                                                                        ),
                                                                        height: getHeight(context) *
                                                                            .06,
                                                                        width: getWidth(context) *
                                                                            .65,
                                                                        padding:
                                                                            EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              7,
                                                                        ),
                                                                        alignment:
                                                                            Alignment.center,
                                                                        child: DropdownButton<
                                                                            PointLivraisonModel>(
                                                                          isExpanded:
                                                                              true,
                                                                          value:
                                                                              state.selected_livraison_point,
                                                                          hint:
                                                                              Container(
                                                                            width:
                                                                                getWidth(context) * .65,
                                                                            alignment:
                                                                                Alignment.center,
                                                                            padding:
                                                                                EdgeInsets.symmetric(
                                                                              horizontal: 7,
                                                                            ),
                                                                            child:
                                                                                Text(
                                                                              'yselectpointliv'.tr(),
                                                                              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: ColorsApp.grey, fontFamily: 'Lato', overflow: TextOverflow.ellipsis),
                                                                            ),
                                                                          ),
                                                                          icon:
                                                                              Container(
                                                                            // padding: EdgeInsets.only(top: 4),
                                                                            child:
                                                                                Icon(
                                                                              Icons.keyboard_arrow_down_outlined,
                                                                            ),
                                                                          ),
                                                                          iconSize:
                                                                              25,
                                                                          underline:
                                                                              SizedBox(),
                                                                          style: TextStyle(
                                                                              color: ColorsApp.black,
                                                                              fontSize: 12),
                                                                          onChanged:
                                                                              (PointLivraisonModel? newValue) {
                                                                            context.read<MarketBloc>().add(SelectPointLivraisonMarket(point_livraison: newValue!));
                                                                          },
                                                                          items: state_livraison
                                                                              .list_localisation_point!
                                                                              .map((PointLivraisonModel value) {
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
                                                                            vertical:
                                                                                kMarginY,
                                                                            horizontal:
                                                                                kMarginX),
                                                                        height: getHeight(context) *
                                                                            .06,
                                                                        alignment:
                                                                            Alignment
                                                                                .center,
                                                                        width: getWidth(context) *
                                                                            .65,
                                                                        decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(
                                                                                5),
                                                                            color: ColorsApp
                                                                                .greyNew),
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            InkWell(
                                                                              // onTap: () => context
                                                                              //     .read<
                                                                              //         MarketBloc>()
                                                                              //     .add(
                                                                              //         ClearPointLivraisonMedoc()),
                                                                              child: Container(
                                                                                child: Icon(
                                                                                  Icons.keyboard_arrow_down_outlined,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              margin: EdgeInsets.symmetric(horizontal: kMarginX),
                                                                              child: Text(state.selected_livraison_point!.libelle),
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
                                                                        decoration: BoxDecoration(color: ColorsApp.primary, borderRadius: BorderRadius.circular(8)),
                                                                        child: Icon(
                                                                          Icons
                                                                              .location_on,
                                                                          color:
                                                                              ColorsApp.white,
                                                                        )),
                                                                    onTap: () {
                                                                      AutoRouter.of(
                                                                              context)
                                                                          .pushNamed(
                                                                              MapPagePointLivraisonMarket.routeName);
                                                                    }),
                                                              ],
                                                            )),
                                                      ],
                                                    ),
                                      if (state_livraison.errorPointLivraison!)
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
                                        child: AppInputContact(
                                          controller: state.contactRecepteur!,
                                          icon: Icon(Icons.phone),
                                          textInputType: TextInputType.number,
                                          // maxLength:13,
                                          label: 'yycontact'.tr(),
                                          onTap: () {
                                            ContactService()
                                                .openContactSelectionModal(
                                                    context: context,
                                                    onTap: (Contact contact) {
                                                      state.contactRecepteur!
                                                              .text =
                                                          contact.phones!.first
                                                              .value
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
                                    ]),
                                    Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.symmetric(
                                            vertical: kMarginY * 2),
                                        child: Row(
                                          children: [
                                            Text(
                                              'yfrais'.tr(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              '1000 FCFA  ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ),
                                          ],
                                        )),
                                    Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.symmetric(
                                            vertical: kMarginY * 2),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Veuillez chosir votre moyen de paiement'
                                                  .tr(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        )),
                                    BlocBuilder<UserBloc, UserState>(
                                        builder: (contextU, stateU) =>
                                            SingleChildScrollView(
                                                child: ListView.builder(
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: stateU
                                                  .listModePaiement!.length,
                                              itemBuilder: (_ctx, index) {
                                                return InkWell(
                                                    onTap: () {
                                                      context
                                                          .read<PharmacyBloc>()
                                                          .add(SelectModePaiementPharmacie(
                                                              modePaiement:
                                                                  stateU.listModePaiement![
                                                                      index]));
                                                    },
                                                    child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30),
                                                                border:
                                                                    Border
                                                                        .all()),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 15,
                                                                vertical: 5),
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                vertical:
                                                                    kMarginY /
                                                                        2,
                                                                horizontal:
                                                                    kMarginX),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                                child: Container(
                                                                    child: Text(
                                                              _format.capitalizeFirstLetter(
                                                                  stateU
                                                                      .listModePaiement![
                                                                          index]
                                                                      .libelle),
                                                              style:
                                                                  TextStyle(),
                                                            ))),
                                                            Checkbox(
                                                                shape:
                                                                    CircleBorder(),
                                                                activeColor:
                                                                    ColorsApp
                                                                        .primary,
                                                                checkColor:
                                                                    ColorsApp
                                                                        .white,
                                                                value: stateU
                                                                            .listModePaiement![
                                                                        index] ==
                                                                    state
                                                                        .selectedModePaiement,
                                                                onChanged:
                                                                    (val) {
                                                                  context
                                                                      .read<
                                                                          MarketBloc>()
                                                                      .add(SelectModePaiementPanier(
                                                                          modePaiement:
                                                                              stateU.listModePaiement![index]));
                                                                })
                                                          ],
                                                        )));
                                              },
                                            ))),
                                  ])))))),
                  Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: kMarginX, vertical: kMarginY),
                      child: AppButton(
                          size: MainAxisSize.min,
                          bgColor: ColorsApp.primary,
                          text: 'Payer',
                          onTap: () => context
                              .read<MarketBloc>()
                              .add(NewLivraisonProduit())))
                ]))));
  }
}
