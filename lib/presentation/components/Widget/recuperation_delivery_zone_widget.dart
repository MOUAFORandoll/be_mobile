import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

class RecuperationDeliveryZoneWidget extends StatelessWidget {
  RecuperationDeliveryZoneWidget({
    required this.title,
    required this.onTap,
  });
  final String title;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: kMarginY * 2),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: ColorsApp.greyNew,
          borderRadius: BorderRadius.circular(5),
          // boxShadow: [
          //   BoxShadow(
          //     color: ColorsApp.primary.withOpacity(0.2),
          //     spreadRadius: 2,
          //     blurRadius: 5,
          //     offset: Offset(0, 2),
          //   ),
          //   BoxShadow(
          //     color: ColorsApp.black.withOpacity(0.2),
          //     spreadRadius: 2,
          //     blurRadius: 5,
          //     offset: Offset(0, 2),
          //   ),
          // ],
        ),
        child: Row(children: [
          Container(
              padding: EdgeInsets.all(8),
              // decoration: BoxDecoration(
              //   color: ColorsApp.green.withOpacity(.2),
              //   borderRadius: BorderRadius.circular(30),
              // ),
              child: Icon(FontAwesomeIcons.searchengin,
                  size: 20, color: ColorsApp.primary)),
          Container(
            margin: EdgeInsets.symmetric(horizontal: kMarginX),
            child: Text(title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: kBasics,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w700,
                )),
          ),
        ]),
      ),
      onTap: onTap,
    );
  }
}
