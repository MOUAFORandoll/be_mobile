import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

class GlobalBottomSheet {
  static void show(
      {required BuildContext context,
      required Widget? widget,
      String? title,
      String? subtitle,
      double? maxHeight}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: ColorsApp.white,
      constraints: BoxConstraints(
          maxHeight: maxHeight ?? MediaQuery.of(context).size.height * 0.85,
          minHeight: MediaQuery.of(context).size.height * 0.3,
          maxWidth: MediaQuery.of(context).size.width),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))),
      barrierColor: Colors.black.withOpacity(0.7),
      builder: (context) => Container(
          decoration: BoxDecoration(
              color: ColorsApp.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0))),
          padding: EdgeInsets.symmetric(
            horizontal: kMarginX,
          ).add(EdgeInsets.only(top: kMarginY)),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: ColorsApp.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0))),
                padding: EdgeInsets.symmetric(
                    horizontal: kMarginX / 2, vertical: kMarginY),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title ?? '',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Container(
                            width: getWidth(context) * .86,
                            child: Text(
                              subtitle ?? '',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                        child: Icon(Icons.close),
                        onTap: () => AutoRouter.of(context).pop()),
                  ],
                ),
              ),
              widget!,
            ],
          )),
    );
  }
}
