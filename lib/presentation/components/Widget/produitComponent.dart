// ignore: must_be_immutable
import 'package:BabanaExpress/presentation/_commons/theming/app_theme.dart';
import 'package:BabanaExpress/presentation/components/Widget/ShimmerProduitBox.dart';
import 'package:BabanaExpress/routes/app_router.gr.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

import 'package:BabanaExpress/application/model/exportmodel.dart';

// ignore: must_be_immutable
class ProduitComponent extends StatelessWidget {
  ProduitModel produit;
  var height, index, type;

  ProduitComponent(
      {required this.produit,
      required this.index,
      this.height,
      this.type = 'home',
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          // height: getHeight(context) / 2.7,
          // margin: EdgeInsets.symmetric(horizontal: 5),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0xffDDDDDD),
                  blurRadius: 0, // Soften the shaodw
                  spreadRadius: 0,
                  offset: Offset(-2.0, 3),
                )
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: produit.images[0].src,
                  imageBuilder: (context, imageProvider) {
                    return Container(
                        height: getHeight(context) / 8,
                        width: getWith(context) * 1.1,
                        decoration: BoxDecoration(
                          color: ColorsApp.grey,
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  Colors.transparent, BlendMode.colorBurn)),
                        ));
                  },
                  placeholder: (context, url) {
                    return /* Container(
                      child: Center(
                          child: CircularProgressIndicator(
                        color: ColorsApp.skyBlue,
                      )),
                    ) */

                        ShimmerProduitBox();
                  },
                  errorWidget: (context, url, error) {
                    return Container(
                        height: getHeight(context) / 8,
                        width: getWith(context) * 1.1,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage('assets/logo/logoNew.png'),
                        )));
                  },
                ),
              ]),
              Container(
                  width: getWith(context) / 2,
                  margin: EdgeInsets.symmetric(horizontal: kMarginX / 2),
                  child: Text(produit.titre,
                      overflow: TextOverflow.fade,
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      style: TexteStyle().secondaryTextStyle)),
              Container(
                  width: getWith(context) / 2,
                  margin: EdgeInsets.symmetric(horizontal: kMarginX / 2),
                  child: Text('XAF ' + produit.prix.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: TexteStyle().bprimaryTextStyle)),
            ],
          )),
      onTap: () => AutoRouter.of(context).push(ProduitRoute(produit: produit)),
    );
  }
}
