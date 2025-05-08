import 'package:fluttertoast/fluttertoast.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

class CustomArlert {
  void comfirm(
      {required BuildContext context,
      String? content,
      Widget? widget,
      String? confirmText,
      String? ignoreText,
      List<DialogButton>? buttons,
      required Function onpressed}) {
    Alert(
            useRootNavigator: false,
            context: context,
            content: widget ??
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Text(
                        content!,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    )
                  ],
                ),
            buttons: buttons ??
                [
                  DialogButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    color: Colors.white,
                    border: Border.all(color: ColorsApp.primary),
                    child: Text(
                      ignoreText ?? 'Non',
                      style: TextStyle(color: ColorsApp.primary, fontSize: 15),
                    ),
                  ),
                  DialogButton(
                    onPressed: (() {
                      onpressed();
                      Navigator.of(context).pop(true);
                    }),
                    color: ThemeApp.second,
                    child: Text(
                      confirmText ?? 'Oui',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  )
                ])
        .show();
  }

  void error({required BuildContext context, required String content}) {
    Alert(
        useRootNavigator: false,
        context: context,
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Center(
            //   child: SvgPicture.asset(
            //     AppAssetsFiles.errorSvg,
            //     height: 80,
            //     width: 80,
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Center(
                child: Text(
                  content,
                  textScaler: TextScaler.linear(0.9),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            color: ColorsApp.green,
            child: Text(
              'alert.okay'.tr(),
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ]).show();
  }
}

class CustomFlush {
  void success({required String content, bool? isError, Toast? toastLength}) {
    Fluttertoast.showToast(
        msg: content,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: ColorsApp.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void error({
    required String content,
  }) {
    Fluttertoast.showToast(
        msg: content,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: ColorsApp.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
