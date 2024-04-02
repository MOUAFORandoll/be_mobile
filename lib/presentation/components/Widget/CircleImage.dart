import 'package:cached_network_image/cached_network_image.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

class CircleImage extends StatelessWidget {
  CircleImage({required this.imageUrl, this.radius = 25});

  final imageUrl, radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: double.parse(radius.toString()),
      backgroundColor: ColorsApp.grey,
      child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: imageUrl,
          imageBuilder: (context, imageProvider) {
            return Container(
                height: getWith(context) / 5,
                width: getWith(context) / 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: ColorsApp.grey, width: 1),
                  image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.transparent, BlendMode.colorBurn)),
                ));
          },
          placeholder: (context, url) {
            return Container(
              child: Center(
                  child: CircularProgressIndicator(color: ColorsApp.second)),
            );
          },
          errorWidget: (context, url, error) {
            return Container(
                height: getWith(context) / 5,
                width: getWith(context) / 5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: ColorsApp.grey, width: 1),
                    image: DecorationImage(
                      image: AssetImage('assets/logo/logo.png'),
                    )));
          }),
    );
  }
}
