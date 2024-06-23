import 'package:BabanaExpress/application/model/data/LivraisonMedicamentModel.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

import 'package:BabanaExpress/application/export_bloc.dart';

// ignore: must_be_immutable
class MedicamentComponentUser extends StatelessWidget {
  Medicament medicament;

  MedicamentComponentUser({
    required this.medicament,
  });
  GlobalKey globalKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LivraisonBloc, LivraisonState>(
      builder: (context, state) => InkWell(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: ColorsApp.primary.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(-1, 0),
              ),
            ],
          ),
          child: Stack(
            children: [
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          child: CachedNetworkImage(
                        height: getHeight(context) * .15,
                        fit: BoxFit.cover,
                        imageUrl: 'medicament.images[0].src',
                        imageBuilder: (context, imageProvider) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                      Colors.transparent, BlendMode.colorBurn)),
                            ),
                          );
                        },
                        placeholder: (context, url) {
                          return Container(
                            child: Shimmer.fromColors(
                                baseColor: ColorsApp.greyNew,
                                highlightColor:
                                    ColorsApp.primary.withOpacity(.1),
                                child: Container(
                                  // height: getHeight(context) / 10,
                                  // width: getHeight(context) / 10,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: ColorsApp.greyNew,
                                  ),
                                )),
                          );
                        },
                        errorWidget: (context, url, error) {
                          return Container(
                              // height: getHeight(context) / 10,
                              // width: getHeight(context) / 10,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/login.png'))));
                        },
                      )),
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    color: ColorsApp.greyNew, width: .5))),
                        alignment: Alignment.center,
                        width: getWidth(context) / 2,
                        child: Text(
                          medicament.libelle,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
