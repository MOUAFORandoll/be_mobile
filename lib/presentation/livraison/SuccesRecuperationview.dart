import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

class SuccesRecuperationview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopScope(
        onPopInvoked: (value) async {
          // Get.offNamedUntil(AppLinks.FIRST, (route) => false);
        },
        child: Scaffold(
            backgroundColor: ColorsApp.grey,
            body: Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: kMarginX),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: ThemeApp.second,
                        borderRadius: BorderRadius.circular(60),
                      ),
                      padding: EdgeInsets.all(kMarginY * 1.5),
                      child: Icon(Icons.check, color: Colors.white, size: 40.0),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(
                          vertical: kMarginY * 2,
                        ),
                        child: Text('yrecupsucces'.tr(),
                            textAlign: TextAlign.center,
                            style: TextStyle(color: ColorsApp.primary))),
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: kMarginY * 6,
                      ),
                      child: AppButton(
                        text: 'ypoursuivre'.tr(),
                        onTap: () async {
                          // Get.offNamedUntil(AppLinks.FIRST, (route) => false);
                        },
                      ),
                    )
                  ],
                ))));
  }
}
