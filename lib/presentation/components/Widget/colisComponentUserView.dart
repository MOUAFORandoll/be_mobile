import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/utils/functions/formatData.dart';
import '../../../application/model/exportmodel.dart';

// ignore: must_be_immutable
class ColisComponentUserView extends StatelessWidget {
  Colis? colis;
  var onTap;

  ColisComponentUserView({this.colis, this.onTap});
  @override
  Widget build(BuildContext context) {
    // final getWidth(context) = AppSize().getSize(context: context,390.0);
    return InkWell(
        onTap: colis != null
            ? () {
                CustomArlert().comfirm(
                    context: context,
                    content: 'Voulez-vous retirer ce colis'.tr(),
                    onpressed: (() {
                      context
                          .read<LivraisonBloc>()
                          .add(DeleteColis(idColis: colis!.id));
                    }));
              }
            : onTap,
        child: colis != null
            ? Container(
                alignment: Alignment.center,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
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
                            colis!.listImgColis[0],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(vertical: kMarginY)
                              .add(EdgeInsets.only(
                            right: kMarginX / 2,
                          )),
                          child: Text(
                              FormatData().capitalizeFirstLetter(colis!.nom)))
                    ]))
            : Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 0)
                            .add(EdgeInsets.only(
                          right: kMarginX / 2,
                        )),
                        height: getWidth(context) * .24,
                        width: getWidth(context) * .24,
                        decoration: BoxDecoration(
                          color: ColorsApp.white,
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
                        child: Icon(
                          Icons.add,
                          size: 50,
                        )),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: kMarginY)
                            .add(EdgeInsets.only(
                          right: kMarginX / 2,
                        )),
                        child: Text('Ajouter un Colis'))
                  ],
                )));
  }
}
