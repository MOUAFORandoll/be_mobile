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
  openModal() {}

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

// class Loader {
//   openModal(context) {
//     print('open------');
//     double value = 0;
//     Timer? timer;
//     timer = Timer.periodic(Duration(seconds: 1), (_) {
//       if (value >= 1) {
//         value = 0.0;
//         print('iiciccic');
//       } else {
//         print('00000');
//       value =  value + 0.1;
//       }
//       print(value);
//       // Cette méthode force le widget à se redessiner, ce qui est nécessaire pour voir la progression
//       (context as Element).markNeedsBuild();
//     });

//     return showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) => Container(
//           height: getHeight(context) * .25,
//           padding: EdgeInsets.symmetric(
//               horizontal: kMarginX * 2, vertical: kMarginY * 2),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(10),
//               topRight: Radius.circular(10),
//             ),
//             color: ColorsApp.white,
//           ),
//           child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Container(
//                     margin: EdgeInsets.only(top: kMarginY * 2),
//                     child: Text(
//                       'Connexion'.tr(),
//                       style:
//                           TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                     )),
//                 Container(
//                     margin: EdgeInsets.symmetric(vertical: kMarginY * 2),
//                     child: Text(
//                       'Veuillez patienter pendant que nous verifions vos informations de connexion...',
//                       style: TextStyle(fontWeight: FontWeight.w500),
//                     )),
//                 CupertinoProgressBar(
//                   value: value,
//                 ),
//               ])),
//       isScrollControlled: true,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
//       ),
//       backgroundColor: Colors.transparent,
//     ).whenComplete(() {
//       timer?.cancel();
//     });
//   }

//   closeModal() {}

//   /// Show the dialog
// }

class Loader {
  void openModal(
      {required BuildContext context,
      title = '',
      description = 'En cours de demande'}) {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      enableDrag: false,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return Container(
            height: 180,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: Colors.white,
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      description,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  AnimatedLineOverlay(
                    height: 3.0,
                    width: getWith(context),
                  )
                ]),
          );
        });
      },
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      backgroundColor: Colors.transparent,
    ).whenComplete(() {});
  }

  closeModal() {}

  // Méthode closeModal si nécessaire
}

class AnimatedLineOverlay extends StatefulWidget {
  final double height;
  final double width;

  const AnimatedLineOverlay({
    Key? key,
    this.height = 5.0,
    this.width = 200.0,
  }) : super(key: key);

  @override
  State<AnimatedLineOverlay> createState() => _AnimatedLineOverlayState();
}

class _AnimatedLineOverlayState extends State<AnimatedLineOverlay>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _foregroundOffset;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();

    _foregroundOffset =
        Tween<double>(begin: -5, end: widget.width / 1.7).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Ligne grise en arrière-plan
        Container(
          height: widget.height,
          width: widget.width,
          color: Colors.red.withOpacity(.2),
        ),
        // Ligne colorée en premier plan qui se déplace
        AnimatedBuilder(
          animation: _foregroundOffset,
          builder: (context, child) => Transform(
            transform:
                Matrix4.translationValues(_foregroundOffset.value, 0.0, 0.0),
            child: Container(
              height: widget.height,
              width: widget.width / 3,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
