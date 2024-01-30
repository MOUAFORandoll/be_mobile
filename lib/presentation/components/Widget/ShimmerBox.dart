import 'package:BananaExpress/presentation/components/exportcomponent.dart';
 
// ignore: must_be_immutable
class ShimmerBox extends StatelessWidget {
  ShimmerBox({this.height});
  var height;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: ColorsApp.grey,
        highlightColor: Colors.blueGrey,
        child: Container(
            height: getHeight(context) / 8,
            width: getHeight(context) / 8,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: ColorsApp.grey, borderRadius: BorderRadius.circular(8)),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [])));
  }
}
