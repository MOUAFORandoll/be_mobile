import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

@RoutePage()
class MyTestPage extends StatefulWidget {
  const MyTestPage({
    Key? key,
  }) : super(key: key);
  static const routeName = '/';

  @override
  State<MyTestPage> createState() => _MyTestPageState();
}

//  var fn = new ViewFunctions();
//                 fn.loading(
//                     'Eiusmod ex quis deserunt ex eiusmod adipisicing duis fugiat excepteur non velit fugiat id id. ',
//                     '');
class _MyTestPageState extends State<MyTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('widget'),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {}, // _createOffer,
              child:
                  Container(height: 150, width: 250, child: const Text('Test')),
            ),
            // videoRenderers(),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: kMarginY * 2,
                  ),
                  child: AppButton(
                    // border: Border.all(color: ColorsApp.primary),
                    text: 'Telecharger facture',
                    onTap: () async {
                      // context.read<LivraisonBloc>().add(DownloadFacture());
                    },
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [],
                )
              ],
            ),
          ],
        ));
  }
}
