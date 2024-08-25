import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

class HomePropositionWidget extends StatelessWidget {
  HomePropositionWidget({
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
            color: ColorsApp.primary, //Color.fromARGB(0, 238, 238, 238),
            borderRadius: BorderRadius.circular(18),
            // border: Border.all(color: ColorsApp.primary, width: 1.5),
            boxShadow: [],
          ),
          width: getWidth(context) / 2.3,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(top: kMarginY),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: kBasics,
                        color: ColorsApp.white,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                Container(
                    margin: EdgeInsets.only(top: kMarginY * .1),
                    child: Text(
                      title,
                      maxLines: 1,
                      style: TextStyle(
                        color: ColorsApp.white,
                        fontSize: kBasics * .8,
                      ),
                    )),
                Container(
                    alignment: Alignment.bottomRight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      height: getHeight(context) * .1,
                      width: getWidth(context) * .1,
                      // alignment: Alignment.center,
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
              ]),
        ),
        onTap: onTap);
  }
}
