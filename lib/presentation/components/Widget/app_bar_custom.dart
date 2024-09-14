import 'package:BabanaExpress/presentation/components/exportcomponent.dart'; // Make sure to import this if using AutoRouter

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final actions;
  final actionBack;
  AppBarCustom({Key? key, required this.title, this.actions, this.actionBack})
      : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ThemeApp.second,
      elevation: 0,
      leading: InkWell(
        onTap:
            actionBack != null ? actionBack : () => AutoRouter.of(context).pop()
        /*  () {
          return actionBack;
          if (actionBack != null) {
            print('--------${actionBack}');
            () => actionBack;
          } else {
            AutoRouter.of(context).pop();
          }
        } */
        ,
        child: Container(
          alignment: Alignment.centerRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.arrow_back_ios_new,
                  color: ColorsApp.white, size: kSmIcon * .7),
              Text('Back', style: Theme.of(context).appBarTheme.titleTextStyle),
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
