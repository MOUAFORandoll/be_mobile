import '../exportcomponent.dart';

// ignore: must_be_immutable
class BoxInputMessaage extends StatelessWidget {
  BoxInputMessaage(
      {this.isUpdate,
      this.controller,
      this.focusNode,
      this.hint,
      this.sending = false,
      this.onTap,
      this.onTapFile});
  var onTap, focusNode, isUpdate, inconSize, sending, onTapFile;

  final controller;
  String? hint = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: onTapFile,
            child: isUpdate
                ? Container(
                    // padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      // color: ColorsApp.primary,
                    ),
                    child: Icon(Icons.close, color: ColorsApp.red, size: 35.0),
                  )
                : Container(
                    // padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      // color: ColorsApp.primary,
                    ),
                    child: Icon(Icons.attach_file,
                        color: ColorsApp.primary, size: 35.0),
                  ),
          ),
          Expanded(
            // flex: 10,
            child: Container(
              constraints: BoxConstraints(
                  maxHeight: getHeight(context) / 5, minHeight: 15),
              margin: EdgeInsets.symmetric(horizontal: 4),
              child: TextField(
                focusNode: focusNode,
                controller: controller,
                maxLines: null,
                onChanged: (val) {},
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: EdgeInsets.all(10),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsApp.white, width: .4),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsApp.red, width: 1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorsApp.grey,
                      width: .5,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  errorStyle: TextStyle(
                    color: ColorsApp.red,
                  ),
                ),
              ),
            ),
          ),
          !sending
              ? InkWell(
                  onTap: onTap,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorsApp.primary,
                    ),
                    child: Container(
                        width: 22,
                        height: 22,
                        child:
                            Icon(Icons.send, color: Colors.white, size: 22.0)),
                  ),
                )
              : Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: ColorsApp.primary,
                  ),
                  child: Container(
                    width: 22,
                    height: 22,
                    child: CircularProgressIndicator(
                      color: ColorsApp.white,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
