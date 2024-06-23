import 'package:BabanaExpress/utils/constants/assets.dart';
import 'package:BabanaExpress/utils/functions/formatData.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../exportcomponent.dart';

class OwnMessageCard extends StatelessWidget {
  const OwnMessageCard({required this.message, required this.time});
  final String message;
  final String time;

  @override
  Widget build(BuildContext context) {
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
                          right: getWidth(context) * .5,
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
                          vertical: getHeight(context) * .02,
                        ),
                        child: Row(
                          children: [
                            Container(
                              child: Text(
                                formatData.capitalizeFirstLetter(
                                    /* Get.find<ManagerController>().Userget.nom ?? */
                                    'User'),
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                left: getWidth(context) * .03,
                              ),
                              child: CachedNetworkImage(
                                height: getHeight(context) / 20,
                                width: getHeight(context) / 20,
                                fit: BoxFit.cover,
                                imageUrl: "_manager.Userget.profile",
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
                                      color: ColorsApp.primary,
                                    )),
                                  );
                                },
                                errorWidget: (context, url, error) {
                                  return CircleAvatar(
                                      backgroundColor: ColorsApp.primary,
                                      radius: 50,
                                      backgroundImage:
                                          AssetImage(Assets.babana));
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
                        color: ColorsApp.second),
                    constraints: BoxConstraints(
                      maxWidth: getWidth(context) * .50,
                    ),
                    padding: EdgeInsets.all(kMarginX),
                    margin: EdgeInsets.only(right: kMarginX * 2),
                    // width: getWidth(context) * .58,
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
