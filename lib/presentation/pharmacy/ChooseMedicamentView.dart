import 'package:BabanaExpress/presentation/components/Widget/searchInputMedicamentComponent.dart';
import 'package:BabanaExpress/utils/constants/assets.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../application/export_bloc.dart';
import '../components/exportcomponent.dart';

class ChooseMedicamentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PharmacyBloc, PharmacyState>(
        builder: (
      BuildContext context,
      state,
    ) =>
            Container(
              decoration: BoxDecoration(
                  color: ColorsApp.white,
                  boxShadow: [
                    BoxShadow(
                      color: ColorsApp.primary.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                    BoxShadow(
                      color: ColorsApp.greyNew.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(8)),
              margin: EdgeInsets.symmetric(horizontal: kMarginX),
              padding: EdgeInsets.all(kMarginX * 1.5),
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      SearchInputMedicamentComponent(
                        controller: state.searchMedicamentController!,
                        label: 'Nom du medicament',
                        loading: state.isLoadedMedicament!,
                        data: state.listMedicament!,
                        close: () => context
                            .read<PharmacyBloc>()
                            .add(CloseListMedicament()),
                        verifyContains: (value) =>
                            context.read<PharmacyBloc>().verifyContains(value),
                        onTap: (value) {
                          context
                              .read<PharmacyBloc>()
                              .add(ChooseMedicament(medicament: value));

                          context
                              .read<PharmacyBloc>()
                              .add(CloseListMedicament());
                        },
                        onChanged: (value) => context
                            .read<PharmacyBloc>()
                            .add(FindMedicament(search: value)),
                      ),
                      if (state.listMedicamentChoose!.length == 0)
                        Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: kMarginY) * 6,
                            child: Text(
                              'Veuillez Choisir vos medicaments'.tr(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 20),
                            )),
                      if (state.listMedicamentChoose!.length != 0)
                        Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(top: kMarginY) * 2,
                            padding: EdgeInsets.only(bottom: kMarginY),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: ColorsApp.primary
                                            .withOpacity(.5)))),
                            child: Text(
                              'Medicament Selectionnees'.tr(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 14),
                            )),
                      // if (state.listMedicamentChoose!.length != 0)
                      //   Container(
                      //       alignment: Alignment.centerLeft,
                      //       margin: EdgeInsets.only(top: kMarginY) * 2,
                      //       padding: EdgeInsets.only(bottom: kMarginY),
                      //       decoration: BoxDecoration(
                      //           border: Border(
                      //               bottom: BorderSide(
                      //                   color:
                      //                       ColorsApp.primary.withOpacity(.5)))),
                      //       child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           Container(
                      //             child: Text('Nom'),
                      //           ),
                      //           Container(
                      //             child: Text('Quantite'),
                      //           ),
                      //           Container()
                      //         ],
                      //       )),
                      if (state.listMedicamentChoose!.length != 0)
                        Container(
                            width: getWidth(context),
                            margin: EdgeInsets.symmetric(vertical: kMarginY),
                            child: SingleChildScrollView(
                                child: ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount:
                                        state.listMedicamentChoose!.length,
                                    itemBuilder: (_, index) => InkWell(
                                          child: SelectedMedicament(
                                              onDelete: () => context
                                                  .read<PharmacyBloc>()
                                                  .add(DeleteMedicament(
                                                      medicament: state
                                                              .listMedicamentChoose![
                                                          index])),
                                              medicament:
                                                  state.listMedicamentChoose![
                                                      index]),
                                        ))))
                    ],
                  ),
                ),
              ),
            ));
  }
}

