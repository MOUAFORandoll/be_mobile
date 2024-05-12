import 'package:BabanaExpress/application/callcenter/callcenter_bloc.dart';
import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:BabanaExpress/presentation/components/Widget/BoxInputMessaage.dart';
import 'package:BabanaExpress/presentation/components/Widget/MessageComponent.dart';
import 'package:BabanaExpress/presentation/components/Widget/OwnMessgaeCrad.dart';
import 'package:BabanaExpress/presentation/components/Widget/ReplyCard.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

@RoutePage()
class CallCenterPage extends StatefulWidget {
  static const routeName = '/callcenter';

  @override
  State<CallCenterPage> createState() => _CallCenterPageState();
}

class _CallCenterPageState extends State<CallCenterPage> {
  ScrollController staterollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        builder: (contextH, stateH) =>
            BlocBuilder<CallcenterBloc, CallcenterState>(
                builder: (context, state) {
              return Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    leading: AppBackButton(),
                    title: Text('Call Center'.tr()),
                    centerTitle: true,
                  ),
                  body: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: ListView.builder(
                            shrinkWrap: true,
                            // physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.messages!.length + 1,
                            itemBuilder: (context, index) {
                              if (index == state.messages!.length) {
                                return Container(
                                  height: 70,
                                );
                              }

                              return MessageComponent(
                                  message: state.messages![index]);
                            },
                          ),
                        ),
                      ),
                      Container(
                        // height: 170,
                        // margin: EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(color: ColorsApp.white),
                        child: BoxInputMessaage(
                          controller: state.messageText,
                          sending: state.isLoadSend == 0,
                          onTap: () =>
                              context.read<CallcenterBloc>().add(NewMessage()),
                        ),
                      ),
                    ],
                  ));
            }));
  }
}
