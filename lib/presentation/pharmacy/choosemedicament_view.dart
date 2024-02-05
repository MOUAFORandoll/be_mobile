import 'package:BananaExpress/presentation/components/Widget/searchInput.dart';

import '../../application/export_bloc.dart';
import '../components/exportcomponent.dart';

class ChooseMedicamentView extends StatefulWidget {
  @override
  ChooseMedicamentViewState createState() {
    return ChooseMedicamentViewState();
  }
}

class ChooseMedicamentViewState extends State<ChooseMedicamentView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PharmacyBloc, PharmacyState>(
        builder: (
      BuildContext context,
      state,
    ) =>
            SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    SearchInput(
                      controller: state.searchMedicamentController!,
                      label: 'Nom du medicament',
                      data: state.listMedicament!,
                      close: () => context
                          .read<PharmacyBloc>()
                          .add(CloseListMedicament()),
                      verifyContains: (value) =>
                          context.read<PharmacyBloc>().verifyContains(value),
                      onTap: (value) => context
                          .read<PharmacyBloc>()
                          .add(ChooseMedicament(medicament: value)),
                      onChanged: (value) => context
                          .read<PharmacyBloc>()
                          .add(FindMedicament(search: value)),
                    ),
                    Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(top: kMarginY) * 2,
                        padding: EdgeInsets.only(bottom: kMarginY),
                        child: Text(
                          'Medicament Selectionne',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 14),
                        )),
                    Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(top: kMarginY) * 2,
                        padding: EdgeInsets.only(bottom: kMarginY),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: ColorsApp.primary.withOpacity(.5)))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text('Nom'),
                            ),
                            Container(
                              child: Text('Quantite'),
                            ),
                            Container()
                          ],
                        )),
                    Container(
                        width: getWith(context),
                        margin: EdgeInsets.symmetric(vertical: kMarginY),
                        child: SingleChildScrollView(
                            child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: state.listMedicamentChoose!.length,
                                itemBuilder: (_, index) => InkWell(
                                      child: SelectedMedicament(
                                          onDelete: () => context
                                              .read<PharmacyBloc>()
                                              .add(DeleteMedicament(
                                                  medicament: state
                                                          .listMedicamentChoose![
                                                      index])),
                                          medicament: state
                                              .listMedicamentChoose![index]),
                                    ))))
                  ],
                ),
              ),
            ));
  }
}

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
        color: ColorsApp.primary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  width: getWith(context) * .3,
                  child: Text(
                    medicament.libelle!,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: ColorsApp.white,
                    ),
                  ),
                ),
                Container(
                  width: getWith(context) * .3,
                  child: Text(
                    '400 g',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: ColorsApp.white,
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
                      color: ColorsApp.second),
                  child: Text(
                    '${medicament.quantite}',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: ColorsApp.white,
                    ),
                  )),
              onTap: () => openModalAddColis(context, medicament)),
          InkWell(
              child: Container(
                  child: Icon(
                Icons.close,
                color: ColorsApp.white,
              )),
              onTap: (onDelete)),
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
                                  width: getWith(context) / 5.5,
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
