import 'package:BabanaExpress/presentation/components/Widget/BtnNextComponent.dart';
import 'package:BabanaExpress/presentation/pharmacy/HistoriqueLivraisonMedicamentMin.dart';
import 'package:BabanaExpress/routes/app_router.gr.dart';
import '../../presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/application/export_bloc.dart';

class PharmacyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) => Container(
            padding: EdgeInsets.symmetric(horizontal: kMarginX),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Container(
                  child: Text('Historiques de livraisons de medicaments'),
                ),
                BtnNextComponent(
                  onTap: () => AutoRouter.of(context)
                      .push(HistoriqueLivraisonMedicamentRoute()),
                )
              ]),
              SingleChildScrollView(child: HistoriqueLivraisonMedicamentMin())
            ])));
  }
}
