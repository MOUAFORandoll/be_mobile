import 'package:BabanaExpress/presentation/components/Widget/EmptyLivraisonsComponent.dart';
import 'package:BabanaExpress/presentation/components/Widget/ErrorReloadComponent.dart';
import 'package:BabanaExpress/presentation/components/Widget/LivraisonUserComponent.dart';
import 'package:BabanaExpress/presentation/components/Widget/ShimmerLivraison.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

import 'package:BabanaExpress/application/export_bloc.dart';

@RoutePage()
class HistoriqueLivraisonPage extends StatelessWidget {
  HistoriqueLivraisonPage();
  static const routeName = '/livraison/list';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LivraisonBloc, LivraisonState>(
        listener: (context, state) async {},
        builder: (context, state) => Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: AppBackButton(),
                title: Text('Vos livraisons'.tr()),
                centerTitle: true,
              ),
              body: Container(
                margin: EdgeInsets.only(top: kMarginY * 2)
                    .add(EdgeInsets.symmetric(horizontal: kMarginX * 2)),
                child: SingleChildScrollView(
                  child: state.isLoadedLivraison == 0
                      ? ShimmerLivraison()
                      : state.isLoadedLivraison == 2
                          ? ErrorReloadComponent(
                              onTap: () =>
                                  BlocProvider.of<LivraisonBloc>(context)
                                      .add(HistoriqueUserLivraison()),
                            )
                          : state.userLivraisonList!.length == 0
                              ? EmptyLivraisonsComponent()
                              : ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: state.userLivraisonList!.length,
                                  // controller: state,
                                  itemBuilder: (_, index) =>
                                      LivraisonUserComponent(
                                        livraison:
                                            state.userLivraisonList![index],
                                      )),
                ),
              ),
            ));
  }
}
