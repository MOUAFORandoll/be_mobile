import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

class AppButtonSecond extends StatelessWidget {
  final Color bgColor;
  final Color textColor;
  final text;
  final marginAdd;
  final VoidCallback? onTap;
  final bool disabled;
  final int loading;
  final MainAxisSize size;
  final BoxBorder? border;
  final IconData? prefixIcon;
  final IconData? sufixIcon;
  AppButtonSecond({
    Key? key,
    required this.text,
    this.marginAdd,
    this.bgColor = ColorsApp.primary,
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
        child: Container(
          // width: getWidth(context),
          constraints: BoxConstraints(
              minHeight: getHeight(context) * .07,
              maxHeight: getHeight(context) * .07,
              minWidth: getWidth(context) * .40),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80),
              color: disabled ? bgColor.withOpacity(.5) : bgColor,
              border: border),
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.symmetric(vertical: kMarginY * 2)
              .add(marginAdd ?? EdgeInsets.all(0)),
          child: Row(
            mainAxisSize: size,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (prefixIcon != null) Icon(prefixIcon!),
                  Container(
                    margin: EdgeInsets.only(left: kMarginX),
                    child: Text(
                      text,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: textColor),
                    ),
                  ),
                ],
              ),
              if (sufixIcon != null) Icon(sufixIcon!),
            ],
          ),
        ),
        onTap: onTap);
  }
}
