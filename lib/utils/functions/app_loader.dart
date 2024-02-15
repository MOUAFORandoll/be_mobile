import 'dart:async';
import 'package:loading_indicator/loading_indicator.dart';
import 'bounce_loader.dart';

import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

// / App loaders
// / final _loaderDialogController = IndeterminateProgress.bounceLargeColorLoaderController();
// / _loaderDialogController.open(context);
// / _loaderDialogController.close();

// /
class AppLoader {
  static Widget circular(
      {Color? color, double scale = .7, double strokeWidth = 6}) {
    color ??= ColorsApp.primary;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Transform.scale(
            scale: scale,
            child: CircularProgressIndicator(
              strokeWidth: strokeWidth,
              color: ColorsApp.second,
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ))
      ],
    );
  }

  static Widget ballClipRotateMultiple({double size = 50, Color? color}) {
    return Container(
        alignment: Alignment.center,
        height: size,
        width: size,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            LoadingIndicator(
              indicatorType: Indicator.ballClipRotateMultiple,
              backgroundColor: color,
            ),
          ],
        ));
  }

  static Widget ballRotateChase({double size = 50, Color? color}) {
    return SizedBox(
      height: size,
      width: size,
      child: const LoadingIndicator(indicatorType: Indicator.ballRotateChase),
    );
  }

  static Widget bounceLargeColorLoader({double radius = 30.0}) =>
      BounceLargeColorLoader(
        radius: radius,
      );

  static LoaderDialogController bounceLargeColorLoaderController() =>
      LoaderDialogController(loader: BounceLargeColorLoader());
}

class _LoaderDialog extends StatefulWidget {
  final Widget loader;
  final StreamController<String> controller;

  /// Create a loader dialog that cannot be
  /// dismissed by pressing the back button.
  const _LoaderDialog({required this.loader, required this.controller});

  @override
  _LoaderDialogState createState() => _LoaderDialogState();

  /// Show the dialog loader.
  void open(BuildContext context) {
    showDialog(
        context: context, barrierDismissible: false, builder: (ctx) => this);
  }
}

class _LoaderDialogState extends State<_LoaderDialog> {
  bool loading = true;

  @override
  void initState() {
    super.initState();
    widget.controller.stream.listen((event) {
      if (mounted) {
        if (event == 'close' && loading) {
          print('close loader required');
          setState(() {
            loading = false;
            print('---------------close loader required');
          });
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            Navigator.of(context).canPop() ? Navigator.of(context).pop() : null;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    widget.controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (val) async => !loading,
      child: Center(
        child: widget.loader,
      ),
    );
  }
}

class LoaderDialogController {
  Widget loader;

  StreamController<String> _streamController = StreamController<String>();
  
  LoaderDialogController({required this.loader});

  /// Show the dialog
  void open(BuildContext context) {
    _streamController = StreamController<String>();
    _LoaderDialog(loader: loader, controller: _streamController).open(context);
  }

  /// Close the dialog
  StreamController<String> close() {
    if (_streamController.isClosed) {
      _streamController = StreamController<String>();
    }
    
    return _streamController..add('close');
  }
}
