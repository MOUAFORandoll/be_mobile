import 'package:BananaExpress/presentation/components/exportcomponent.dart';

// ignore: must_be_immutable
class IconButtonF extends StatelessWidget {
  var icon, color, onTap, inconSize, backgroundColor, semanticLabel;
  IconButtonF(
      {this.icon,
      this.color = Colors.white,
      this.backgroundColor = Colors.white,
      this.inconSize = 20.0,
      this.semanticLabel = '',
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: backgroundColor),
        child: Icon(
          icon,
          color: color,
          size: inconSize,
          semanticLabel: semanticLabel,
        ),
      ),
      onTap: onTap,
    );
  }
}

// ignore: must_be_immutable
class IconButtonF0 extends StatelessWidget {
  var icon, color, onTap, inconSize, backgroundColor;
  IconButtonF0(
      {this.icon,
      this.color = ColorsApp.primary,
      this.backgroundColor = Colors.white,
      this.inconSize = 20.0,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: kMarginX),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: backgroundColor),
        child: Icon(icon, color: color, size: inconSize),
      ),
      onTap: onTap,
    );
  }
}

// ignore: must_be_immutable
class IconButtonF1 extends StatelessWidget {
  var icon, color, onTap, padding, inconSize, backgroundColor;
  IconButtonF1(
      {this.icon,
      this.color = ColorsApp.primary,
      this.backgroundColor = Colors.white,
      this.inconSize = 20.0,
      this.padding = 5.0,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: kMarginX),
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
            border: Border.all(color: ColorsApp.tird /*  ColorsApp.orange */),
            borderRadius: BorderRadius.circular(5),
            color: backgroundColor),
        child: Icon(icon, color: color, size: inconSize),
      ),
      onTap: onTap,
    );
  }
}
