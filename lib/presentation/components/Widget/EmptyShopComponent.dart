import 'package:BabanaExpress/application/export_bloc.dart'; 
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/routes/app_router.gr.dart';
import 'package:BabanaExpress/utils/constants/assets.dart'; 

// ignore: must_be_immutable
class EmptyShopComponent extends StatelessWidget {
  var type;
  EmptyShopComponent({this.type = 0});

  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: getHeight(context) / 6),
        padding: EdgeInsets.symmetric(vertical: kMarginY),
        decoration: BoxDecoration(
          // color: ColorsApp.white,

          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                height: getHeight(context) / 3.5,
                margin: EdgeInsets.only(left: kMarginX),
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage(Assets.empty_shop)))),
            Container(
                padding: EdgeInsets.symmetric(
                    horizontal: kMarginX, vertical: kMarginY),
                child: Text(
                  'Hey, Your Cart Is Empty !',
                  style:
                      TextStyle(fontSize: kBasics, fontWeight: FontWeight.w700),
                )),
            Container(
                padding: EdgeInsets.symmetric(
                    horizontal: kMarginX, vertical: kMarginY),
                child: Text(
                  'Retourner en arriere et ajouter des produits a votre panier.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: kDescription,
                  ),
                )),
            Container(
                margin: EdgeInsets.only(bottom: kMarginY),
                padding: EdgeInsets.symmetric(
                    horizontal: kMarginX, vertical: kMarginY),
                child: AppButton(
                  size: MainAxisSize.max,
                  bgColor: ColorsApp.primary,
                  text: 'Go Back',
                  onTap: () {
                    context.read<HomeBloc>().add(SetIndexEvent(index: 2));
                    AutoRouter.of(context).replaceAll([HomeRoute()]);
                  },
                ))
          ],
        ));
  }
}
