import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

class AppButtonSecond extends StatelessWidget {
  final Color bgColor;
  final Color textColor;
  final String text;
  final EdgeInsetsGeometry? marginAdd;
  final VoidCallback? onTap;
  final bool disabled;
  final int loading;
  final MainAxisSize size;
  final BoxBorder? border;
  final IconData? prefixIcon;
  final IconData? sufixIcon;

  const AppButtonSecond({
    Key? key,
    required this.text,
    this.marginAdd,
    this.bgColor = ThemeApp.second,
    this.textColor = Colors.white,
    this.onTap,
    this.disabled = false,
    this.border,
    this.prefixIcon,
    this.sufixIcon,
    this.loading = 0,
    this.size = MainAxisSize.min,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: !disabled ? onTap : null,
      child: Container(
        alignment: Alignment.center,
        height: getHeight(context) * 0.055,
        constraints: BoxConstraints(minWidth: getWidth(context) * 0.40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80),
          color: disabled ? ColorsApp.greyNew : bgColor,
          border: border,
        ),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(
          vertical: kMarginY * 2,
        ).add(marginAdd ?? EdgeInsets.zero),
        child: Row(
          mainAxisSize: size,
          mainAxisAlignment: sufixIcon != null
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            if (prefixIcon != null) Icon(prefixIcon!, color: textColor),
            SizedBox(width: prefixIcon != null ? kMarginX : 0),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: kBasics * 1.2,
                color: disabled ? ColorsApp.primary : textColor,
              ),
            ),
            if (sufixIcon != null) ...[
              SizedBox(width: kMarginX),
              Icon(sufixIcon!, color: textColor),
            ],
          ],
        ),
      ),
    );
  }
}
