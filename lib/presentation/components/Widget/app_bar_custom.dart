import 'package:BabanaExpress/presentation/components/exportcomponent.dart'; // Make sure to import this if using AutoRouter

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final actions;
  AppBarCustom({Key? key, required this.title, this.actions}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsApp.white,
      elevation: 0,
      leading: InkWell(
        onTap: () => AutoRouter.of(context).pop(),
        child: Container(
          alignment: Alignment.centerRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.arrow_back_ios_new,
                  color: ColorsApp.black, size: 20.0),
              Text(
                'Back',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ),
      title: Text(
        title,
      ),
      centerTitle: true,
      actions: actions,
    );
  }
}
