// import 'dart:io';
// import 'package:path_provider/path_provider.dart';
// import 'package:open_file/open_file.dart';

// class PdfApi {
//   static Future<File> saveDocument({
//     required String name,
//     required Document pdf,
//   }) async {
//     final bytes = await pdf.save();

//     final dir = await getApplicationDocumentsDirectory();
//     final appDir =
//         await Directory('${dir.path}/Documents/PDF').create(recursive: true);

//     //final file = File('${dir.path}/$name');
//     final file = File('${appDir.path}/$name');

//     await file.writeAsBytes(bytes);

//     return file;
//   }

//   static Future openFile(File file) async {
//     final url = file.path;

//     await OpenFile.open(url);
//   }
// }
