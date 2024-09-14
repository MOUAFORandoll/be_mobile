import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/utils/constants/assets.dart';

// ignore: must_be_immutable
class EmptyShopComponent extends StatelessWidget {
  EmptyShopComponent();

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
                  style: Theme.of(context).textTheme.bodySmall,
                )),
            Container(
                padding: EdgeInsets.symmetric(
                    horizontal: kMarginX, vertical: kMarginY),
                child: Text(
                  'Retourner en arriere et ajouter des produits a votre panier.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
                )),
            Container(
                margin: EdgeInsets.only(bottom: kMarginY),
                padding: EdgeInsets.symmetric(
                    horizontal: kMarginX, vertical: kMarginY),
                child: AppButton(
                  text: 'Go Back',
                  onTap: () {
                    AutoRouter.of(context).pop();
                  },
                ))
          ],
        ));
  }
}
