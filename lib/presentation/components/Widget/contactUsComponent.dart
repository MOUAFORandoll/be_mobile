import 'package:BananaExpress/presentation/components/exportcomponent.dart';

class ContactUsButton extends StatefulWidget {
  @override
  _ContactUsButtonState createState() => _ContactUsButtonState();
}

class _ContactUsButtonState extends State<ContactUsButton> {
  Color icon = ColorsApp.tird;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.sms_outlined),
      onPressed: () {},
    );
  }
}
