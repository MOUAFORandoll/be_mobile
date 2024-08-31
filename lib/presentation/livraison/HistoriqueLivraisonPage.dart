import 'package:BabanaExpress/presentation/components/Widget/LivraisonUserComponent.dart';
import 'package:BabanaExpress/presentation/components/Widget/app_text_title.dart';

import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

import 'package:BabanaExpress/application/export_bloc.dart';

@RoutePage()
class HistoriqueLivraisonPage extends StatefulWidget {
  HistoriqueLivraisonPage();
  static const routeName = '/livraison/list';

  @override
  State<HistoriqueLivraisonPage> createState() =>
      _HistoriqueLivraisonPageState();
}

class _HistoriqueLivraisonPageState extends State<HistoriqueLivraisonPage> {
  @override
  void initState() {
    super.initState();
    context.read<LivraisonBloc>().add(HistoriqueUserLivraison());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LivraisonBloc, LivraisonState>(
        listener: (context, state) async {},
        builder: (context, state) =>
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: kMarginY * .3),
                child: AppTextTitle(
                  text: 'Vos livraisons'.tr(),
                  bolder: true,
                  big: true,
                  percent: 0.8,
                ),
              ),
              Container(
                child: SingleChildScrollView(
                  child: state.isLoadLivraison == 0
                      ? ShimmerLivraison()
                      : state.isLoadLivraison == 2
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
            ]));
  }
}
