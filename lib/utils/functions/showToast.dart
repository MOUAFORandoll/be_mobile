import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
  // var snackBar = SnackBar(

  //   dismissDirection: DismissDirection.up,
  //   behavior: SnackBarBehavior.floating,
  //   padding: EdgeInsets.all(20),
  //   backgroundColor: ColorsApp.red,
  //   content: Row(
  //     children: [
  //       Expanded(child: Text(message)),
  //       const Icon(Icons.warning),
  //     ],
  //   ),
  // );
  // ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

showSuccess(
  String message,
  BuildContext context,
) {
  var snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    padding: EdgeInsets.all(20),
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

showSuccessGetContact(
  String message,
  BuildContext context,
) {
  var snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    backgroundColor: ColorsApp.second,
    duration: Duration(seconds: 5),
    padding: EdgeInsets.all(20),
    content: Row(
      children: [
        Expanded(
            child: Text(
          message,
          style: TextStyle(color: ColorsApp.white),
        )),
        // const Icon(Icons.done, color: ColorsApp.white),
      ],
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
