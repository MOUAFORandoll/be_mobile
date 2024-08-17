import 'package:BabanaExpress/core.dart';

import 'package:BabanaExpress/presentation/components/Widget/global_bottom_sheet.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:BabanaExpress/presentation/livraison/PaiementPage.dart';
import 'package:BabanaExpress/presentation/livraison/type2/SuccesLivraisonType2Page.dart';
import 'package:BabanaExpress/utils/functions/formatData.dart';
import 'InfoColis.dart';
import 'InfoLIvraison.dart';

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
    return BlocBuilder<UserBloc, UserState>(
        builder: (contextU, stateU) =>
            BlocConsumer<LivraisonBloc, LivraisonState>(
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

                    CustomFlush().error(
                      content: state.errorMessage!,
                    );
                  } else if (state.isRequest == 2) {
                    EasyLoading.dismiss();
                    if (stateU.listModePaiement!.length == 0) {
                      context.read<UserBloc>().add(GetModePaiement());
                    }
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
                            .pushNamed(SuccesLivraisonType2Page.routeName);
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: kMarginX,
                                                vertical: kMarginY),
                                            decoration: BoxDecoration(
                                                color: state.indexType2 == 0
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
                                                color: state.indexType2 == 0
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
                                                color: state.indexType2 == 0
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
                                                color: state.indexType2 == 1
                                                    ? ColorsApp.white
                                                    : ColorsApp.primary,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ))
                                      ]),
                                ),
                                state.indexType2 == 0
                                    ? InfoColis()
                                    : InfoLIvraison(),
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
                          child: state.indexType2 == 0
                              ? AppButton(
                                  size: MainAxisSize.max,
                                  // bgColor: (state.indexType2 == 0)
                                  //     ? !(state.selectedVIlle != null &&
                                  //             state.selected_recuperation_point !=
                                  //                 null &&
                                  //             state.contactEmetteur!.text.length != 0 &&
                                  //             state.description!.text.length != 0)
                                  //         ? ColorsApp.grey
                                  //         : ColorsApp.primary
                                  //     : (state.listColis!.length == 0)
                                  //         ? ColorsApp.grey
                                  //         : ColorsApp.primary,
                                  text: 'ynext'.tr(),
                                  onTap: () {
                                    // if (state.indexType2 == 0) {
                                    //   if ((state.selectedVIlle != null &&
                                    //       state.selected_recuperation_point != null &&
                                    //       state.contactEmetteur!.text.length != 0 &&
                                    //       state.description!.text.length != 0)) {
                                    if (state.formKeyColis!.currentState!
                                        .validate()) {
                                      context
                                          .read<LivraisonBloc>()
                                          .add(VerifyFormLivraisonType2Event());
                                      // }
                                    }
                                  },
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                      AppButton(
                                          size: MainAxisSize.max,
                                          bgColor: state.indexType2 == 0
                                              ? ColorsApp.grey
                                              : ColorsApp.primary,
                                          text: 'yback'.tr(),
                                          onTap: () {
                                            context
                                                .read<LivraisonBloc>()
                                                .add(BackIndexType2Event());
                                          }),
                                      AppButton(
                                        size: MainAxisSize.max,
                                        // bgColor: (state.indexType2 == 0)
                                        //     ? !(state.selectedVIlle != null &&
                                        //             state.selected_recuperation_point !=
                                        //                 null &&
                                        //             state.contactEmetteur!.text
                                        //                     .length !=
                                        //                 0 &&
                                        //             state.description!.text.length != 0)
                                        //         ? ColorsApp.grey
                                        //         : ColorsApp.primary
                                        //     : (state.listColis!.length == 0)
                                        //         ? ColorsApp.grey
                                        //         : ColorsApp.primary,
                                        text: 'yeval'.tr(),
                                        onTap: () {
                                          if (state.indexType2 == 1) {
                                            context
                                                .read<LivraisonBloc>()
                                                .add(CalculFraisType2());
                                          }
                                        },
                                      ),
                                    ])),
                    )));
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
                      margin: EdgeInsets.only(top: kMarginY, bottom: 8),
                      child: AppButton(
                          text: 'yvalidate'.tr(),
                          disabled: state.selectedModePaiement == null,
                          // width: getWidth(context) / 2.5,
                          size: MainAxisSize.max,
                          bgColor: ColorsApp.primary,
                          onTap: () => context
                              .read<LivraisonBloc>()
                              .add(NewLivraisonType2())),
                    ),
                  ]))) /* .whenComplete(() {
        BlocProvider.of<LivraisonBloc>(context).add(NoValidate());
      }) */
      ;
}