// ignore: must_be_immutable
class SelectedMedicament extends StatelessWidget {
  SelectedMedicament({required this.medicament, required this.onDelete});
  MedicamentModel medicament;
  final onDelete;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kMarginY / 2.5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Color.fromARGB(255, 231, 229, 229),
        ),
        color: ColorsApp.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                // border: Border.all(
                //   color: Color.fromARGB(255, 231, 229, 229),
                // ),
              ),
              child: CachedNetworkImage(
                height: getHeight(context) * .06,
                width: getHeight(context) * .07,
                imageUrl: 'medicament.images[0].src',
                imageBuilder: (context, imageProvider) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.contain,
                          colorFilter: ColorFilter.mode(
                              Colors.transparent, BlendMode.colorBurn)),
                    ),
                  );
                },
                placeholder: (context, url) {
                  return Container(
                    child: /*  Shimmer.fromColors(
                       baseColor: ColorsApp.greyNew,
                        highlightColor: ColorsApp.primary.withOpacity(.1),
                        child: */
                        Skeletonizer(
                            enabled: true,
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
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage(Assets.medicament))));
                },
              )),
          Container(
            child: Column(
              children: [
                Container(
                  width: getWidth(context) * .3,
                  child: Text(
                    medicament.libelle,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      // color: ColorsApp.white,
                    ),
                  ),
                ),
                Container(
                  width: getWidth(context) * .3,
                  child: Text(
                    '400 g',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      // color: ColorsApp.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          InkWell(
              child: Container(
                  padding: EdgeInsets.all(10),
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: ColorsApp.grey, width: 1),
                      color: ColorsApp.white),
                  child: Text(
                    '${medicament.quantite}',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      // color: ColorsApp.white,
                    ),
                  )),
              onTap: () => openModalAddColis(context, medicament)),
          InkWell(
              child: Container(
                  child: Icon(
                Icons.close,
                color: ColorsApp.red,
              )),
              onTap: onDelete),
        ],
      ),
    );
  }

  openModalAddColis(context, MedicamentModel medicament) =>
      showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            TextEditingController _quantite = new TextEditingController();
            _quantite.text = medicament.quantite.toString();
            return BlocBuilder<LivraisonBloc, LivraisonState>(
                builder: (context, state) => Container(
                    height: getHeight(context) * .3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: ColorsApp.white,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: kMarginX,
                    ).add(EdgeInsets.only(top: kMarginY)),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                            vertical: kMarginY,
                          ),
                          child: Text('Combien de plaquettes ?'),
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(
                                vertical: kMarginY, horizontal: kMarginX),
                            height: getHeight(context) * .08,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border:
                                    Border.all(color: ColorsApp.grey, width: 1),
                                color: ColorsApp.grey),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                    child: Icon(Icons.remove),
                                    onTap: () {
                                      context.read<PharmacyBloc>().add(
                                          SetQuantiteMedicament(
                                              medicament: medicament,
                                              quantite: int.parse(
                                                              _quantite.text) -
                                                          1 >
                                                      0
                                                  ? int.parse(_quantite.text) -
                                                      1
                                                  : 1));

                                      _quantite.text =
                                          (int.parse(_quantite.text) - 1 > 0
                                                  ? int.parse(_quantite.text) -
                                                      1
                                                  : 1)
                                              .toString();
                                    }),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: ColorsApp.grey),
                                  width: getWidth(context) / 5.5,
                                  // height: 35,
                                  // alignment: Alignment.center,
                                  margin: EdgeInsets.only(
                                    bottom: kMarginY,
                                  ),
                                  child: AppInputNew(
                                    controller: _quantite,
                                    label: '',
                                    // border: true,
                                    alignStart: false,
                                    textInputType: TextInputType.number,
                                    validator: (value) {
                                      return null;

                                      // return Validators.usNumeriqValid(value!);
                                    },
                                  ),
                                ),
                                InkWell(
                                    child: Icon(Icons.add),
                                    onTap: () {
                                      context.read<PharmacyBloc>().add(
                                          SetQuantiteMedicament(
                                              medicament: medicament,
                                              quantite:
                                                  int.parse(_quantite.text) +
                                                      1));
                                      _quantite.text =
                                          (int.parse(_quantite.text) + 1)
                                              .toString();
                                    })
                              ],
                            )),
                      ],
                    )));
          });
}
