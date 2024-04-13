import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

// import 'package:fluttertoast/fluttertoast.dart';

// showSuccessToast(String message) {
//   Fluttertoast.showToast(
//     msg: message,
//     toastLength: Toast.LENGTH_SHORT,
//     gravity: ToastGravity.TOP, // Position du toast en haut
//     timeInSecForIosWeb: 1,
//     backgroundColor: ColorsApp.primary, // Couleur de l'arrière-plan du toast
//     textColor: ColorsApp.white, // Couleur du texte du toast
//     fontSize: 16.0,
//   );
// }

showError(
  String message,
  BuildContext context,
) {
  var snackBar = SnackBar(
    dismissDirection: DismissDirection.up,
    behavior: SnackBarBehavior.floating,
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
    behavior: SnackBarBehavior.floating,
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
