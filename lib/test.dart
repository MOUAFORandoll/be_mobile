import 'dart:convert';

import 'package:flutter/material.dart';
import 'utils/functions/viewFunctions.dart';

class Test extends StatefulWidget {
  const Test({
    Key? key,
  }) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}
//  var fn = new ViewFunctions();
//                 fn.loading(
//                     'Eiusmod ex quis deserunt ex eiusmod adipisicing duis fugiat excepteur non velit fugiat id id. ',
//                     '');
class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('widget'),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {}, // _createOffer,
              child:
                  Container(height: 150, width: 250, child: const Text("Test")),
            ),
            // videoRenderers(),
            Column(
              children: [
                // Padding(
                //   padding: const EdgeInsets.all(16.0),
                //   child: SizedBox(
                //     width: MediaQuery.of(context).size.width * 0.5,
                //     child: TextField(
                //       controller: sdpController,
                //       keyboardType: TextInputType.multiline,
                //       maxLines: 4,
                //       maxLength: TextField.noMaxLength,
                //     ),
                //   ),
                // ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [],
                )
              ],
            ),
          ],
        ));
  }
}
