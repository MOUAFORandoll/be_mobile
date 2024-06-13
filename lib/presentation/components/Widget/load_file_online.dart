import 'dart:io';

import 'package:BabanaExpress/application/model/data/MessageModel.dart';
import 'package:BabanaExpress/presentation/components/Widget/icon_svg.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/utils/constants/assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class LoadFileOnlineWidget extends StatelessWidget {
  LoadFileOnlineWidget({
    required AttachFile this.file,
    this.onTap,
  });
  final AttachFile file;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: CachedNetworkImage(
              // height: getHeight(context) * .1,
              fit: BoxFit.cover,
              imageUrl: file.src,
              imageBuilder: (context, imageProvider) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.transparent, BlendMode.colorBurn)),
                  ),
                );
              },
              placeholder: (context, url) {
                return Container(
                  child: Shimmer.fromColors(
                      baseColor: ColorsApp.greyNew,
                      highlightColor: ColorsApp.primary.withOpacity(.1),
                      child: Container(
                        /*   height: getHeight(context) * .09,
                                              width: getWith(context) * .25,
                                             */
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorsApp.greyNew,
                        ),
                      )),
                );
              },
              errorWidget: (context, url, error) {
                return Container(
                  // height: getHeight(context) / 10,
                  // width: getHeight(context) / 10,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(
                        Assets.login,
                      ),
                    ),
                  ),
                );
              },
            )),
        onTap: onTap);
  }
}
