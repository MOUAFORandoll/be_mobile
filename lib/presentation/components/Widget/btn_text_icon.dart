import 'package:BabanaExpress/presentation/components/exportcomponent.dart'; 

// ignore: must_be_immutable
class BtnTextIcon extends StatelessWidget {
  String title;
  IconData icon;
  var onTap;
  BtnTextIcon({required this.title, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
            color: ColorsApp.black, borderRadius: BorderRadius.circular(50)),
        padding: EdgeInsets.all(6).add(EdgeInsets.symmetric(horizontal: 5)),
        child: Row(
          children: [
            Icon(icon, color: ColorsApp.white),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 3),
              child: Text(
                title,
                style: TextStyle(color: ColorsApp.white),
              ),
            ),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
