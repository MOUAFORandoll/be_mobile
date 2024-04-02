import '../exportcomponent.dart';

class AppInput extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String? value)? validator;
  final String? label;
  final String? errorText;
  final String placeholder;
  final ValueChanged<String>? onChanged;
  final bool obscureText;
  final TextInputType? textInputType;
  final Icon? icon;
  final prefix;
  const AppInput(
      {Key? key,
      required this.controller,
      this.label,
      this.validator,
      this.placeholder = '',
      this.errorText,
      this.onChanged,
      this.obscureText = false,
      this.textInputType,
      this.prefix,
      this.icon})
      : super(key: key);

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(
          horizontal: kMarginX,
        ).add(EdgeInsets.only(
          top: kMarginY,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.only(
                  bottom: kMarginY,
                ),
                child: Text(
                  widget.placeholder,
                  style: TextStyle(
                    color: ColorsApp.black.withOpacity(.3),
                    fontSize: 12,
                    fontFamily: 'Lato',
                  ),
                )),
            TextFormField(
              cursorColor: ColorsApp.tird, autofocus: false,
              controller: widget.controller,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                // color: ColorsApp.tird,
                fontSize: 12,
                fontFamily: 'Lato',
              ),

              // maxLength: widget.maxLength,
              onChanged: widget.onChanged,

              decoration: InputDecoration(
                  fillColor: ColorsApp.primary.withOpacity(0.3),
                  focusColor: ColorsApp.primary.withOpacity(0.3),
                  hoverColor: ColorsApp.primary.withOpacity(0.3),
                  // label: Text(widget.placeholder!),
                  contentPadding: EdgeInsets.all(15),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsApp.primary, width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsApp.red, width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsApp.grey, width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  errorText: widget.errorText,
                  errorStyle: TextStyle(
                    fontFamily: 'Lato',
                    color: ColorsApp.red,
                  ),
                  prefixIcon: widget.prefix,
                  hintText: widget.textInputType == TextInputType.phone
                      ? 'Entrer des chiffres'
                      : 'Entrer du texte',
                  // widget.placeholder,
                  hintStyle: TextStyle(
                    color: ColorsApp.black.withOpacity(.3),
                    fontSize: 12,
                    fontFamily: 'Lato',
                  ),
                  suffixIcon: widget.icon),
              validator: widget.validator,
              obscureText: isVisible,
              keyboardType: widget.textInputType,
            ),
          ],
        ));
  }
}

class AppInputPassword extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String? value)? validator;

  final String? errorText;
  final String placeholder;
  final ValueChanged<String>? onChanged;
  final bool obscureText;
  // final bool valid;
  final TextInputType? textInputType;
  const AppInputPassword({
    Key? key,
    required this.controller,
    this.validator,
    // this.valid = false,
    this.placeholder = '',
    this.errorText,
    this.onChanged,
    this.obscureText = false,
    this.textInputType,
  }) : super(key: key);

  @override
  State<AppInputPassword> createState() => _AppInputPasswordState();
}

class _AppInputPasswordState extends State<AppInputPassword> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(
        horizontal: kMarginX,
      ).add(EdgeInsets.only(
        top: kMarginY,
      )),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.only(
                  bottom: kMarginY,
                ),
                child: Text(
                  widget.placeholder,
                  style: TextStyle(
                    color: ColorsApp.black.withOpacity(.3),
                    fontSize: 12,
                    fontFamily: 'Lato',
                  ),
                )),
            TextFormField(
              autofocus: false,
              controller: widget.controller,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                // color: ColorsApp.tird,
                fontSize: 12,
                fontFamily: 'Lato',
              ),
              cursorColor: ColorsApp.tird,
              // maxLength: widget.maxLength,
              onChanged: widget.onChanged,

              decoration: InputDecoration(
                  fillColor: ColorsApp.primary.withOpacity(0.3),
                  focusColor: ColorsApp.primary.withOpacity(0.3),
                  hoverColor: ColorsApp.primary.withOpacity(0.3),
                  // label: Text(widget.placeholder),
                  contentPadding: EdgeInsets.all(15),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsApp.primary, width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsApp.red, width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsApp.grey, width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  // errorText: widget.errorText,
                  errorStyle: TextStyle(
                    fontFamily: 'Lato',
                    color: ColorsApp.red,
                  ),
                  hintText: 'Entrer du texte',
                  /*  widget.placeholder, */
                  hintStyle: TextStyle(
                    color: ColorsApp.black.withOpacity(.3),
                    fontSize: 12,
                    fontFamily: 'Lato',
                  ),
                  suffixIcon: widget.obscureText == true
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          icon: Icon(
                              isVisible
                                  ? Icons.remove_red_eye
                                  : FontAwesomeIcons.eyeSlash,
                              size: isVisible ? 22 : 19
                              /*     */
                              ),
                        )
                      : null),
              validator: widget.validator,
              obscureText: isVisible,
              keyboardType: widget.textInputType,
            ),
          ],
        ),
      ),
    );
  }
}
