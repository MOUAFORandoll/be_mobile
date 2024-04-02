import '../exportcomponent.dart';

class AppButtonIcon extends StatelessWidget {
  final Color bgColor;
  final Color textColor;
  final String text;
  final Widget? leading;
  final VoidCallback? onTap;
  final bool disabled;
  final bool shadow;
  final double? width;
  final MainAxisSize size;
  final BoxBorder? border;
  final icon;
  AppButtonIcon({
    Key? key,
    required this.text,
    this.bgColor = Colors.white,
    this.textColor = ColorsApp.primary,
    this.onTap,
    this.leading,
    this.border,
    this.shadow = true,
    this.icon,
    this.disabled = false,
    this.width,
    this.size = MainAxisSize.min,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disabled ? null : onTap,
      child: Container(
        alignment: Alignment.center,
        constraints: const BoxConstraints(minHeight: 56),
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          // boxShadow: shadow
          //     ? [
          //         BoxShadow(
          //           color: Colors.grey.withOpacity(0.5),
          //           spreadRadius: 2,
          //           blurRadius: 7,
          //           offset: Offset(0, 1),
          //         ),
          //       ]
          //     : null,
          borderRadius: BorderRadius.circular(10),
          color: disabled ? bgColor.withOpacity(.5) : bgColor,
        ), // border: Border.all(color: ColorsApp.secondarytext)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: size,
          children: [
            Container(
              child: Icon(
                icon,
                color: disabled ? textColor.withOpacity(.5) : textColor,
              ),
            ),
            Container(
                child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Lato',
                color: disabled ? textColor.withOpacity(.5) : textColor,
                fontWeight: FontWeight.w600,
              ),
            )),
          ],
        ),
      ),
    );
  }
}
