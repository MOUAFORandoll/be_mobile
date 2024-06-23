import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class AppDropdown<T> extends StatelessWidget {
  final T? value;
  final List<T> items;
  final String hint;
  final Function(T?)? onChanged;
  final String Function(T) itemLabelBuilder;
  final bool hasError;
  final double? maxWidth;
  AppDropdown(
      {required this.value,
      required this.items,
      required this.hint,
      required this.onChanged,
      required this.itemLabelBuilder,
      this.hasError = false,
      this.maxWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        border: Border.all(
          color: hasError ? Colors.red : Colors.grey.shade200,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      height: getHeight(context) * .06,
      // width: getWidth(context) * .65,
      constraints: maxWidth != null
          ? BoxConstraints(
              minWidth: getWidth(context) * .65,
              maxWidth: maxWidth!,
            )
          : BoxConstraints(
              minWidth: getWidth(context) * .65,
              maxWidth: getWidth(context)!,
            ),
      padding: EdgeInsets.symmetric(horizontal: 7),
      alignment: Alignment.center,
      child: DropdownButton<T>(
        isExpanded: true,
        value: value,
        hint: _buildDropdownHint(context),
        icon: Icon(Icons.keyboard_arrow_down_outlined, size: 25),
        underline: SizedBox(),
        style: TextStyle(color: Colors.black, fontSize: 12),
        onChanged: onChanged,
        items: items.map((T value) {
          return DropdownMenuItem(
            value: value,
            child: Center(child: Text(itemLabelBuilder(value))),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildDropdownHint(BuildContext context) {
    return Container(
      width: getWidth(context) * .65,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 7),
      child: Text(
        hint,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 12,
          color: Colors.grey.shade500,
          fontFamily: 'Lato',
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
