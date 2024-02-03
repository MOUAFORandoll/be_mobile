import '../../presentation/components/exportcomponent.dart';
import 'package:BananaExpress/application/export_bloc.dart';

import 'choosemedicament_view.dart';

@RoutePage()
class PharmacyPage extends StatefulWidget {
  static const String routeName = '/pharmacypage';

  @override
  _PharmacyPageState createState() => _PharmacyPageState();
}

class _PharmacyPageState extends State<PharmacyPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PharmacyBloc, PharmacyState>(
        listener: (context, state) {},
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
                          : ChooseMedicamentView(),
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
                                        .read<LivraisonBloc>()
                                        .add(BackIndexEvent());
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
                                          VerifyFormChooseMedicamentEvent())
                                      : context
                                          .read<LivraisonBloc>()
                                          .add(CalculFrais());
                                },
                              ),
                            ])),
                  ],
                ))));
  }
}
