import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

class AppDropdown<T> extends StatelessWidget {
  final T? value;
  final List<T> items;
  final String hint;
  final String? title;
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
      this.title,
      this.maxWidth});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: kMarginY),
          child: Text(title!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: kBasics,
                fontWeight: FontWeight.w700,
              )),
        ),
        Container(
          decoration: BoxDecoration(
            color: ColorsApp.greyNew,
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
        ),
      ],
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
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
