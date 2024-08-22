import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

class AppButton extends StatelessWidget {
  final Color bgColor;
  final Color textColor;
  final text;
  final bool disabled;
  final VoidCallback? onTap;
  final int loading;
  final MainAxisSize size;
  final BoxBorder? border;
  AppButton({
    Key? key,
    required this.text,
    this.bgColor = ColorsApp.second,
    this.textColor = Colors.white,
    this.onTap,
    this.disabled = false,
    this.border,
    this.loading = 0,
    this.size = MainAxisSize.min,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disabled ? null : onTap,
      child: Container(
        height: getHeight(context) * .05,
        constraints: BoxConstraints(
            minHeight: getHeight(context) * .07,
            maxHeight: getHeight(context) * .07,
            minWidth: getWidth(context) * .40),
        padding: EdgeInsets.symmetric(horizontal: kMarginX),
        margin: EdgeInsets.symmetric(horizontal: kMarginX, vertical: kMarginY),
        decoration: BoxDecoration(
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey.withOpacity(0.5),
            //     spreadRadius: 2,
            //     blurRadius: 7,
            //     offset: Offset(0, 1),
            //   ),
            // ],
            borderRadius: BorderRadius.circular(15),
            color: disabled ? bgColor.withOpacity(.5) : bgColor,
            border: border),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Lato',
            color: textColor,
            fontWeight: FontWeight.w600,
            overflow: TextOverflow.ellipsis,
            // fontSize: 1,
          ),
        ),
      ),
    );
  }
}
