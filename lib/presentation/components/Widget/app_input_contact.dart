import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/widgets.dart';

class AppInputContact extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String? value)? validator;
  final String label;
  final String? errorText;
  final String? placeholder;
  final ValueChanged<String>? onChanged;
  final Function()? onTap;
  final bool obscureText;
  final bool border;
  final TextInputType? textInputType;
  final bool alignStart;
  final Icon? icon;
  final int? maxLength;
  AppInputContact(
      {required this.controller,
      required this.label,
      this.validator,
      this.onTap,
      this.placeholder,
      this.errorText,
      this.maxLength,
      this.onChanged,
      this.obscureText = false,
      this.border = false,
      this.alignStart = true,
      this.textInputType,
      this.icon});

  @override
  State<AppInputContact> createState() => _AppInputContactState();
}

class _AppInputContactState extends State<AppInputContact> {
  bool isFocused = false;
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            // width: getWidth(context) * .7,
            child: Focus(
              onFocusChange: (focus) {
                setState(() {
                  isFocused = focus;
                });
              },
              child: TextFormField(
                autofocus: false,
                textAlign:
                    widget.alignStart ? TextAlign.start : TextAlign.center,
                controller: widget.controller,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  fontFamily: 'Lato',
                ),
                maxLength: widget.maxLength,
                onChanged: widget.onChanged,
                decoration: InputDecoration(
                    fillColor:
                        isFocused ? Colors.grey.shade200 : Colors.grey.shade200,
                    filled: true,
                    contentPadding: EdgeInsets.all(18),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color:
                              isFocused ? ColorsApp.primary : ColorsApp.white,
                          width: .4),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorsApp.red, width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: isFocused ? ColorsApp.grey : Colors.transparent,
                        width: .5,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    errorText: widget.errorText,
                    errorStyle: TextStyle(
                      fontSize: 8,
                      fontFamily: 'Lato',
                    ),
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Colors.grey.shade500,
                      fontFamily: 'Lato',
                      overflow: TextOverflow.ellipsis,
                    ),
                    labelText: widget.label,
                    labelStyle: TextStyle(
                      color: ColorsApp.grey,
                      fontFamily: 'Lato',
                      fontSize: 12,
                    ),
                    hintText: widget.placeholder,
                    prefixIcon: widget.icon),
                validator: widget.validator,
                obscureText: isVisible,
                keyboardType: widget.textInputType,
              ),
            ),
          ),
          InkWell(
              child: Container(
                  height: getHeight(context) * .06,
                  width: getHeight(context) * .06,
                  margin: EdgeInsets.only(left: kMarginX),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: ColorsApp.primary,
                      borderRadius: BorderRadius.circular(8)),
                  child: Icon(
                    Icons.contacts,
                    color: ColorsApp.white,
                  )),
              onTap: widget.onTap),
        ],
      ),
    );
  }
}
