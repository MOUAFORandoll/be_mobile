import '../../presentation/components/exportcomponent.dart';
import 'package:BananaExpress/application/export_bloc.dart';

@RoutePage()
class PharmacyPage extends StatefulWidget {
  static const String routeName = '/pharmacypage';

  @override
  _PharmacyPageState createState() => _PharmacyPageState();
}

class _PharmacyPageState extends State<PharmacyPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PharmacyBloc, PharmacyState>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
            appBar: AppBar(
              title: Text('Pharmacy'),
              centerTitle: true,
            ),
            body: Text('')));
  }
}
