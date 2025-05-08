import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

class SocialLogBtn extends StatelessWidget {
  SocialLogBtn({this.icon, this.onTap, this.title});
  final icon, onTap, title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints(maxWidth: getWidth(context) * .3),
        padding: EdgeInsets.all(7),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: Colors.blue,
            )),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                icon,
                color: Colors.blue,
                size: 18,
              )
            ]),
      ),
    );
  }
}
