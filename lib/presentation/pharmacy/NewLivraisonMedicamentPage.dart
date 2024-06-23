import 'package:BabanaExpress/presentation/components/Widget/app_bar_custom.dart';
import 'package:BabanaExpress/presentation/livraison/SuccesLivraisonPage.dart';
import 'package:BabanaExpress/presentation/pharmacy/InfolieuxlivraisonView.dart';
import 'package:BabanaExpress/presentation/pharmacy/PaiementPharmacyPage.dart';
import 'package:BabanaExpress/utils/functions/formatData.dart';

import '../../presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/application/export_bloc.dart';

import 'ChooseMedicamentView.dart';

@RoutePage()
class NewLivraisonMedicamentPage extends StatefulWidget {
  static const String routeName = '/pharmacypage';

  @override
  _NewLivraisonMedicamentPageState createState() =>
      _NewLivraisonMedicamentPageState();
}

class _NewLivraisonMedicamentPageState
    extends State<NewLivraisonMedicamentPage> {
  var _format = new FormatData();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PharmacyBloc, PharmacyState>(
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
          } else if (state.isRequest == 2) {
            print('-----44--------**000*******');

            EasyLoading.dismiss();

            validateLivraisonMedicaments(context);
            print('-----44--------**000*******');
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
                AutoRouter.of(context).pushNamed(SuccesLivraisonPage.routeName);
              } else {
                AutoRouter.of(context).pushNamed(PaimentPharmacyPage.routeName);
              }
            }

            print('-----44--------*********');
          }
        },
        builder: (context, state) => Scaffold(
            appBar: AppBarCustom(
              title: 'Pharmacy'.tr(),
            ),
            backgroundColor: ColorsApp.bg,
            body: Container(
                height: getHeight(context),
                margin: EdgeInsets.symmetric(
                    horizontal: kMarginX, vertical: kMarginY),
                child: Column(
                  children: [
                    Expanded(
                      child: state.index == 0
                          ? ChooseMedicamentView()
                          : InfoLieuxLIvraisonView(),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(
                          vertical: kMarginY * 1.5,
                          horizontal: kMarginX / 2,
                        ),
                        child: state.index == 0
                            ? AppButton(
                                size: MainAxisSize.max,
                                bgColor: state.listMedicamentChoose!.isNotEmpty
                                    ? ColorsApp.primary
                                    : ColorsApp.grey,
                                text: 'ynext'.tr(),
                                onTap: () {
                                  context
                                      .read<PharmacyBloc>()
                                      .add(VerifyFormChooseMedicamentEventP());
                                })
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                    AppButton(
                                        size: MainAxisSize.max,
                                        bgColor: state.index == 0
                                            ? ColorsApp.grey
                                            : ColorsApp.primary,
                                        text: 'yback'.tr(),
                                        onTap: () {
                                          context
                                              .read<PharmacyBloc>()
                                              .add(BackIndexEventP());
                                        }),
                                    AppButton(
                                      size: MainAxisSize.max,
                                      bgColor:
                                          state.listMedicamentChoose!.isNotEmpty
                                              ? ColorsApp.primary
                                              : ColorsApp.grey,
                                      text: 'yeval'.tr(),
                                      onTap: () {
                                        context
                                            .read<PharmacyBloc>()
                                            .add(CalculFraisP());
                                      },
                                    ),
                                  ])),
                  ],
                ))));
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
                      BlocBuilder<UserBloc, UserState>(
                          builder: (contextU, stateU) => Expanded(
                                  child: SingleChildScrollView(
                                      child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: stateU.listModePaiement!.length,
                                itemBuilder: (_ctx, index) {
                                  return InkWell(
                                      onTap: () {
                                        context.read<PharmacyBloc>().add(
                                            SelectModePaiementPharmacie(
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
                                                        .listModePaiement![
                                                            index]
                                                        .libelle),
                                                style: TextStyle(),
                                              ))),
                                              Checkbox(
                                                  shape: CircleBorder(),
                                                  activeColor:
                                                      ColorsApp.primary,
                                                  checkColor: ColorsApp.white,
                                                  value: stateU
                                                              .listModePaiement![
                                                          index] ==
                                                      state
                                                          .selectedModePaiement,
                                                  onChanged: (val) {
                                                    context.read<PharmacyBloc>().add(
                                                        SelectModePaiementPharmacie(
                                                            modePaiement: stateU
                                                                    .listModePaiement![
                                                                index]));
                                                  })
                                            ],
                                          )));
                                },
                              )))),
                      Container(
                          margin: EdgeInsets.only(top: kMarginY),
                          child: Column(
                            // mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 8),
                                child: AppButton(
                                    text: 'yvalidate'.tr(),
                                    // width: getWidth(context) / 2.5,
                                    size: MainAxisSize.max,
                                    bgColor: ColorsApp.primary,
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
}
