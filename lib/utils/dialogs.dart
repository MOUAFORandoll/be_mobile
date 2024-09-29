import 'dart:async';

import 'package:BabanaExpress/presentation/_commons/theming/app_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:BabanaExpress/common/services/api_service.dart';
import 'package:BabanaExpress/common/widgets/bottom_sheet.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showSuccessToast(
  String content,
) {
  Fluttertoast.showToast(
      msg: content,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 6,
      textColor: Colors.white,
      backgroundColor: ThemeApp.second,
      fontSize: 16.0);
}

void showErrorToast(
  String content,
) {
  Fluttertoast.showToast(
      msg: content,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 6,
      textColor: Colors.white,
      backgroundColor: ThemeApp.errorRed,
      fontSize: 16.0);
}
