import 'package:BabanaExpress/core.dart';

import 'package:BabanaExpress/presentation/components/Widget/global_bottom_sheet.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:BabanaExpress/presentation/livraison/PaiementPage.dart';
import 'package:BabanaExpress/presentation/livraison/type2/InfoRecuperationColisType2.dart';
import 'package:BabanaExpress/presentation/livraison/type2/InfoLivraisonType2.dart';
import 'package:BabanaExpress/presentation/livraison/type2/SuccesLivraisonType2Page.dart';
import 'package:BabanaExpress/utils/functions/formatData.dart';
import 'package:BabanaExpress/core.dart';
import 'package:BabanaExpress/presentation/components/Widget/app_dropdown.dart';
import 'package:BabanaExpress/presentation/components/Widget/colisComponentUserView.dart';
import 'package:BabanaExpress/presentation/components/Widget/delivry_widget_title.dart';

import 'package:BabanaExpress/presentation/components/Widget/global_bottom_sheet.dart';
import 'package:BabanaExpress/presentation/components/Widget/recuperation_delivery_zone_widget.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:BabanaExpress/presentation/livraison/PaiementPage.dart';
import 'package:BabanaExpress/presentation/livraison/type1/SuccesLivraisonType1Page.dart';
import 'package:BabanaExpress/utils/Services/validators.dart';
import 'package:BabanaExpress/utils/functions/formatData.dart';
import '../../../application/model/exportmodel.dart';

@RoutePage()
class NewLivraisonType2Page extends StatefulWidget {
  const NewLivraisonType2Page({super.key});
  static const routeName = '/livraison/type2';

  @override
  State<NewLivraisonType2Page> createState() => _NewLivraisonType2PageState();
}

