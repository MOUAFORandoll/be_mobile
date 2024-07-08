import 'package:BabanaExpress/presentation/components/Widget/EmptyLivraisonsComponent.dart';
import 'package:BabanaExpress/presentation/components/Widget/ErrorReloadComponent.dart';
import 'package:BabanaExpress/presentation/components/Widget/ShimmerLivraison.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/application/export_bloc.dart';
import '../components/Widget/LivraisonMedicamentUserComponent.dart';

@RoutePage()
class HistoriqueLivraisonMedicamentPage extends StatefulWidget {
  HistoriqueLivraisonMedicamentPage();
  static const routeName = '/livraison-medicament/list';

  @override
  State<HistoriqueLivraisonMedicamentPage> createState() =>
      _HistoriqueLivraisonMedicamentPageState();
}

class _HistoriqueLivraisonMedicamentPageState
    extends State<HistoriqueLivraisonMedicamentPage> {
  void initState() {
    super.initState();
    context.read<PharmacyBloc>().add(HistoriqueLivraisonMedicament());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PharmacyBloc, PharmacyState>(builder: (context, state) {
      return Scaffold(
          appBar: AppBarCustom(
            title: 'Vos livraisons de medicament'.tr(),
          ),
          body: Container(
              margin: EdgeInsets.only(top: kMarginY * 2)
                  .add(EdgeInsets.symmetric(horizontal: kMarginX * 2)),
              child: SingleChildScrollView(
                  child: state.isLoadedHistoriqueLivraison == 0
                      ? ShimmerLivraison()
                      : state.isLoadedHistoriqueLivraison == 2
                          ? ErrorReloadComponent(
                              onTap: () =>
                                  BlocProvider.of<PharmacyBloc>(context)
                                      .add(HistoriqueLivraisonMedicament()),
                            )
                          : state.userLivraisonMedicamentList!.length == 0
                              ? EmptyLivraisonsComponent()
                              : ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount:
                                      state.userLivraisonMedicamentList!.length,
                                  // controller: state,
                                  itemBuilder: (_, index) =>
                                      LivraisonMedicamentUserComponent(
                                        livraison:
                                            state.userLivraisonMedicamentList![
                                                index],
                                      )))));
    });
  }
}
