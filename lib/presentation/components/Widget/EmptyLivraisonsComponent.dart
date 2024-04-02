import 'package:BabanaExpress/application/export_bloc.dart';

import 'package:BabanaExpress/utils/constants/assets.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

// ignore: must_be_immutable
class EmptyLivraisonsComponent extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: getHeight(context) / 6),
        decoration: BoxDecoration(
          color: ColorsApp.bg,
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: kMarginX, vertical: kMarginY),
        child: Text(
          'yemtyl'.tr(),
          style: TextStyle(fontSize: kBasics, fontWeight: FontWeight.w700),
        ));
  }
}
