import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

class SuccesReceptionview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopScope(
        onPopInvoked: (value) async {
          // Get.offNamedUntil(AppLinks.FIRST, (route) => false);
        },
        child: Scaffold(
            backgroundColor: ColorsApp.grey,
            appBar: AppBarCustom(
              title: ''.tr(),
            ),
            body: Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: kMarginX),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(60),
                      ),
                      padding: EdgeInsets.all(kMarginY * 1.5),
                      child: Icon(Icons.check, color: Colors.white, size: 40.0),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(
                          vertical: kMarginY * 2,
                        ),
                        child: Text('yLivraisonSucces'.tr(),
                            textAlign: TextAlign.center,
                            style: TextStyle(color: ColorsApp.primary))),
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: kMarginY * 6,
                      ),
                      child: AppButton(
                        size: MainAxisSize.max,
                        border: Border.all(color: ColorsApp.primary),
                        text: 'home'.tr(),
                        onTap: () async {
                          // Get.offNamedUntil(AppLinks.FIRST, (route) => false);
                        },
                      ),
                    )
                  ],
                ))));
  }
}
