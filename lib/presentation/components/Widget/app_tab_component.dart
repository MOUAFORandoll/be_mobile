// ignore: must_be_immutable import 'package:BananaExpress/presentation/model/data/CategoryModel.dart';

import 'package:BananaExpress/presentation/components/exportcomponent.dart';

// ignore: must_be_immutable
class AppTabComponent extends StatelessWidget {
  var libelle, onTap;
  bool selected;
  AppTabComponent({required this.libelle, this.onTap, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          height: getHeight(context) / 1.4,
          width: getWith(context) / 3.7,
          alignment: Alignment.center,
          padding: EdgeInsets.all(5),
          // margin: EdgeInsets.only(right: kMarginX),
          decoration: BoxDecoration(
              color: selected ? ColorsApp.tird : Colors.transparent,
              border:
                  Border.all(color: selected ? ColorsApp.tird : ColorsApp.grey),
              borderRadius: BorderRadius.circular(8)),
          child: Text(libelle,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontFamily: 'Lato',
                  color: !selected ? ColorsApp.grey : ColorsApp.white,
                  fontSize: kDescription,
                  fontWeight: FontWeight.w700)),
        ));
  }
}
