import 'package:BananaExpress/presentation/components/exportcomponent.dart';

// ignore: must_be_immutable
class SearchInput extends StatelessWidget {
  SearchInput(
      {required this.controller,
      required this.label,
      required this.data,
      this.onTap,
      this.close,
      this.onChanged});

  final onTap;
  final close;
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
            width: getWith(context) * .9,
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
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                      fontSize: 12),
                  counterText: '',
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(
                        color: Colors.blue,
                      )),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  contentPadding: EdgeInsets.only(
                    left: 15,
                    right: 15,
                  ),
                  suffixIcon: InkWell(
                    child: Icon(Icons.close),
                    onTap: close,
                  )),
            ),
          ),
          controller.text.isEmpty
              ? Container()
              : data.length == 0
                  ? Text('yemptyrecupliv'.tr())
                  : Container(
                      width: getWith(context),
                      margin: EdgeInsets.symmetric(vertical: kMarginY),
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
                                      margin: EdgeInsets.symmetric(
                                          horizontal: kMarginX,
                                          vertical: kMarginY / 2.5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Text(data[index].libelle),
                                          ),
                                          Container(
                                              child:
                                                  Icon(Icons.medical_services)),
                                        ],
                                      ),
                                    ),
                                  ))))
        ],
      ),
    );
  }
}
