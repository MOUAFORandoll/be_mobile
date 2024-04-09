import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

showError(
  String message,
  BuildContext context,
) {
  var snackBar = SnackBar(
    backgroundColor: ColorsApp.red,
    content: Row(
      children: [
        Expanded(child: Text(message)),
        const Icon(Icons.warning),
      ],
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

showSuccess(
  String message,
  BuildContext context,
) {
  var snackBar = SnackBar(
    backgroundColor: ColorsApp.primary,
    content: Row(
      children: [
        Expanded(
            child: Text(
          message,
          style: TextStyle(color: ColorsApp.white),
        )),
        const Icon(Icons.done, color: ColorsApp.white),
      ],
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
