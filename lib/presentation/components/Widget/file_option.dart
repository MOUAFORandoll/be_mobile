import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

class FileOptionWidget extends StatelessWidget {
  FileOptionWidget({
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
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorsApp.greyNew),
                  child: Icon(icon),
                ),
                Container(
                    margin: EdgeInsets.only(top: kMarginY * 1.5),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: kBasics,
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.w500,
                      ),
                    )),
              ]),
        ),
        onTap: onTap);
  }
}
