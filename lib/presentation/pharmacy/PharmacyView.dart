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
              Container(
                child: Text('Historiques de livraisons de medicaments'),
              ),
              SingleChildScrollView(child: HistoriqueLivraisonMedicamentView())
            ])));
  }
}
