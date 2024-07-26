import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

// ignore: must_be_immutable
class ErrorReloadComponent extends StatelessWidget {
  final onTap;
  ErrorReloadComponent({this.onTap});
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          margin: EdgeInsets.symmetric(vertical: getHeight(context) / 12),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: ColorsApp.bg,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(child: Icon(Icons.refresh, size: 70)),
              Container(
                  width: getWidth(context) * .7,
                  padding: EdgeInsets.symmetric(vertical: kMarginY),
                  child: Text(
                    'Pas de connexion a internet. Appuie pour reessayer'.tr(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )),
              Container(
                  width: getWidth(context) * .8,
                  child: Text(
                    'Connexion a internet impossible. Bascule sur un autre reseau et reessaie'
                        .tr(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  )),
            ],
          )),
    );
  }
}
