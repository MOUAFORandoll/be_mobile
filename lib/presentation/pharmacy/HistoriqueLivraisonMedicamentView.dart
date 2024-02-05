import 'package:BananaExpress/presentation/components/Widget/EmptyLivraisonsComponent.dart';
import 'package:BananaExpress/presentation/components/Widget/ShimmerLivraison.dart';
import 'package:BananaExpress/presentation/components/exportcomponent.dart';
import 'package:BananaExpress/application/export_bloc.dart';
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
                  : Container(
                      child: SingleChildScrollView(
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount:
                                  state.userLivraisonMedicamentList!.length,
                              // controller: state,
                              itemBuilder: (_, index) =>
                                  LivraisonMedicamentUserComponent(
                                    livraison: state
                                        .userLivraisonMedicamentList![index],
                                  )))
                    );
    });
  }
}
