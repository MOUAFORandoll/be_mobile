import 'package:BananaExpress/presentation/components/exportcomponent.dart';

// ignore: must_be_immutable
class KSearchField extends StatelessWidget {
  final String? title;
  Function? onChange;
  final double? dim;
  bool isCode;
  var width;

  KSearchField(
      {Key? key,
      this.title,
      this.width,
      this.dim,
      this.isCode = false,
      this.onChange})
      : super(key: key);
  FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Color.fromARGB(255, 231, 229, 229),
        ),
      ),

      height: kToolbarHeight / 1.3,
      // width: width ?? getWith(context) * .75,
      // padding: EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        onChanged: (String value) {},
        focusNode: _focusNode,
        // cursorHeight: 30.0,
        // controller: searchCont.controllerField,
        // textAlign: TextAlign.left,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 5),
          prefixIcon: Icon(Icons.search, color: ColorsApp.second),

          // prefixIcon: InkWell(
          //     onTap: () {
          //       searchCont.selectFilter();
          //     },
          //     child: Container(
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(5),
          //           color: ColorsApp.grey,
          //         ),
          //         // height: searchCont.tsearch == 0 ? 0 : kToolbarHeight / 1.9,
          //         width: getWith(context) * 0.7,
          //         // margin: EdgeInsets.only(
          //         //   left: 3,
          //         // ).add(
          //         //   EdgeInsets.symmetric(vertical: 0),
          //         // ),

          //         padding: EdgeInsets.symmetric(
          //           horizontal: 5,
          //         ),
          //         child: Row(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     Container(child: Icon(Icons.settings)),
          //     Container(
          //         margin: EdgeInsets.only(left: 5),
          //         child: searchCont.tsearch == 0
          //             ? Text(
          //                 'produit',
          //                 style: TextStyle(
          //                     color: ColorsApp.tird,
          //                     fontSize: 14),
          //               )
          //             : searchCont.tsearch == 1
          //                 ? Text(
          //                     'boutique',
          //                     style: TextStyle(
          //                         color: ColorsApp.tird,
          //                         fontSize: 14),
          //                   )
          //                 : Text(
          //                     'categorie',
          //                     style: TextStyle(
          //                         color: ColorsApp.tird,
          //                         fontSize: 14),
          //                   ))
          //   ],
          // ))),

          hintText: isCode ? '1234' : 'Recherche',
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.zero,
          ),
          prefixStyle: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
          // contentPadding: EdgeInsets.symmetric(vertical: 10),
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
