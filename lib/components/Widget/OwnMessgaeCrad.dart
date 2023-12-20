import 'package:BananaExpress/controller/managerController.dart';
import 'package:BananaExpress/styles/colorApp.dart';
import 'package:BananaExpress/styles/textStyle.dart';
import 'package:BananaExpress/utils/functions/formatData.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OwnMessageCard extends StatelessWidget {
  const OwnMessageCard({required this.message, required this.time});
  final String message;
  final String time;

  @override
  Widget build(BuildContext context) {
    var _manager = Get.find<ManagerController>();
    var formatData = new FormatData();
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kMarginX),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.only(
              bottom: 5,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  // margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          right: kWidth * .5,
                        ),
                        child: Text(
                          time,
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: kHeight * .02,
                        ),
                        child: Row(
                          children: [
                            Container(
                              child: Text(
                                formatData.capitalizeFirstLetter(
                                    Get.find<ManagerController>().Userget.nom ??
                                        'User'),
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                left: kWidth * .03,
                              ),
                              child: CachedNetworkImage(
                                height: kHeight / 20,
                                width: kHeight / 20,
                                fit: BoxFit.cover,
                                imageUrl: _manager.Userget.profile,
                                imageBuilder: (context, imageProvider) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                },
                                placeholder: (context, url) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: ColorsApp.grey,
                                    ),
                                    child: Center(
                                        child: CircularProgressIndicator(
                                      color: ColorsApp.tird,
                                    )),
                                  );
                                },
                                errorWidget: (context, url, error) {
                                  return CircleAvatar(
                                      backgroundColor: ColorsApp.tird,
                                      radius: 50,
                                      backgroundImage: AssetImage(
                                          "assets/logo/logoNew.png"));
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: ColorsApp.tird),
                    constraints: BoxConstraints(
                      maxWidth: kWidth * .50,
                    ),
                    padding: EdgeInsets.all(kMarginX),
                    margin: EdgeInsets.only(right: kMarginX * 2),
                    // width: kWidth * .58,
                    child: Text(message,
                        style: TextStyle(
                          fontFamily: 'Lato',
                          color: ColorsApp.white,
                        ))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
