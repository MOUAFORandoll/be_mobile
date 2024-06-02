import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:BabanaExpress/application/model/data/MessageModel.dart';
import 'package:BabanaExpress/core.dart';
import 'package:BabanaExpress/utils/constants/assets.dart';
import 'package:BabanaExpress/utils/functions/formatData.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../exportcomponent.dart';

class MessageComponent extends StatelessWidget {
  const MessageComponent({required this.message});
  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    final alignment =
        !message.isCallCenter ? Alignment.centerRight : Alignment.centerLeft;
    final color = !message.isCallCenter ? ColorsApp.primary : ColorsApp.white;
    final colorText = message.isCallCenter ? ColorsApp.black : ColorsApp.white;
    var formatData = new FormatData();
    return Container(
      margin: EdgeInsets.only(top: kMarginY / 2)
          .add(EdgeInsets.symmetric(horizontal: kMarginX * 2)),
      alignment: alignment,
      child: Row(
        mainAxisAlignment: !message.isCallCenter
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          // if (!!message.isCallCenter)
          //   Container(
          //     margin: EdgeInsets.only(right: kMarginX / 2),
          //     child: CircleAvatar(
          //         radius: 20, backgroundImage: AssetImage(Assets.logo)),
          //   ),
          Stack(
            children: [
              Container(
                  margin: EdgeInsets.only(bottom: kMarginY / 2),
                  decoration: BoxDecoration(
                      borderRadius: !message.isCallCenter
                          ? BorderRadius.only(
                              topLeft: Radius.circular(10),
                              // topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))
                          : BorderRadius.only(
                              // topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                      /*      borderRadius: BorderRadius.circular(10),  */ color:
                          color),
                  constraints: BoxConstraints(
                    maxWidth: getWith(context) * .50,
                    minWidth: getWith(context) * .35,
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: kMarginX * 1.3, vertical: kMarginY * 1.5),

                  // width: getWith(context) * .58,
                  child: Text(message.message,
                      style: TextStyle(
                        fontFamily: 'Lato',
                        color: colorText,
                      ))),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(7),
                    child: Text(message.heureSend,
                        style: TextStyle(
                            fontFamily: 'Lato',
                            color: colorText,
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                  )),
            ],
          ),
          // if (!message.isCallCenter)
          //   BlocBuilder<HomeBloc, HomeState>(
          //     builder: (context, state) => Container(
          //       margin: EdgeInsets.only(left: kMarginX / 2),
          //       child: CircleAvatar(
          //         radius: 20,
          //         child: CachedNetworkImage(
          //           fit: BoxFit.cover,
          //           imageUrl: state.user!.profile,
          //           imageBuilder: (context, imageProvider) {
          //             return Container(
          //               decoration: BoxDecoration(
          //                 shape: BoxShape.circle,
          //                 image: DecorationImage(
          //                   image: imageProvider,
          //                   fit: BoxFit.cover,
          //                 ),
          //               ),
          //             );
          //           },
          //           placeholder: (context, url) {
          //             return Container(
          //               child: Center(
          //                   child: CircularProgressIndicator(
          //                 color: ColorsApp.primary,
          //               )),
          //             );
          //           },
          //           errorWidget: (context, url, error) {
          //             return CircleAvatar(
          //                 backgroundColor: ColorsApp.primary,
          //                 radius: 20,
          //                 backgroundImage: AssetImage(Assets.babana));
          //           },
          //         ),
          //       ),
          //     ),
          //   ),
        ], /*  ) */
      ),
    );
  }
}
