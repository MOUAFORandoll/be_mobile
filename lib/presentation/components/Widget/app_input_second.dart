import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

class AppInputSecond extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String? value)? validator;

  final String? errorText;
  final String? placeholder;
  final ValueChanged<String>? onChanged;
  final TextInputType? textInputType;
  final Icon? icon;
  final int? maxLength;
  AppInputSecond(
      {required this.controller,
      this.validator,
      this.placeholder,
      this.errorText,
      this.maxLength,
      this.onChanged,
      this.textInputType,
      this.icon});

  @override
  State<AppInputSecond> createState() => _AppInputSecondState();
}

class _AppInputSecondState extends State<AppInputSecond> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: getHeight(context) / 10,
      child: TextFormField(
        autofocus: false,
        textAlign: TextAlign.center,
        controller: widget.controller,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorsApp.red, width: .5),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          border:
              OutlineInputBorder(borderSide: BorderSide.none, gapPadding: 0),
          errorText: widget.errorText,
          errorStyle: TextStyle(
            fontSize: 8,
            color: ColorsApp.red,
          ),
        ),
        maxLength: widget.maxLength,
        onChanged: widget.onChanged,
        validator: widget.validator,
        obscureText: isVisible,
        keyboardType: widget.textInputType,
      ),
    );
  }
}
