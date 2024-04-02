// ignore_for_file: must_be_immutable

import 'package:BabanaExpress/application/model/exportmodel.dart';
import 'package:BabanaExpress/core.dart';
import 'package:BabanaExpress/presentation/components/Widget/colisComponentUser.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

@RoutePage()
class LivraisonDataPage extends StatelessWidget {
  LivraisonModel livraison;
  LivraisonDataPage({required this.livraison});
  static const routeName = '/livraison/data-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: AppBackButton(),
          title: Text('yColis'.tr()),
          centerTitle: true,
        ),
        body: RefreshIndicator(
          color: ColorsApp.second,
          onRefresh: () =>
              Future.delayed(Duration(seconds: 5), () => initLoad(context)),
          child: Container(
            margin: EdgeInsets.only(top: kMarginY * 2)
                .add(EdgeInsets.symmetric(horizontal: kMarginX * 2)),
            child: SingleChildScrollView(
                child: Column(children: [
              GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15.0,
                      childAspectRatio: 5,
                      mainAxisExtent: 200,
                      mainAxisSpacing: 15.0),
                  itemCount: livraison.colis.length,
                  itemBuilder: (_ctx, index) =>
                      ColisComponentUser(colis: livraison.colis[index])),
            ])),
          ),
        ));
  }
}
