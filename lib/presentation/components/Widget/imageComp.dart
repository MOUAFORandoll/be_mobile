import 'dart:io';

import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

// ignore: must_be_immutable
class ImageComp extends StatelessWidget {
  File file; 
  ImageComp({
    required this.file, 
  });
  @override
  Widget build(BuildContext context) {
    return    Container(
                        margin: EdgeInsets.symmetric(vertical: 0)
                            .add(EdgeInsets.only(
                          right: kMarginX / 2,
                        )),
                        height: getWidth(context) * .24,
                        width: getWidth(context) * .24,
                        decoration: BoxDecoration(
                          color: ColorsApp.red,
                          borderRadius: BorderRadius.circular(150),
                          boxShadow: [
                            BoxShadow(
                              color: ColorsApp.primary.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(0, 2),
                            ),
                            BoxShadow(
                              color: ColorsApp.black.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(150),
                          child: Image.file(
                            file,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
  }
}
