// ignore_for_file: must_be_immutable

import 'package:BabanaExpress/presentation/components/exportcomponent.dart'; 

class SocialLogBtn extends StatelessWidget {
  SocialLogBtn({this.validate, this.icon, this.onTap, this.title});
  var validate, icon, onTap, title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(7),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: ColorsApp.primary,
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
              (validate)
                  ? Icon(
                      icon,
                      color: ColorsApp.primary,
                      size: 18,
                    )
                  : Container(
                      height: 18,
                      width: 18,
                      child: CircularProgressIndicator(
                        color: ColorsApp.primary,
                      ))
            ]),
      ),
    );
  }
}
