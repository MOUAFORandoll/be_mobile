import 'dart:io';

import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

class LoadFileWidget extends StatelessWidget {
  LoadFileWidget({
    required XFile this.file,
    this.onTap,
  });
  final XFile file;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
            height: getHeight(context) * .1,
            width: getHeight(context) * .07,
            margin: EdgeInsets.only(left: 10),
            child: Image.file(File(file.path), fit: BoxFit.cover),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            )),
        onTap: onTap);
  }
}
