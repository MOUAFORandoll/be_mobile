 
import 'package:BabanaExpress/presentation/pharmacy/HistoriqueLivraisonMedicamentView.dart';
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
                InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorsApp.primary,
                          borderRadius: BorderRadius.circular(50)),
                      margin: EdgeInsets.only(
                        top: kMarginY,
                      ),
                      padding: EdgeInsets.all(6)
                          .add(EdgeInsets.symmetric(horizontal: 5)),
                      child: Text(
                        'Actualiser',
                        style: TextStyle(color: ColorsApp.white),
                      ),
                    ),
                    onTap: () {
                      BlocProvider.of<PharmacyBloc>(context)
                          .add(HistoriqueLivraisonMedicament());
                    })
              ]),
              SingleChildScrollView(child: HistoriqueLivraisonMedicamentView())
            ])));
  }
}
