import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

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
  final int? maxLength;
  AppInputNew(
      {required this.controller,
      required this.label,
      this.validator,
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
  State<AppInputNew> createState() => _AppInputNewState();
}

class _AppInputNewState extends State<AppInputNew> {
  bool isFocused = false;
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: getHeight(context) / 10,
      child: Focus(
        onFocusChange: (focus) {
          setState(() {
            isFocused = focus;
          });
        },
        child: TextFormField(
          autofocus: false,
          textAlign: widget.alignStart ? TextAlign.start : TextAlign.center,
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
                    color: isFocused ? ColorsApp.primary : ColorsApp.white,
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
              labelText: widget.label,
              labelStyle: TextStyle(
                color: ColorsApp.grey, fontFamily: 'Lato',
                // fontWeight: FontWeight.w500,
                fontSize: kBasics,
              ),
              hintText: widget.placeholder,
              prefixIcon: widget.icon),
          validator: widget.validator,
          obscureText: isVisible,
          keyboardType: widget.textInputType,
        ),
      ),
    );
  }
}
