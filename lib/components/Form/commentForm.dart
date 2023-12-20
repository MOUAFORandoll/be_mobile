import 'package:BananaExpress/styles/textStyle.dart';
import 'package:get/get.dart';
import 'package:BananaExpress/styles/colorApp.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CommentForm extends StatelessWidget {
  String? hint;
  String titre;
  IconData? icon;
  double? width;
  double? height;
  TextInputType? type;
  TextEditingController? controller;
  Function(String)? onChange;
  Function? onTap;
  bool? obscureText;
  CommentForm(
      {this.hint,
      this.height,
      this.width,
      this.icon,
      this.onChange,
      this.type,
      this.controller,
      required this.titre,
      this.obscureText = false,
      this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
        // margin: EdgeInsets.symmetric(horizontal: 5),

        // decoration: BoxDecoration(color: ColorsApp.second),
        height: kMdHeight / 3,
        width: width ?? Get.width * .7,
        alignment: Alignment.topCenter,
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Text(titre),
              ),
              TextFormField(
                onChanged: (String value) {
                  if (onChange != null) onChange!(value);
                },
                controller: controller,
                validator: (value) {
                  return value!.isEmpty ? "veillez remplir se champs" : null;
                },
                keyboardType: type,
                obscureText: obscureText!,
                // maxLengthEnforced: false,

                maxLines: 10,
                decoration: new InputDecoration(
                  fillColor: ColorsApp.tird,
                  counter: Offstage(),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    /*   borderSide: BorderSide(
                        color: ColorsApp.grey,
                      ) */
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: ColorsApp.tird,
                    ),
                  ),
                  contentPadding: EdgeInsets.only(
                    left: 12,
                    bottom: 10,
                    top: 10,
                    right: 12,
                  ),
                  hintText: hint,
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  // suffixIcon: InkWell(
                  //   onTap: () => onTap,
                  //   child: Icon(
                  //     icon,
                  //     color: Colors.grey,
                  //   ),
                  // ),
                ),
              )
            ]));
  }
}
