import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/utils/constants/assets.dart';
import 'package:cached_network_image/cached_network_image.dart';

// ignore: must_be_immutable
class SearchInputMedicamentComponent extends StatelessWidget {
  SearchInputMedicamentComponent(
      {required this.controller,
      required this.label,
      required this.data,
      required this.loading,
      this.onTap,
      this.verifyContains,
      this.close,
      this.onChanged});

  final onTap;
  final verifyContains;
  final close;
  final loading;
  final ValueChanged<String>? onChanged;
  final TextEditingController controller;
  final String label;
  final List<dynamic> data;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: getWidth(context) * .9,
            height: 40,
            margin: EdgeInsets.symmetric(horizontal: 4, vertical: kMarginY
                // top: 2,
                ),
            // decoration: BoxDecoration(boxShadow: [
            // BoxShadow(
            // color: ColorsApp.grey, spreadRadius: 1, blurRadius: 5)
            // ], color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              decoration: new InputDecoration(
                  // hintText: hint,
                  hintStyle: TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                      fontSize: 12),
                  labelText: label,
                  labelStyle: TextStyle(
                      color: ColorsApp.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: 12),
                  counterText: '',
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: ColorsApp.primary,
                      )),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: EdgeInsets.only(
                    left: 15,
                    right: 15,
                  ),
                  suffixIcon: InkWell(
                    child: Icon(
                        controller.text.isEmpty ? Icons.search : Icons.close),
                    onTap: close,
                  )),
            ),
          ),
          controller.text.isEmpty
              ? Container()
              : loading == 0
                  ? Container(
                      height: getHeight(context) * .15,
                      width: getWidth(context) * .88,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Color.fromARGB(255, 231, 229, 229),
                        ),
                        color: ColorsApp.white,
                      ),
                      child: Center(
                          child: CircularProgressIndicator(
                        color: ColorsApp.primary,
                      )))
                  : loading == 2
                      ? Container(
                          height: getHeight(context) * .15,
                          width: getWidth(context) * .88,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Color.fromARGB(255, 231, 229, 229),
                            ),
                            color: ColorsApp.white,
                          ),
                          child: Text('Error'.tr(),
                              style: TextStyle(color: ColorsApp.red)))
                      : data.length == 0
                          ? Container(
                              height: getHeight(context) * .15,
                              width: getWidth(context) * .88,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Color.fromARGB(255, 231, 229, 229),
                                ),
                                color: ColorsApp.white,
                              ),
                              alignment: Alignment.center,
                              child: Text('Aucun element trouve'.tr()))
                          : Container(
                              margin: EdgeInsets.symmetric(vertical: kMarginY),
                              width: getWidth(context) * .88,
                              height: data.length > 6
                                  ? getHeight(context) * .3
                                  : data.length > 3
                                      ? getHeight(context) * .2
                                      : getHeight(context) * .15,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Color.fromARGB(255, 231, 229, 229),
                                ),
                                color: ColorsApp.white,
                              ),
                              child: SingleChildScrollView(
                                  child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: data.length,
                                      itemBuilder: (_, index) => InkWell(
                                            onTap: () => onTap(data[index]),
                                            child: Container(
                                              decoration: verifyContains(
                                                      data[index])
                                                  ? BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      border: Border.all(
                                                        color: Color.fromARGB(
                                                            255, 231, 229, 229),
                                                      ),
                                                      color: ColorsApp.primary,
                                                    )
                                                  : BoxDecoration(
                                                      border: Border(
                                                        bottom: BorderSide(
                                                          color: Color.fromARGB(
                                                              255,
                                                              231,
                                                              229,
                                                              229),
                                                        ),
                                                      ),
                                                    ),
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: kMarginX / 2,
                                                  vertical: kMarginY / 2.5),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: kMarginX,
                                                  vertical: kMarginY),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        border: Border.all(
                                                          color: Color.fromARGB(
                                                              255,
                                                              231,
                                                              229,
                                                              229),
                                                        ),
                                                      ),
                                                      child: CachedNetworkImage(
                                                        height:
                                                            getHeight(context) *
                                                                .07,
                                                        width:
                                                            getHeight(context) *
                                                                .07,
                                                        fit: BoxFit.cover,
                                                        imageUrl:
                                                            'medicament.images[0].src',
                                                        imageBuilder: (context,
                                                            imageProvider) {
                                                          return Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius: BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          10),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          10)),
                                                              image: DecorationImage(
                                                                  image:
                                                                      imageProvider,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  colorFilter: ColorFilter.mode(
                                                                      Colors
                                                                          .transparent,
                                                                      BlendMode
                                                                          .colorBurn)),
                                                            ),
                                                          );
                                                        },
                                                        placeholder:
                                                            (context, url) {
                                                          return Container(
                                                            child: Shimmer
                                                                .fromColors(
                                                                    baseColor:
                                                                        ColorsApp
                                                                            .greyNew,
                                                                    highlightColor: ColorsApp
                                                                        .primary
                                                                        .withOpacity(
                                                                            .1),
                                                                    child:
                                                                        Container(
                                                                      // height: getHeight(context) / 10,
                                                                      // width: getHeight(context) / 10,
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: ColorsApp
                                                                            .greyNew,
                                                                      ),
                                                                    )),
                                                          );
                                                        },
                                                        errorWidget: (context,
                                                            url, error) {
                                                          return Container(
                                                              decoration: BoxDecoration(
                                                                  image: DecorationImage(
                                                                      fit: BoxFit
                                                                          .contain,
                                                                      image: AssetImage(
                                                                          Assets
                                                                              .medicament))));
                                                        },
                                                      )),
                                                  Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                kMarginX),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Container(
                                                              child: Text(
                                                                data[index]
                                                                    .libelle,
                                                                style: TextStyle(
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color: verifyContains(data[
                                                                            index])
                                                                        ? ColorsApp
                                                                            .white
                                                                        : null),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ))))
        ],
      ),
    );
  }
}
