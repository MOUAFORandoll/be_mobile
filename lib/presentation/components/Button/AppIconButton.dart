import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

// ignore: must_be_immutable
class AppIconButton extends StatelessWidget {
  var icon, onTap, inconSize, backgroundColor, borderColor;
  AppIconButton(
      {this.icon,
      this.backgroundColor = Colors.white,
      this.borderColor = Colors.white,
      this.inconSize = 22.0,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(10),
            color: backgroundColor),
        child: icon,
      ),
      onTap: onTap,
    );
  }
}
