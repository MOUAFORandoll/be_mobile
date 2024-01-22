import 'package:BananaExpress/components/exportcomponent.dart';
import 'package:toast/toast.dart';

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
        Expanded(child: Text(message)),
        const Icon(Icons.done),
      ],
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
