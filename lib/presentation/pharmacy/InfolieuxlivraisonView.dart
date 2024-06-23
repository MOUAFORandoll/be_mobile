import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:BabanaExpress/application/model/exportmodel.dart';
import 'package:BabanaExpress/presentation/components/Widget/app_dropdown.dart';
import 'package:BabanaExpress/presentation/components/Widget/app_input_contact.dart';
import 'package:BabanaExpress/utils/Services/ContactService.dart';
import 'package:BabanaExpress/utils/Services/validators.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:contacts_service/contacts_service.dart';

import 'MapPagePointLivraisonMedoc.dart';

// ignore: must_be_immutable
class InfoLieuxLIvraisonView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PharmacyBloc, PharmacyState>(
        builder: (context, state) => BlocBuilder<LivraisonBloc, LivraisonState>(
            builder: (context, state_livraison) => Form(
                key: state_livraison.formKeyLivraison,
                child: Container(
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
                        child: Column(children: [
                      Column(children: [
                        // Container(
                        //     padding: EdgeInsets.only(
                        //       top: kMarginY,
                        //     ),
                        //     alignment: Alignment.centerLeft,
                        //     child: Text('yVille'.tr())),
                        state_livraison.isLoadedVille == 0
                            ? CircularProgressIndicator(color: ColorsApp.second)
                            : state_livraison.isLoadedVille == 2
                                ? Text('Error')
                                : Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      border: Border.all(
                                          color: (state_livraison.errorVille!)
                                              ? ColorsApp.red
                                              : Colors.grey.shade200,
                                          width: 1),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    height: getHeight(context) * .06,
                                    width: getWidth(context),
                                    alignment: Alignment.center,
                                    child: state_livraison.villeList!.isEmpty
                                        ? Container()
                                        : AppDropdown<VilleModel>(
                                            value: state.selectedVIlle,
                                            hint: 'yselectville'.tr(),
                                            items: state_livraison.villeList!,
                                            onChanged: (newValue) {
                                              context.read<PharmacyBloc>().add(
                                                  SelectedVilleP(
                                                      ville: newValue
                                                          as VilleModel));
                                              context.read<LivraisonBloc>().add(
                                                  GetRecupPointEvent(
                                                      ville: newValue.id));
                                              context.read<PharmacyBloc>().add(
                                                  SelectPointLivraisonP(
                                                      point_livraison: null));
                                            },
                                            itemLabelBuilder:
                                                (VilleModel value) =>
                                                    value.libelle,
                                          )),
                        if (state_livraison.errorVille!)
                          Container(
                              padding: EdgeInsets.only(
                                top: kMarginY,
                              ),
                              margin: EdgeInsets.only(
                                left: 10,
                              ),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'eselectville'.tr(),
                                style: TextStyle(
                                    fontSize: 8,
                                    fontFamily: 'Lato',
                                    color: ColorsApp.red),
                              )),
                        state_livraison.isLoadedPLivraison == 0
                            ? Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: kMarginY * 1.2,
                                ),
                                alignment: Alignment.center,
                                child: CircularProgressIndicator(
                                    color: ColorsApp.primary))
                            : state_livraison.isLoadedPLivraison == 2
                                ? Text('Error')
                                : state_livraison.isLoadedPLivraison == null
                                    ? Container()
                                    : Column(
                                        children: [
                                          // Container(
                                          //     padding: EdgeInsets.only(
                                          //       top: kMarginY,
                                          //     ),
                                          //     alignment: Alignment.centerLeft,
                                          //     child:
                                          //         Text('yselectpointliv'.tr())),
                                          Container(
                                              margin: EdgeInsets.only(
                                                  top: kMarginY * 1.5),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  (!state
                                                          .isMapSelectedPointLivraison)
                                                      ? AppDropdown<
                                                          PointLivraisonModel>(
                                                          maxWidth: getWidth(
                                                                  context) *
                                                              .65,
                                                          value: state
                                                              .selected_livraison_point,
                                                          hint:
                                                              'yselectpointliv'
                                                                  .tr(),
                                                          onChanged:
                                                              (PointLivraisonModel?
                                                                  newValue) {
                                                            context
                                                                .read<
                                                                    PharmacyBloc>()
                                                                .add(SelectPointLivraisonP(
                                                                    point_livraison:
                                                                        newValue!));
                                                          },
                                                          items: state_livraison
                                                              .list_localisation_point!,
                                                          itemLabelBuilder:
                                                              (PointLivraisonModel
                                                                      value) =>
                                                                  value.libelle,
                                                          hasError: state
                                                              .errorPointLivraison!,
                                                        )
                                                      : Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      kMarginY,
                                                                  horizontal:
                                                                      kMarginX),
                                                          height:
                                                              getHeight(
                                                                      context) *
                                                                  .06,
                                                          alignment: Alignment
                                                              .center,
                                                          width: getWidth(
                                                                  context) *
                                                              .65,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              color: ColorsApp
                                                                  .greyNew),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              InkWell(
                                                                onTap: () => context
                                                                    .read<
                                                                        PharmacyBloc>()
                                                                    .add(
                                                                        ClearPointLivraisonMedoc()),
                                                                child:
                                                                    Container(
                                                                  child: Icon(
                                                                    Icons
                                                                        .keyboard_arrow_down_outlined,
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            kMarginX),
                                                                child: Text(state
                                                                    .selected_livraison_point!
                                                                    .libelle),
                                                              ),
                                                              Container()
                                                            ],
                                                          )),
                                                  InkWell(
                                                      child: Container(
                                                          height: getHeight(
                                                                  context) *
                                                              .06,
                                                          width:
                                                              getHeight(
                                                                      context) *
                                                                  .06,

                                                          // padding: EdgeInsets.all(20),
                                                          alignment: Alignment
                                                              .center,
                                                          decoration: BoxDecoration(
                                                              color: ColorsApp
                                                                  .primary,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8)),
                                                          child: Icon(
                                                            Icons.location_on,
                                                            color:
                                                                ColorsApp.white,
                                                          )),
                                                      onTap: () {
                                                        AutoRouter.of(context)
                                                            .pushNamed(
                                                                MapPagePointLivraisonMedocs
                                                                    .routeName);
                                                      }),
                                                ],
                                              )),
                                        ],
                                      ),
                        if (state_livraison.errorPointLivraison!)
                          Container(
                              padding: EdgeInsets.only(
                                top: kMarginY,
                              ),
                              margin: EdgeInsets.only(
                                left: 10,
                              ),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'eselectrecup'.tr(),
                                style: TextStyle(
                                    fontSize: 8,
                                    fontFamily: 'Lato',
                                    color: ColorsApp.red),
                              )),
                        Container(
                          margin: EdgeInsets.only(
                            top: kMarginY * 1.5,
                          ),
                          child: AppInputContact(
                            controller: state_livraison.contactRecepteur!,
                            icon: Icon(Icons.phone),
                            textInputType: TextInputType.number,
                            // maxLength:13,
                            label: 'yycontact'.tr(),
                            onTap: () {
                              ContactService().openContactSelectionModal(
                                  context: context,
                                  onTap: (Contact contact) {
                                    state_livraison.contactRecepteur!.text =
                                        contact.phones!.first.value.toString();
                                    AutoRouter.of(context).pop();

                                    showSuccessGetContact(
                                      'Vous avez choisi ${contact.displayName}',
                                      context,
                                    );
                                  });
                            },
                            onChanged: (value) {},
                            validator: (value) {
                              return Validators.usPhoneValid(value!);
                            },
                          ),
                        ),
                      ]),
                    ]))))));
  }
}
