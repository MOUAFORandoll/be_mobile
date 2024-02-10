import 'package:BabanaExpress/presentation/pharmacy/Infolieuxlivraison_view.dart';

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
    return BlocBuilder<PharmacyBloc, PharmacyState>(
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
                                bgColor: ColorsApp.second,
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