class _NewLivraisonType2PageState extends State<NewLivraisonType2Page> {
  var _format = new FormatData();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LivraisonBloc, LivraisonState>(
        listener: (context, state) {
          if (state.isRequest == 1) {
            EasyLoading.show(
                indicator: CircularProgressIndicator(
                  color: ColorsApp.second,
                ),
                dismissOnTap: true,
                maskType: EasyLoadingMaskType.black);
          } else if (state.isRequest == 3) {
            EasyLoading.dismiss();

            showError('Une erreur est survenue', context);
          } else if (state.isRequest == 2) {
            EasyLoading.dismiss();

            validateLivraison(context);
            print('-----44--------*********');
          } else if (state.isRequest == 4) {
            // AutoRouter.of(context).pop();
            EasyLoading.show(
                indicator: CircularProgressIndicator(
                  color: ColorsApp.second,
                ),
                dismissOnTap: true,
                maskType: EasyLoadingMaskType.black);
          } else if (state.isRequest == 5) {
            print('-----paiemnt--------*********');

            EasyLoading.dismiss();
            if (state.paiement_url != null) {
              if (state.paiement_url == 'next') {
                BlocProvider.of<UserBloc>(context)..add(GetUserEvent());
                BlocProvider.of<HomeBloc>(context).add(UserDataEvent());
                AutoRouter.of(context)
                    .pushNamed(SuccesLivraisonType1Page.routeName);
              } else {
                AutoRouter.of(context).pushNamed(PaiementPage.routeName);
              }
            }

            // context.read<LivraisonBloc>().add(HistoriqueUserLivraison());
            //

            print('-----44--------*********');
          }
        },
        builder: (context, state) => Scaffold(
              backgroundColor: ColorsApp.bg,
              appBar: AppBarCustom(
                title: 'yNewLivraison'.tr(),
              ),
              body: RefreshIndicator(
                color: ColorsApp.second,
                onRefresh: () => Future.delayed(
                    Duration(seconds: 5), () => initLoad(context)),
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: kMarginX, vertical: kMarginY),
                  padding: EdgeInsets.symmetric(vertical: kMarginY),
                  child: Column(children: [
                    Expanded(
                        child: SingleChildScrollView(
                      child: Column(children: [
                        Container(
                          margin: EdgeInsets.only(bottom: kMarginY * 2),
                          child: state.isLoadVille == 0
                              ? CircularProgressIndicator(
                                  color: ColorsApp.primary)
                              : state.isLoadVille == 2
                                  ? InkWell(
                                      child: Text('Error'),
                                      onTap: () => context
                                          .read<LivraisonBloc>()
                                          .add(GetVilleAndCategoryEvent()))
                                  : Container(
                                      child: state.villeList!.isEmpty
                                          ? Container()
                                          : AppDropdown<VilleModel>(
                                              value: state.selectedVIlle,
                                              title: 'yselectville'.tr(),
                                              hint:
                                                  'Appuyer pour selectionner votre ville'
                                                      .tr(),
                                              items: state.villeList!,
                                              onChanged: (newValue) {
                                                context
                                                    .read<LivraisonBloc>()
                                                    .add(SelectedVille(
                                                        ville: newValue
                                                            as VilleModel));
                                                context
                                                    .read<LivraisonBloc>()
                                                    .add(GetRecupPointEvent(
                                                        ville: newValue.id));
                                              },
                                              itemLabelBuilder:
                                                  (VilleModel value) =>
                                                      value.libelle,
                                            )),
                        ),
                        Container(
                          alignment: Alignment.center,
                          // margin: EdgeInsets.only(top: kMarginY * 3),
                          child: DelivryWidgetTitle(
                            title: 'Information sur le colis',
                            icon: FontAwesomeIcons.clipboardList,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: ColorsApp.greyNew,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: kMarginY, horizontal: kMarginX),
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(vertical: kMarginY * 2),
                          child: ColisComponentUserView(
                              colis: state.listColis!.length >= 1
                                  ? state.listColis![0]
                                  : null,
                              onTap: () => AutoRouter.of(context).pushNamed(
                                  InfoRecuperationColisType2Page.routeName)),
                        ),
                        DelivryWidgetTitle(
                          title: 'Lieux de livraison',
                          icon: FontAwesomeIcons.locationDot,
                        ),
                        RecuperationDeliveryZoneWidget(
                            title: state.selected_livraison_point != null
                                ? '${state.selected_livraison_point!.quartier}, ${state.selected_livraison_point!.ville}'
                                : 'Appuyer pour definir Zone de recuperation',
                            isSelected: state.selected_livraison_point != null,
                            onTap: () => AutoRouter.of(context)
                                .pushNamed(InfoLivraisonType2Page.routeName)),
                        Container(
                          margin: EdgeInsets.only(bottom: kMarginY),
                          child: TextFormField(
                            controller: state.description,
                            onChanged: (value) {},
                            validator: (value) {
                              return Validators.isValidUsername(value!);
                            },
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                            maxLines: 10,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: ColorsApp.primary, width: 1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: ColorsApp.red, width: 1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: ColorsApp.grey, width: 1),
                                borderRadius: BorderRadius.circular(8),
                                // borderSide:
                                //     BorderSide(color: ColorsApp.tird, width: 1),
                              ),
                              errorStyle: TextStyle(
                                fontSize: 8,
                              ),
                              labelStyle: TextStyle(
                                color: ColorsApp.grey,

                                // fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                              labelText:
                                  'Donnez quelques details le lieux de livraison des colis'
                                      .tr(),
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
                    )),
                    Container(
                        // margin: EdgeInsets.symmetric(
                        //   vertical: kMarginY,
                        // ),
                        // height: getHeight(context) * .0,
                        child: state.indexType1 == 0
                            ? AppButtonSecond(
                                size: MainAxisSize.max,
                                bgColor: ColorsApp.second,
                                text: 'ynext'.tr(),
                                disabled: !(state.selectedVIlle != null &&
                                    state.selected_recuperation_point != null &&
                                    state.contactRecepteur!.text.length != 0 &&
                                    state.selected_livraison_point != null &&
                                    state.listColis!.length != 0 &&
                                    state.description!.text.length != 0),
                                onTap: () {
                                  context
                                      .read<LivraisonBloc>()
                                      .add(CalculFraisType2());
                                  // if (state.indexType1 == 0) {
                                  //   if ((state.selectedVIlle != null &&
                                  //       state.selected_recuperation_point !=
                                  //           null &&
                                  //       state.contactEmetteur!.text.length !=
                                  //           0 &&
                                  //       state.description!.text.length != 0)) {
                                  //     context
                                  //         .read<LivraisonBloc>()
                                  //         .add(VerifyFormLivraisonType1Event());
                                  //   }
                                  // }
                                },
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                    AppButtonSecond(
                                        marginAdd: EdgeInsets.symmetric(
                                            horizontal: kMarginX),
                                        size: MainAxisSize.max,
                                        bgColor: state.indexType1 == 0
                                            ? ColorsApp.grey
                                            : ColorsApp.primary,
                                        text: 'yback'.tr(),
                                        onTap: () {
                                          context
                                              .read<LivraisonBloc>()
                                              .add(BackIndexType1Event());
                                        }),
                                    AppButtonSecond(
                                      size: MainAxisSize.max,
                                      bgColor: (state.indexType1 == 0)
                                          ? !(state.selectedVIlle != null &&
                                                  state.selected_recuperation_point !=
                                                      null &&
                                                  state.contactEmetteur!.text
                                                          .length !=
                                                      0 &&
                                                  state.description!.text
                                                          .length !=
                                                      0)
                                              ? ColorsApp.grey
                                              : ColorsApp.primary
                                          : (state.listColis!.length == 0)
                                              ? ColorsApp.grey
                                              : ColorsApp.primary,
                                      text: 'yeval'.tr(),
                                      onTap: () {
                                        if (state.indexType1 == 1) {
                                          if (state.listColis!.length != 0) {
                                            context
                                                .read<LivraisonBloc>()
                                                .add(CalculFraisType1());
                                          }
                                        }
                                      },
                                    ),
                                  ])),
                  ]),
                ),
              ),
            ));
  }

  validateLivraison(contextA) => GlobalBottomSheet.show(
          maxHeight: getHeight(context) * .4,
          context: context,
          title: 'Moyen de paiement'.tr(),
          widget: BlocBuilder<LivraisonBloc, LivraisonState>(
              builder: (context, state) =>
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(horizontal: kMarginX)
                            .add(EdgeInsets.only(
                          top: kMarginY,
                        )),
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
                    BlocBuilder<UserBloc, UserState>(
                        builder: (contextU, stateU) => SingleChildScrollView(
                                child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: stateU.listModePaiement!.length,
                              itemBuilder: (_ctx, index) {
                                return InkWell(
                                    onTap: () {
                                      context.read<LivraisonBloc>().add(
                                          SelectModePaiement(
                                              modePaiement: stateU
                                                  .listModePaiement![index]));
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            border: Border.all()),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 5),
                                        margin: EdgeInsets.symmetric(
                                            vertical: kMarginY / 2,
                                            horizontal: kMarginX),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                                child: Container(
                                                    child: Text(
                                              _format.capitalizeFirstLetter(
                                                  stateU
                                                      .listModePaiement![index]
                                                      .libelle),
                                              style: TextStyle(),
                                            ))),
                                            Checkbox(
                                                shape: CircleBorder(),
                                                activeColor: ColorsApp.primary,
                                                checkColor: ColorsApp.white,
                                                value: stateU.listModePaiement![
                                                        index] ==
                                                    state.selectedModePaiement,
                                                onChanged: (val) {
                                                  context
                                                      .read<LivraisonBloc>()
                                                      .add(SelectModePaiement(
                                                          modePaiement: stateU
                                                                  .listModePaiement![
                                                              index]));
                                                })
                                          ],
                                        )));
                              },
                            ))),
                    Container(
                        margin: EdgeInsets.only(top: kMarginY),
                        child: Column(
                          // mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 8),
                              child: AppButtonSecond(
                                  text: 'yvalidate'.tr(),
                                  // width: getWidth(context) / 2.5,
                                  size: MainAxisSize.max,
                                  bgColor: ColorsApp.second,
                                  onTap: () => context
                                      .read<LivraisonBloc>()
                                      .add(NewLivraisonType2())),
                            ),
                          ],
                        ))
                  ]))) /* .whenComplete(() {
        BlocProvider.of<LivraisonBloc>(context).add(NoValidate());
      }) */
      ;
}
