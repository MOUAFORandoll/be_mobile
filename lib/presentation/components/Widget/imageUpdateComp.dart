import 'dart:io';

import 'package:BananaExpress/old/controller/LivraisonController.dart';
import 'package:BananaExpress/styles/textStyle.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../application/export_bloc.dart';

// ignore: must_be_immutable
class ImageUpdateComp extends StatelessWidget {
  File file;
  int index;
  int idColis;
  ImageUpdateComp({
    required this.file,
    required this.idColis,
    required this.index,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LivraisonBloc, LivraisonState>(
        builder: (context, state) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(children: [
                InkWell(
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        margin: EdgeInsets.only(right: 5),
                        height: getHeight(context) / 5,
                        width: getWith(context) / 3,
                        child: Image.file(
                          file,
                          fit: BoxFit.cover,
                        )),
                    onTap: () async {
                      // _controller.addImageToColis(idColis);
                    }),
                Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10)),
                            color: Colors.white),
                        padding: EdgeInsets.all(5),
                        child: InkWell(
                            child:
                                Icon(Icons.close, color: Colors.red, size: 15),
                            onTap: () async {
                              context.read<LivraisonBloc>().add(
                                  RemoveImageFromColis(
                                      idColis: idColis, position: index));
                            })))
              ]),
            ));
  }
}
