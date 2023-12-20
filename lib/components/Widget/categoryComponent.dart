// ignore: must_be_immutable import 'package:BananaExpress/model/data/CategoryModel.dart';
import 'package:BananaExpress/components/Widget/ShimmerBox.dart';
import 'package:BananaExpress/model/data/CategoryModel.dart';
import 'package:BananaExpress/styles/textStyle.dart';
import 'package:BananaExpress/styles/theme.dart';
import 'package:BananaExpress/utils/Services/routing.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:BananaExpress/styles/colorApp.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategoryComponent extends StatelessWidget {
  CategoryModel category;

  CategoryComponent({required this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Container(
          // height: kSmHeight,
          // width: kSmWidth,
          alignment: Alignment.center,
          padding: EdgeInsets.all(kMarginX),
          margin: EdgeInsets.only(right: kMarginX),
          decoration: BoxDecoration(
              color: ColorsApp.grey,
              border: Border.all(color: ColorsApp.bg),
              borderRadius: BorderRadius.circular(13)),
          child: Row(
            children: [
              Container(
                // padding: EdgeInsets.all(kMarginX * 1.5),
                child: Text(category.libelle,
                    overflow: TextOverflow.ellipsis,
                    style: TexteStyle().secondaryTextStyle),
              ),
              // Container(
              //   child: CachedNetworkImage(
              //     fit: BoxFit.cover,
              //     imageUrl:
              //         category.logo /* 'https://placehold.co/600x400@2x.png' */,
              //     imageBuilder: (context, imageProvider) {
              //       return Container(
              //           // height: kHeight / 3,
              //           width: 100,
              //           // margin: EdgeInsets.only(bottom: 10),
              //           // padding: EdgeInsets.symmetric(vertical: 4, horizontal: 1),
              //           decoration: BoxDecoration(
              //             color: ColorsApp.grey,
              //             borderRadius: BorderRadius.only(
              //                 topRight: Radius.circular(8),
              //                 bottomRight: Radius.circular(8)),
              //             image: DecorationImage(
              //                 image: imageProvider,
              //                 fit: BoxFit.cover,
              //                 colorFilter: ColorFilter.mode(
              //                     Colors.transparent, BlendMode.colorBurn)),
              //           ));
              //     },
              //     placeholder: (context, url) {
              //       return ShimmerBox();
              //     },
              //     errorWidget: (context, url, error) {
              //       return Container(
              //           width: 100,
              //           // margin: EdgeInsets.only(bottom: 10),
              //           // padding: EdgeInsets.symmetric(vertical: 4, horizontal: 1),
              //           decoration: BoxDecoration(
              //               color: ColorsApp.grey,
              //               borderRadius: BorderRadius.only(
              //                   topRight: Radius.circular(8),
              //                   bottomRight: Radius.circular(8)),
              //               image: DecorationImage(
              //                 image: AssetImage('assets/logo/logoNew.png'),
              //               )));
              //     },
              //   ),
              // ),
            ],
          ),
        ));
  }
}

class CacdNetworkImage {}
