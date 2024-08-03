import 'package:BabanaExpress/core.dart';
import 'package:BabanaExpress/presentation/components/Button/app_button_second.dart';
import 'package:BabanaExpress/presentation/components/Widget/app_dropdown.dart';

import 'package:BabanaExpress/presentation/components/Widget/global_bottom_sheet.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:BabanaExpress/presentation/livraison/PaiementPage.dart';
import 'package:BabanaExpress/presentation/livraison/type1/SuccesLivraisonType1Page.dart';
import 'package:BabanaExpress/utils/functions/formatData.dart';
import '../../../application/model/exportmodel.dart';
import 'InfoColis.dart';
import 'InfoLIvraison.dart';

@RoutePage()
class NewLivraisonType1Page extends StatefulWidget {
  const NewLivraisonType1Page({super.key});
  static const routeName = '/livraison/type1';

  @override
  State<NewLivraisonType1Page> createState() => _NewLivraisonType1PageState();
}

class _NewLivraisonType1PageState extends State<NewLivraisonType1Page> {
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
            AutoRouter.of(context).pop();
            EasyLoading.dismiss();
            if (state.paiement_url != null) {
              if (state.paiement_url == 'next') {
                BlocProvider.of<UserBloc>(context)..add(GetUserEvent());
                BlocProvider.of<HomeBloc>(context).add(UserDataEvent());
                AutoRouter.of(context)
                    .pushNamed(SuccesLivraisonType1Page.routeName);
              } else {
                AutoRouter.of(context).pushNamed(PaimentPage.routeName);
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
                  height: getHeight(context) * .7,
                  margin: EdgeInsets.symmetric(
                      horizontal: kMarginX, vertical: kMarginY),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: kMarginX,
                                        vertical: kMarginY),
                                    decoration: BoxDecoration(
                                        color: state.indexType1 == 0
                                            ? ColorsApp.primary
                                            : ColorsApp.white,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    height: 30,
                                    width: 30,
                                    alignment: Alignment.center,
                                    child: Text(
                                      '1',
                                      style: TextStyle(
                                        color: state.indexType1 == 0
                                            ? ColorsApp.white
                                            : ColorsApp.primary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                                Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: kMarginX,
                                        vertical: kMarginY),
                                    decoration: BoxDecoration(
                                        color: state.indexType1 == 0
                                            ? ColorsApp.white
                                            : ColorsApp.primary,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    height: 30,
                                    width: 30,
                                    alignment: Alignment.center,
                                    child: Text(
                                      '2',
                                      style: TextStyle(
                                        color: state.indexType1 == 1
                                            ? ColorsApp.white
                                            : ColorsApp.primary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ))
                              ]),
                        ),
                        state.indexType1 == 0 ? InfoLIvraison() : InfoColis(),
                      ],
                    ),
                  ),
                ),
              ),
              bottomNavigationBar: Container(
                  margin: EdgeInsets.symmetric(
                    vertical: kMarginY * 1.5,
                  ),
                  height: getHeight(context) * .1,
                  child: state.indexType1 == 0
                      ? AppButtonSecond(
                          size: MainAxisSize.max,
                          marginAdd:
                              EdgeInsets.symmetric(horizontal: kMarginX * 2),
                          bgColor: (state.indexType1 == 0)
                              ? !(state.selectedVIlle != null &&
                                      state.selected_recuperation_point !=
                                          null &&
                                      state.contactEmetteur!.text.length != 0 &&
                                      state.description!.text.length != 0)
                                  ? ColorsApp.grey
                                  : ColorsApp.primary
                              : (state.listColis!.length == 0)
                                  ? ColorsApp.grey
                                  : ColorsApp.primary,
                          textColor: (state.indexType1 == 0)
                              ? (state.selectedVIlle != null &&
                                      state.selected_recuperation_point !=
                                          null &&
                                      state.contactEmetteur!.text.length != 0 &&
                                      state.description!.text.length != 0)
                                  ? ColorsApp.white
                                  : ColorsApp.primary
                              : !(state.listColis!.length == 0)
                                  ? ColorsApp.white
                                  : ColorsApp.primary,
                          text: 'ynext'.tr(),
                          onTap: () {
                            if (state.indexType1 == 0) {
                              if ((state.selectedVIlle != null &&
                                  state.selected_recuperation_point != null &&
                                  state.contactEmetteur!.text.length != 0 &&
                                  state.description!.text.length != 0)) {
                                context
                                    .read<LivraisonBloc>()
                                    .add(VerifyFormLivraisonType1Event());
                              }
                            }
                          },
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                              AppButtonSecond(
                                  marginAdd: EdgeInsets.symmetric(
                                      horizontal: kMarginX * 2),
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
                                marginAdd:
                                    EdgeInsets.symmetric(horizontal: kMarginX),
                                size: MainAxisSize.max,
                                bgColor: (state.indexType1 == 0)
                                    ? !(state.selectedVIlle != null &&
                                            state.selected_recuperation_point !=
                                                null &&
                                            state.contactEmetteur!.text
                                                    .length !=
                                                0 &&
                                            state.description!.text.length != 0)
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
                                  bgColor: ColorsApp.primary,
                                  onTap: () => context
                                      .read<LivraisonBloc>()
                                      .add(NewLivraisonType1())),
                            ),
                          ],
                        ))
                  ]))) /* .whenComplete(() {
        BlocProvider.of<LivraisonBloc>(context).add(NoValidate());
      }) */
      ;
}
