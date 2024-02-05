import 'package:BananaExpress/application/export_bloc.dart';

import 'package:BananaExpress/utils/constants/assets.dart';
import 'package:BananaExpress/presentation/components/exportcomponent.dart';

// ignore: must_be_immutable
class EmptyLivraisonsComponent extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: getHeight(context) / 6),
        padding: EdgeInsets.symmetric(vertical: kMarginY),
        decoration: BoxDecoration(
          color: ColorsApp.bg,
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
                  'yemtyl'.tr(),
                  style:
                      TextStyle(fontSize: kBasics, fontWeight: FontWeight.w700),
                )),
            Container(
                padding: EdgeInsets.symmetric(
                    horizontal: kMarginX, vertical: kMarginY),
                child: Text(
                  'yemty2'.tr(),
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
                  bgColor: ColorsApp.second,
                  text: 'Go Back',
                  onTap: () {
                    BlocProvider.of<HomeBloc>(context)
                        .add(SetIndexEvent(index: 0));
                  },
                ))
          ],
        ));
  }
}
