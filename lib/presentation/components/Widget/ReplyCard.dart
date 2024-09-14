import '../exportcomponent.dart';

class ReplyCard extends StatelessWidget {
  const ReplyCard({required this.message, required this.time});
  final String message;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kMarginX),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
              bottom: 5,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topRight,
                  // margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: getHeight(context) * .02,
                        ),
                        child: Row(
                          children: [
                            Container(
                                margin: EdgeInsets.only(
                                  right: getWidth(context) * .03,
                                ),
                                decoration: BoxDecoration(
                                    color: ThemeApp.second,
                                    borderRadius: BorderRadius.circular(30)
                                    /*   image: DecorationImage(
                                        image: AssetImage(
                                            "assets/logo/logoNew.png")) */
                                    ),
                                child: CircleAvatar(
                                    // backgroundColor: ColorsApp.skyBlue,
                                    radius: 20,
                                    backgroundImage:
                                        AssetImage('assets/logo/logoNew.png'))),
                            Container(
                              child: Text(
                                'Emiy',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: getWidth(context) * .5,
                        ),
                        child: Text(
                          time,
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: ColorsApp.greyNew),
                    constraints: BoxConstraints(
                      maxWidth: getWidth(context) * .50,
                    ),
                    padding: EdgeInsets.all(kMarginX),
                    margin: EdgeInsets.only(left: kMarginX * 2),
                    // width: getWidth(context) * .58,
                    child: Text(message,
                        style: TextStyle(
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
