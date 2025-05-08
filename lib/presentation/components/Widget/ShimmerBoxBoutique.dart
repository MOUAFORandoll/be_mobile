import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

// ignore: must_be_immutable
class ShimmerBoxBoutique extends StatelessWidget {
  ShimmerBoxBoutique({this.height});
  var height;
  @override
  Widget build(BuildContext context) {
    return/*  Shimmer.fromColors(
        baseColor: ColorsApp.grey,
        highlightColor: Colors.blueGrey,
        child:  */Skeletonizer( enabled: true, child:Container(
            height: getHeight(context) * .2,
            width: getHeight(context) * .15,
            decoration: BoxDecoration(
              color: ColorsApp.grey,
              borderRadius: BorderRadius.circular(50),
            )));
  }
}
