import 'package:BabanaExpress/presentation/pharmacy/Infolieuxlivraison_view.dart';
import 'package:BabanaExpress/presentation/pharmacy/paiement_pharmacy_page.dart';

import '../../presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/application/export_bloc.dart';

import 'choosemedicament_view.dart';

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
              AutoRouter.of(context).pushNamed(PaimentPharmacyPage.routeName);
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
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                bgColor: ColorsApp.primary,
                                text: state.index == 0
                                    ? 'ynext'.tr()
                                    : 'yeval'.tr(),
                                onTap: () {
                                  state.index == 0
                                      ? context.read<PharmacyBloc>().add(
                                          VerifyFormChooseMedicamentEventP())
                                      : context
                                          .read<PharmacyBloc>()
                                          .add(CalculFraisP());
                                },
                              ),
                            ])),
                  ],
                ))));
  }
}
