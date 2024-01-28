import 'package:BananaExpress/styles/colorApp.dart';
import 'package:BananaExpress/styles/textStyle.dart';
import 'package:flutter/material.dart';

class AppInputNew extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String? value)? validator;
  final String label;
  final String? errorText;
  final String? placeholder;
  final ValueChanged<String>? onChanged;
  final bool obscureText;
  final bool border;
  final TextInputType? textInputType;
  final bool alignStart;
  final Icon? icon;
  AppInputNew(
      {required this.controller,
      required this.label,
      this.validator,
      this.placeholder,
      this.errorText,
      this.onChanged,
      this.obscureText = false,
      this.border = false,
      this.alignStart = true,
      this.textInputType,
      this.icon});

  @override
  State<AppInputNew> createState() => _AppInputNewState();
}

class _AppInputNewState extends State<AppInputNew> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        autofocus: false,
        textAlign: widget.alignStart ? TextAlign.start : TextAlign.center,
        controller: widget.controller,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 12,
          fontFamily: 'Lato',
        ),
        onChanged: widget.onChanged,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorsApp.primary, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorsApp.red, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorsApp.grey, width: 1),
              borderRadius: BorderRadius.circular(8),
              // borderSide:
              //     BorderSide(color: ColorsApp.tird, width: 1),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            errorText: widget.errorText,
            errorStyle: TextStyle(
              fontSize: 8,
              fontFamily: 'Lato',
            ),
            labelText: widget.label,
            labelStyle: TextStyle(
              color: ColorsApp.primary, fontFamily: 'Lato',
              // fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
            hintText: widget.placeholder,
            prefixIcon: widget.icon),
        validator: widget.validator,
        obscureText: isVisible,
        keyboardType: widget.textInputType,
      ),
    );
  }
}
