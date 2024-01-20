import 'package:BananaExpress/components/Widget/CircleImage.dart';
import 'package:BananaExpress/components/exportcomponent.dart';
import 'package:BananaExpress/model/data/UserModel.dart'; 
import 'package:BananaExpress/utils/functions/datetime_format_utils.dart'; 

class Fieul extends StatelessWidget {
  Fieul({required this.fieul});

  final UserModel fieul;

  @override
  Widget build(BuildContext context) {
    var format = ViewFunctions();
    return InkWell(
      onTap: () async {},
      child: Container(
          decoration: BoxDecoration(
              border: Border(
                  // bottom: BorderSide(color: ColorsApp.grey),
                  )),
          padding: EdgeInsets.symmetric(vertical: kMarginY),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            CircleImage(imageUrl: fieul.profile),
            Container(
                margin: EdgeInsets.symmetric(vertical: kMarginY)
                    .add(EdgeInsets.only(left: kMarginX)),
                // decoration: BoxDecoration(color: ColorsApp.second),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: kWidth * .55,
                              child: Text(
                                format.capitalizeFirstLetter(
                                    fieul.prenom + ' ' + fieul.nom),
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: kMarginY / 4),
                                width: kWidth * .55,
                                child: Text(
                                  fieul.phone.toString(),
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  // softWrap: true,
                                  style: TextStyle(
                                    fontSize: kDescription,
                                  ),
                                )),
                            Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: kMarginY / 4),
                                width: kWidth * .55,
                                child: Text(
                                  'Le ' +
                                      FormatDateTime().dateToSimpleDate(
                                          fieul.dateCreated.toString()),
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  // softWrap: true,
                                  style: TextStyle(),
                                )),
                          ]),
                    ])),
            InkWell(
              child: Container(
                  margin: EdgeInsets.only(right: kMarginX),
                  child: Icon(Icons.message)),
              onTap: () => print('message'),
            ),
            InkWell(
              child: Container(
                  margin: EdgeInsets.only(right: kMarginX),
                  child: Icon(Icons.phone)),
              onTap: () => print('phone'),
            ),
          ])),
    );
  }
}
