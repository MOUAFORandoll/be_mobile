import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

class HomeOptionWidget extends StatelessWidget {
  HomeOptionWidget({
    required this.title,
    this.onTap,
    this.arg = '',
    required this.icon,
  });
  final title, arg, onTap, icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: ColorsApp.white,
            borderRadius: BorderRadius.circular(18),
            // border: Border.all(color: ColorsApp.primary, width: 1.5),
            boxShadow: [
              BoxShadow(
                color: ColorsApp.primary.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
              BoxShadow(
                color: ColorsApp.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          width: getWidth(context) / 2.4,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      height: getHeight(context) * .09,
                      width: getWidth(context) * .25,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: AssetImage(
                            icon,
                          ),
                        ),
                      ),
                    )),
                // Container(
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(8),
                //     ),
                //     child: SvgPicture.asset(
                //       icon,
                //       height: getHeight(context) * .09,
                //       width: getWidth(context) * .25,
                //     )),
                Container(
                    margin: EdgeInsets.only(top: kMarginY * 1.5),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall,
                    )),
              ]),
        ),
        onTap: onTap);
  }
}
