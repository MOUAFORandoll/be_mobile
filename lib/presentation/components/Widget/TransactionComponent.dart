// ignore: must_be_immutable

import 'package:BabanaExpress/presentation/_commons/theming/colorApp.dart';
import 'package:BabanaExpress/presentation/components/Text/SimpleText.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart'; 
import 'package:flutter/material.dart';

import '../../../application/model/exportmodel.dart';

// ignore: must_be_immutable
class TransactionComponent extends StatelessWidget {
  TransactionModel transaction;

  TransactionComponent({required this.transaction});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: kMarginY / 2),
        decoration: BoxDecoration(
            color: ColorsApp.grey, borderRadius: BorderRadius.circular(8)),
        child: Row(children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    // width: kSmWidth * .6,

                    child: SimpleText(
                  text: /* 'Transaction : ' +  */
                      transaction.typeTransaction,
                  bolder: true,
                )),
                Container(
                    child: Text(
                  'Fait le : ' + transaction.dateCreated.toString(),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: kDescription,
                    fontFamily: 'Lato',
                  ),
                )),
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    child: Row(
                  children: [
                    Container(
                        child: Text(
                      'XAF ',
                      style: TextStyle(
                        fontSize: kDescription,
                        fontFamily: 'Lato',
                      ),
                    )),
                    Container(
                        child: Text(
                      transaction.montant.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: kTitle,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w800),
                    )),
                  ],
                )),
                Container(
                    child: Row(
                  children: [
                    Container(
                        child: Text(
                      'Etat : ',
                      style: TextStyle(
                        fontSize: kDescription,
                        fontFamily: 'Lato',
                      ),
                    )),
                    Container(
                        child: Text(
                      transaction.status.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: 'Lato', fontWeight: FontWeight.w800),
                    )),
                    Container(
                        margin: EdgeInsets.only(left: kMarginX),
                        child: Icon(
                          transaction.status == 'Valide'
                              ? Icons.verified_rounded
                              : Icons.close,
                          color: transaction.status == 'Valide'
                              ? ColorsApp.primary
                              : ColorsApp.red,
                        )),
                  ],
                )),
              ],
            ),
          ),
        ]),
      ),
      onTap: () {},
    );
  }
}
