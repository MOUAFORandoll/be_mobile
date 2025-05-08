import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/utils/functions/formatData.dart';
 

import '../../../application/model/exportmodel.dart';

// ignore: must_be_immutable
class ColisComponent extends StatelessWidget {
  Colis colis;

  ColisComponent({
    required this.colis,
  });
  @override
  Widget build(BuildContext context) {
    // final getWidth(context) = AppSize().getSize(context: context,390.0);
    return BlocBuilder<LivraisonBloc, LivraisonState>(
      builder: (context, state) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: ColorsApp.primary.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 2), // changes position of shadow
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
                        // margin: EdgeInsets.only(right: 5),
                        width: getWidth(context) / 2.2,
                        height: getHeight(context) / 6.5,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          child: Image.file(
                            colis.listImgColis[0],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(/* left: 5, */ top: kMarginY),
                        alignment: Alignment.center,
                        width: getWidth(context) / 2,
                        child: Text(
                          FormatData().capitalizeFirstLetter(colis.nom),
                          textAlign: TextAlign.start,
                          maxLines: 2,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  print('*------------------${colis.id}---------');
                  context.read<LivraisonBloc>().add(SelectColis(colis: colis));

                    }),
            Positioned(
              left: getWidth(context) / 3,
              // top: 10,
              child: InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        // topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(8),
                  child: Icon(Icons.close, color: Colors.red, size: 15),
                ),
                onTap: () {
                  print('*------------------${colis.id}---------');
                  print(colis.id);
                  context
                      .read<LivraisonBloc>()
                      .add(DeleteColis(idColis: colis.id));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
