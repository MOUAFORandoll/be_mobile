import 'package:BabanaExpress/presentation/components/Widget/icon_svg.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/utils/constants/assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                      ),
                    )),
              ]),
        ),
        onTap: onTap);
  }
}
