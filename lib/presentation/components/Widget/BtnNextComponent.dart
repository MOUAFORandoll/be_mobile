import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

class BtnNextComponent extends StatelessWidget {
  final onTap;
  BtnNextComponent({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
          // decoration: BoxDecoration(
          //     color: ColorsApp.primary,
          //     borderRadius: BorderRadius.circular(50)),
          margin: EdgeInsets.only(
            top: kMarginY,
          ),
          padding: EdgeInsets.all(6).add(EdgeInsets.symmetric(horizontal: 5)),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(
                  bottom: kMarginY / 2,
                ),
                child: Text(
                  'Voir plus',
                  style: TextStyle(
                      color: ColorsApp.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: kTitle),
                ),
              ),
              Container(
                child: Icon(
                  Icons.keyboard_arrow_right,
                  color: ColorsApp.primary,
                  size: 25,
                ),
              ),
            ],
          ),
        ),
        onTap: onTap);
  }
}
