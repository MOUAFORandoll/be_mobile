import 'package:BabanaExpress/presentation/livraison/SuccesLivraisonPage.dart';
import 'package:BabanaExpress/presentation/pharmacy/InfolieuxlivraisonView.dart';
import 'package:BabanaExpress/presentation/pharmacy/PaiementPharmacyPage.dart';

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
            appBar: AppBar(
              title: Text('Pharmacy'),
              leading: AppBackButton(),
              centerTitle: true,
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
}
