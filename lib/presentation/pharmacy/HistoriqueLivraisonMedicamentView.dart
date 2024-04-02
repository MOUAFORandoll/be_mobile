import 'package:BabanaExpress/presentation/components/Widget/EmptyLivraisonsComponent.dart';
import 'package:BabanaExpress/presentation/components/Widget/ShimmerLivraison.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/application/export_bloc.dart';
import '../components/Widget/LivraisonMedicamentUserComponent.dart';

// ignore: must_be_immutable
class HistoriqueLivraisonMedicamentView extends StatelessWidget {
  HistoriqueLivraisonMedicamentView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PharmacyBloc, PharmacyState>(builder: (context, state) {
      return state.isLoadedHistoriqueLivraison == 0
          ? ShimmerLivraison()
          : state.isLoadedHistoriqueLivraison == 2
              ? Text('Error')
              : state.userLivraisonMedicamentList!.length == 0
                  ? EmptyLivraisonsComponent()
                  : ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.userLivraisonMedicamentList!.length,
                      // controller: state,
                      itemBuilder: (_, index) =>
                          LivraisonMedicamentUserComponent(
                            livraison:
                                state.userLivraisonMedicamentList![index],
                          ));
    });
  }
}
