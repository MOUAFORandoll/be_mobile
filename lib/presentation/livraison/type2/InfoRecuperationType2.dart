import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:BabanaExpress/application/model/exportmodel.dart';
import 'package:BabanaExpress/presentation/components/Widget/app_dropdown.dart';
import 'package:BabanaExpress/utils/Services/validators.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

import '../MapPagePointRecuperation.dart';

@RoutePage()
class InfoRecuperationType2Page extends StatefulWidget {
  static const routeName = '/infolivraison/type2';
  InfoRecuperationType2Page({super.key});

  @override
  State<InfoRecuperationType2Page> createState() =>
      _InfoRecuperationType2PageState();
}

class _InfoRecuperationType2PageState extends State<InfoRecuperationType2Page> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LivraisonBloc, LivraisonState>(
        builder: (context, state) {
      return Form(
        key: state.formKeyLivraison,
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: kMarginY * 1.5,
                ),
                child: Text(
                  'Ou devons nous vous livrer ?',
                  style: TextStyle(
                      fontSize: kTitle,
                      fontFamily: 'Helvetica',
                      color: ColorsApp.black,
                      fontWeight: FontWeight.w600),
                ),
              ),
              state.isLoadVille == 0
                  ? CircularProgressIndicator(color: ColorsApp.primary)
                  : state.isLoadVille == 2
                      ? InkWell(
                          child: Text('Error'),
                          onTap: () => context
                              .read<LivraisonBloc>()
                              .add(GetVilleAndCategoryEvent()))
                      : Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            border: Border.all(
                                color: (state.errorVille!)
                                    ? ColorsApp.red
                                    : Colors.grey.shade200,
                                width: 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          height: getHeight(context) * .06,
                          width: getWidth(context),
                          alignment: Alignment.center,
                          child: state.villeList!.isEmpty
                              ? Container()
                              : AppDropdown<VilleModel>(
                                  value: state.selectedVIlle,
                                  hint: 'yselectville'.tr(),
                                  items: state.villeList!,
                                  onChanged: (newValue) {
                                    context.read<LivraisonBloc>().add(
                                        SelectedVille(
                                            ville: newValue as VilleModel));
                                    context.read<LivraisonBloc>().add(
                                        GetRecupPointEvent(ville: newValue.id));
                                  },
                                  itemLabelBuilder: (VilleModel value) =>
                                      value.libelle,
                                )),
              if (state.errorVille!)
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
                          fontFamily: 'Helvetica',
                          color: ColorsApp.red),
                    )),
              state.isLoadPLivraison == 0
                  ? Container(
                      padding: EdgeInsets.symmetric(
                        vertical: kMarginY * 1.2,
                      ),
                      alignment: Alignment.center,
                      child:
                          CircularProgressIndicator(color: ColorsApp.primary))
                  : state.isLoadPLivraison == 2
                      ? InkWell(
                          onTap: () => context
                              .read<LivraisonBloc>()
                              .add(GetVilleAndCategoryEvent()),
                          child: Text('Error'))
                      : state.isLoadPLivraison == null
                          ? Container()
                          : Column(
                              children: [
                                // Container(
                                //     padding: EdgeInsets.only(
                                //       top: kMarginY,
                                //     ),
                                //     alignment: Alignment.centerLeft,
                                //     child: Text('yrecup'.tr())),
                                Container(
                                    margin: EdgeInsets.only(
                                      top: kMarginY * 1.5,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        (!state.isMapSelectedPointRecuperation)
                                            ? AppDropdown<PointLivraisonModel>(
                                                maxWidth:
                                                    getWidth(context) * .65,
                                                value: state
                                                    .selected_livraison_point,
                                                hint: 'yselectpointliv'.tr(),
                                                items: state
                                                    .list_localisation_point!,
                                                onChanged: (PointLivraisonModel?
                                                    newValue) {
                                                  context.read<LivraisonBloc>().add(
                                                      SelectPointLivraisonColis(
                                                          point_livraison:
                                                              newValue!));
                                                },
                                                itemLabelBuilder:
                                                    (PointLivraisonModel
                                                            value) =>
                                                        value.libelle!,
                                                hasError: state
                                                    .errorPointRecuperation!)
                                            : Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: kMarginY,
                                                    horizontal: kMarginX),
                                                height:
                                                    getHeight(context) * .06,
                                                alignment: Alignment.center,
                                                width: getWidth(context) * .65,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: ColorsApp.greyNew),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    InkWell(
                                                      onTap: () => context
                                                          .read<LivraisonBloc>()
                                                          .add(
                                                              ClearPointRecuperation()),
                                                      child: Container(
                                                        child: Icon(
                                                          Icons
                                                              .keyboard_arrow_down_outlined,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              horizontal:
                                                                  kMarginX),
                                                      child: Text(state
                                                          .selected_recuperation_point!
                                                          .libelle!),
                                                    ),
                                                    Container()
                                                  ],
                                                )),
                                        InkWell(
                                            child: Container(
                                                height:
                                                    getHeight(context) * .06,
                                                width: getHeight(context) * .06,

                                                // padding: EdgeInsets.all(20),
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    color: ColorsApp.primary,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Icon(
                                                  Icons.location_on,
                                                  color: ColorsApp.white,
                                                )),
                                            onTap: () {
                                              AutoRouter.of(context).pushNamed(
                                                  MapPagePointRecuperation
                                                      .routeName);
                                            }),
                                      ],
                                    )),
                              ],
                            ),
              if (state.errorPointRecuperation!)
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
                          fontFamily: 'Helvetica',
                          color: ColorsApp.red),
                    )),
              Container(
                margin: EdgeInsets.only(
                  top: kMarginY * 1.5,
                ),
                child: AppInputNew(
                  controller: state.contactRecepteur!,
                  icon: Icon(Icons.phone),
                  textInputType: TextInputType.number,
                  // maxLength:13,
                  label: 'yycontact'.tr(),
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
                  controller: state.description,
                  onChanged: (value) {},
                  validator: (value) {
                    return Validators.isValidUsername(value!);
                  },
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    fontFamily: 'Helvetica',
                  ),
                  maxLines: 10,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ColorsApp.primary, width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorsApp.red, width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorsApp.grey, width: 1),
                      borderRadius: BorderRadius.circular(8),
                      // borderSide:
                      //     BorderSide(color: ColorsApp.tird, width: 1),
                    ),
                    errorStyle: TextStyle(
                      fontSize: 8,
                      fontFamily: 'Helvetica',
                    ),
                    labelStyle: TextStyle(
                      color: ColorsApp.grey,
                      fontFamily: 'Helvetica',
                      // fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                    labelText: 'ydescript'.tr(),
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
        ),
      );
    });
  }
}
