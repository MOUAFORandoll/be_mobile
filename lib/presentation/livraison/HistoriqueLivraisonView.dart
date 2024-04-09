import 'package:BabanaExpress/presentation/components/Widget/EmptyLivraisonsComponent.dart';
import 'package:BabanaExpress/presentation/components/Widget/ErrorReloadComponent.dart';
import 'package:BabanaExpress/presentation/components/Widget/LivraisonUserComponent.dart';
import 'package:BabanaExpress/presentation/components/Widget/ShimmerLivraison.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

import 'package:BabanaExpress/application/export_bloc.dart';

// ignore: must_be_immutable
class HistoriqueLivraisonView extends StatelessWidget {
  HistoriqueLivraisonView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LivraisonBloc, LivraisonState>(
        builder: (context, state) {
      return RefreshIndicator(
        color: ColorsApp.second,
        onRefresh: () => Future.delayed(
            Duration(seconds: 5),
            () => BlocProvider.of<LivraisonBloc>(context)
                .add(HistoriqueUserLivraison())),
        child: state.isLoadedLivraison == 0
            ? ShimmerLivraison()
            : state.isLoadedLivraison == 2
                ? ErrorReloadComponent(
                    onTap: () => BlocProvider.of<LivraisonBloc>(context)
                        .add(HistoriqueUserLivraison()),
                  )
                : state.userLivraisonList!.length == 0
                    ? EmptyLivraisonsComponent()
                    : ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.userLivraisonList!.length,
                        // controller: state,
                        itemBuilder: (_, index) => LivraisonUserComponent(
                              livraison: state.userLivraisonList![index],
                            )),
      );
    });
  }
}
