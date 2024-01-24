import 'package:BananaExpress/application/export_bloc.dart';
import 'package:BananaExpress/components/Widget/app_input_new.dart';
import 'package:BananaExpress/styles/colorApp.dart';
import 'package:BananaExpress/styles/textStyle.dart';
import 'package:BananaExpress/utils/Services/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:BananaExpress/old/Views/Livraison/MapPagePointRecuperation.dart';

import '../../../old/model/data/VilleModel.dart';

class InfoLIvraison extends StatefulWidget {
  InfoLIvraison({Key? key}) : super(key: key);

  @override
  State<InfoLIvraison> createState() => _InfoLIvraisonState();
}

class _InfoLIvraisonState extends State<InfoLIvraison> {
  final formKeyLivraison = new GlobalKey<FormState>();
  TextEditingController phone = TextEditingController();
  TextEditingController libelle = TextEditingController();
  TextEditingController libelleLocalisation = TextEditingController();
  TextEditingController contactEmetteur = TextEditingController();

  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LivraisonBloc, LivraisonState>(
        builder: (context, state) {
      return Form(
          key: formKeyLivraison,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: kMarginX),
            child: SingleChildScrollView(
              child: Column(children: [
                Container(
                  margin: EdgeInsets.only(
                    top: kMarginY * 1.5,
                  ),
                  child: AppInputNew(
                    controller: libelle,
                    icon: Icon(Icons.label),
                    label: 'Libelle'.tr(),
                    onChanged: (value) {
                      // verifyForm();
                    },
                    validator: (value) {
                      return Validators.isValidUsername(value!);
                    },
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(
                      top: kMarginY,
                    ),
                    alignment: Alignment.centerLeft,
                    child: Text('Ville')),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: (!state.isVille)
                            ? ColorsApp.second
                            : ColorsApp.grey,
                        width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: kHeight * .08,
                  width: kWidth,
                  margin: EdgeInsets.only(
                    top: kMarginY * 1.5,
                  ),
                  alignment: Alignment.center,
                  child: DropdownButton(
                    value: state.selectedVIlle,
                    icon: Container(
                      // padding: EdgeInsets.only(top: 4),
                      child: Icon(
                        Icons.keyboard_arrow_down_outlined,
                      ),
                    ),
                    iconSize: 25,
                    underline: SizedBox(),
                    style: TextStyle(color: ColorsApp.primary, fontSize: 12),
                    onChanged: (VilleModel? newValue) {
                      context
                          .read<LivraisonBloc>()
                          .add(SelectedVille(ville: newValue));
                      context
                          .read<LivraisonBloc>()
                          .add(GetRecupPointEvent(ville: newValue!.id));
                    },
                    items: state.villeList!.map((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Center(
                          child: Text(
                            value.libelle,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                if (!state.isVille)
                  Container(
                      padding: EdgeInsets.only(
                        top: kMarginY,
                      ),
                      margin: EdgeInsets.only(
                        left: 10,
                      ),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Veuillez selectionner une ville',
                        style: TextStyle(
                            fontSize: 8,
                            fontFamily: 'Lato',
                            color: ColorsApp.second),
                      )),
                Container(
                    padding: EdgeInsets.only(
                      top: kMarginY,
                    ),
                    alignment: Alignment.centerLeft,
                    child: Text('Point de recuperation')),
                Container(
                    margin: EdgeInsets.only(
                      top: kMarginY,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        (state.longitudeRecuperation == 0.0 &&
                                state.latitudeRecuperation == 0.0)
                            ? Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: (!state.isPointRecuperation)
                                          ? ColorsApp.second
                                          : ColorsApp.grey,
                                      width: 1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                height: kHeight * .08,
                                width: kWidth * .65,
                                margin: EdgeInsets.only(
                                  top: kMarginY * 1.5,
                                ),
                                alignment: Alignment.center,
                                child: DropdownButton(
                                  value: state.selected_recuperation_point,
                                  hint: Container(
                                    width: kWidth * .65,
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Selectionner un point de recuperation',
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  ),
                                  icon: Container(
                                    // padding: EdgeInsets.only(top: 4),
                                    child: Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                    ),
                                  ),
                                  iconSize: 25,
                                  underline: SizedBox(),
                                  style: TextStyle(
                                      color: ColorsApp.primary, fontSize: 12),
                                  onChanged: (newValue) {
                                    context.read<LivraisonBloc>().add(
                                        SelectedPointLocalisation(
                                            point_recup: newValue));
                                  },
                                  items: state.list_recuperation_point!
                                      .map((value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Center(
                                        child: Text(
                                          value.libelle,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              )
                            : Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: kMarginY, horizontal: kMarginX),
                                height: kHeight * .06,
                                alignment: Alignment.center,
                                width: kWidth * .65,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: ColorsApp.grey),
                                child: Text(libelleLocalisation.text.isEmpty
                                    ? 'Selectionner'
                                    : libelleLocalisation.text)),
                        InkWell(
                            child: Container(
                                padding: EdgeInsets.all(10),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(90),
                                    color: ColorsApp.grey),
                                child: Icon(Icons.location_on)),
                            onTap: () {
                              // Get.to(MapPagePointRecuperation());
                            }),
                      ],
                    )),
                if (!state.isPointRecuperation)
                  Container(
                      padding: EdgeInsets.only(
                        top: kMarginY,
                      ),
                      margin: EdgeInsets.only(
                        left: 10,
                      ),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Veuillez selectionner un point de recuperation',
                        style: TextStyle(
                            fontSize: 8,
                            fontFamily: 'Lato',
                            color: ColorsApp.second),
                      )),
                Container(
                  margin: EdgeInsets.only(
                    top: kMarginY * 1.5,
                  ),
                  child: AppInputNew(
                    controller: contactEmetteur,
                    icon: Icon(Icons.phone),
                    label: 'Contact de l\'expediteur'.tr(),
                    onChanged: (value) {},
                    validator: (value) {
                      return Validators.usPhoneValid(value!);
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: kMarginY * 1.5,
                  ),
                  child: TextFormField(
                    controller: description,
                    onChanged: (value) {},
                    validator: (value) {
                      return Validators.isValidUsername(value!);
                    },
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      fontFamily: 'Lato',
                    ),
                    maxLines: 10,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorsApp.tird, width: 2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorsApp.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      errorStyle: TextStyle(
                        fontSize: 8,
                        fontFamily: 'Lato',
                      ),
                      labelStyle: TextStyle(
                        color: ColorsApp.primary,
                        fontFamily: 'Lato',
                        // fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                      labelText: 'Une description de votre position'.tr(),
                      fillColor: ColorsApp.tird,
                      counter: Offstage(),
                      // hintText: 'lbdescprod'.tr(),
                      alignLabelWithHint: true,
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ));
    });
  }
}
