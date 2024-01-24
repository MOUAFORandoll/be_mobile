import 'package:BananaExpress/styles/colorApp.dart';
import 'package:BananaExpress/styles/textStyle.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Color bgColor;
  final Color textColor;
  final   text;
  final Widget? leading;
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
    this.leading,
    this.border,
    this.loading = 0,
    this.size = MainAxisSize.min,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: loading == 1 ? null : onTap,
      child: Container(
        constraints:
            BoxConstraints(minHeight: kHeight / 17, minWidth: kWidth / 2.9),
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
            borderRadius: BorderRadius.circular(21),
            color: loading == 1 ? bgColor.withOpacity(.5) : bgColor,
            border: border),
        alignment: Alignment.center,
        child: loading == 1
            ? Container(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: ColorsApp.tird,
                ),
              )
            : Text(
                text,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: textColor,
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.ellipsis,
                  fontSize: 12,
                ),
              ),
      ),
    );
  }
}
