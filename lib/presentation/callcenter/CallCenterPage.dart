import 'package:BabanaExpress/application/callcenter/callcenter_bloc.dart';
import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:BabanaExpress/presentation/components/Widget/BoxInputMessaage.dart';
import 'package:BabanaExpress/presentation/components/Widget/EmptyLivraisonsComponent.dart';
import 'package:BabanaExpress/presentation/components/Widget/MessageComponent.dart';
import 'package:BabanaExpress/presentation/components/Widget/OwnMessgaeCrad.dart';
import 'package:BabanaExpress/presentation/components/Widget/ReplyCard.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/utils/constants/assets.dart';

import '../components/Widget/ShimmerLivraison.dart';

@RoutePage()
class CallCenterPage extends StatefulWidget {
  static const routeName = '/callcenter';

  @override
  State<CallCenterPage> createState() => _CallCenterPageState();
}

class _CallCenterPageState extends State<CallCenterPage> {
  ScrollController staterollController = new ScrollController();

  @override
  void initState() {
    context.read<CallCenterBloc>().add(GetMessage());
    // scrollToBottom();
    super.initState();
  }

  void scrollToBottom() {
    final position = staterollController.position.maxScrollExtent;
    staterollController.animateTo(
      position,
      duration: Duration(seconds: 1),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        builder: (contextH, stateH) =>
            BlocBuilder<CallCenterBloc, CallCenterState>(
                builder: (context, state) {
              return Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    leading: AppBackButton(),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage(Assets.logo)),
                        Text('Call Center'.tr()),
                      ],
                    ),
                    centerTitle: true,
                    actions: [
                      Container(
                        margin: EdgeInsets.only(right: kMarginX * 2),
                        child: InkWell(
                          child: Icon(Icons.refresh),
                          onTap: () =>
                              context.read<CallCenterBloc>().add(GetMessage()),
                        ),
                      )
                    ],
                  ),
                  body: Column(
                    children: [
                      Expanded(
                        child: Container(
                            margin: EdgeInsets.only(top: kMarginY * 2).add(
                                EdgeInsets.symmetric(horizontal: kMarginX * 2)),
                            child: state.isLoadMessageCallCenter == 0
                                ? ShimmerLivraison()
                                : SingleChildScrollView(
                                    controller: state.callcenterSrollController,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: state.messages!.length + 1,
                                      itemBuilder: (context, index) {
                                        if (index == state.messages!.length) {
                                          return Container(
                                            height: 20,
                                          );
                                        }

                                        return MessageComponent(
                                            message: state.messages![index]);
                                      },
                                    ),
                                  )),
                      ),
                      Container(
                        // height: 170,
                        // margin: EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(color: ColorsApp.white),
                        child: BoxInputMessaage(
                          controller: state.messageText,
                          sending: state.isLoadSend == 0,
                          onTap: () =>
                              context.read<CallCenterBloc>().add(NewMessage()),
                        ),
                      ),
                    ],
                  ));
            }));
  }
}
