import 'package:BananaExpress/styles/colorApp.dart';
import 'package:flutter/material.dart';

class KFieldType {
  static String password = 'password';
  static String text = 'text';
  static String phone = 'phone';
  static String email = 'email';
}

// ignore: must_be_immutable
class FormComponent extends StatefulWidget {
  FormComponent(
      {this.type,
      this.typeT,
      this.controller,
      this.enabled,
      this.icon,
      this.hint});

  final controller;
  bool? enabled = false;
  // final String? title;
  final String? typeT;

  ///type = 0 => texte simple ; type = 1 =>password
  int? type = 0;
  String? hint = '';
  var icon;
  @override
  _FormComponentState createState() => _FormComponentState();
}

class _FormComponentState extends State<FormComponent> {
  String value = '';

  get _typekeyBord {
    TextInputType? textType;
    if (widget.typeT == null ||
        widget.typeT == KFieldType.text ||
        widget.typeT == KFieldType.password) {
      textType = TextInputType.text;
    } else if (widget.typeT == KFieldType.phone) {
      textType = TextInputType.phone;
    } else if (widget.typeT == KFieldType.email) {
      textType = TextInputType.emailAddress;
    }
    return textType;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Container(
        //     margin: EdgeInsets.only(
        //       bottom: 1,
        //       top: 1,
        //     ),
        //     child: Text(widget.hint.toString(),
        //         style: TextStyle(
        //           color: ColorsApp.tird,
        //         ))),
        Container(
            margin: EdgeInsets.only(
              bottom: 2,
              top: 2,
            ),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(color: ColorsApp.grey, spreadRadius: 1, blurRadius: 5)
            ], color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: TextFormField(
              controller: widget.controller,
              validator: (value) {
                return value == "" ? "veillez remplir se champs" : null;
              },
              // autofocus: true,
              enabled: widget.enabled,
              onChanged: (val) {
                setState(() {
                  value = val;
                });
              },
              keyboardType: _typekeyBord,

              obscureText: widget.type == 1 ? true : false,
              decoration: new InputDecoration(
                hintText: widget.hint,
                hintStyle: TextStyle(
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                    fontSize: 12),
                labelText: widget.hint,
                labelStyle: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                    fontSize: 12),
                prefixIcon: Icon(widget.icon),
                counterText: "",
                // focusedBorder: OutlineInputBorder(
                //     // borderRadius: BorderRadius.circular(15),
                //     borderSide: BorderSide(
                //   color: (value.isNotEmpty)
                //       ? (/* !(RegExp(r'^(0|[1-9]\d*)$')
                //                                       .hasMatch(value.text) && */
                //               value.length != 9)
                //           ? Colors.red
                //           : Colors.blue
                //       : Colors.blue,
                // )),
                border: OutlineInputBorder(
                  // borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.only(
                  left: 15,
                  bottom: 11,
                  top: 15,
                  right: 15,
                ),

                // hintText: widget.hint,
                // hintStyle: TextStyle(
                //   color: Colors.grey,
                // ),
              ),
            ))
      ],
    ));
  }
}
