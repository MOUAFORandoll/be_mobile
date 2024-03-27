import 'package:BabanaExpress/presentation/components/Widget/k_home_info.dart';
import 'package:BabanaExpress/presentation/livraison/NewLivraisonPage.dart';
import 'package:BabanaExpress/presentation/pharmacy/HistoriqueLivraisonMedicamentView.dart';
import 'package:BabanaExpress/presentation/pharmacy/NewLivraisonMedicamentPage.dart';
import 'package:BabanaExpress/utils/Services/validators.dart';
import 'package:BabanaExpress/utils/constants/assets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:BabanaExpress/presentation/components/Widget/HomeModuleComponent.dart';
import 'package:BabanaExpress/presentation/components/Widget/icon_svg.dart';

class PharmacyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) => Container(
            padding:
                EdgeInsets.symmetric(vertical: kMarginY, horizontal: kMarginX),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              HomeModuleComponent(
                title: 'ht2'.tr(),
                titleBtn: 'pharmacie'.tr(),
                image: Assets.medical,
                onTap: () => AutoRouter.of(context)
                    .pushNamed(NewLivraisonMedicamentPage.routeName),
              ),
              HistoriqueLivraisonMedicamentView()
            ])));
  }
}
