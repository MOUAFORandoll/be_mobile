import 'dart:developer';

import 'package:BabanaExpress/application/callcenter/callcenter_bloc.dart';
import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:BabanaExpress/presentation/components/Widget/BoxInputMessaage.dart';
import 'package:BabanaExpress/presentation/components/Widget/EmptyLivraisonsComponent.dart';
import 'package:BabanaExpress/presentation/components/Widget/MessageComponent.dart';
import 'package:BabanaExpress/presentation/components/Widget/OwnMessgaeCrad.dart';
import 'package:BabanaExpress/presentation/components/Widget/ReplyCard.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/utils/constants/assets.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../components/Widget/ShimmerLivraison.dart';

@RoutePage()
class CallCenterPage extends StatefulWidget {
  static const routeName = '/callcenter';

  @override
  State<CallCenterPage> createState() => _CallCenterPageState();
}

class _CallCenterPageState extends State<CallCenterPage> {
  ScrollController stateScrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<CallCenterBloc>().add(GetMessage());
  }

  void scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (stateScrollController.hasClients) {
        final position = stateScrollController.position.maxScrollExtent;
        stateScrollController.animateTo(
          position,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        builder: (contextH, stateH) =>
            BlocConsumer<CallCenterBloc, CallCenterState>(
                listener: (context, state) {
              if (state.isLoadMessageCallCenter != null &&
                  state.isLoadMessageCallCenter != 0) {
                scrollToBottom();
              }
            }, builder: (context, state) {
              return state.isLoadMessageCallCenter == 0
                  ? Scaffold(
                      appBar: AppBar(
                        backgroundColor: Color(0xE9E9E9),
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
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                    radius: 20,
                                    backgroundImage: AssetImage(Assets.logo)),
                                BlocBuilder<HomeBloc, HomeState>(
                                  builder: (context, state) => Container(
                                    margin: EdgeInsets.only(left: kMarginX / 2),
                                    child: CircleAvatar(
                                      radius: 20,
                                      child: CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        imageUrl: state.user!.profile,
                                        imageBuilder: (context, imageProvider) {
                                          return Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          );
                                        },
                                        placeholder: (context, url) {
                                          return Container(
                                            child: Center(
                                                child:
                                                    CircularProgressIndicator(
                                              color: ColorsApp.primary,
                                            )),
                                          );
                                        },
                                        errorWidget: (context, url, error) {
                                          return CircleAvatar(
                                              backgroundColor:
                                                  ColorsApp.primary,
                                              radius: 20,
                                              backgroundImage:
                                                  AssetImage(Assets.babana));
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text('Call Center'.tr()),
                          ],
                        ),
                        centerTitle: true,
                        actions: [
                          Container(
                            margin: EdgeInsets.only(right: kMarginX * 2),
                            child: InkWell(
                              child: Icon(Icons.refresh),
                              onTap: () => context
                                  .read<CallCenterBloc>()
                                  .add(GetMessage()),
                            ),
                          )
                        ],
                      ),
                      body: Container(
                          margin: EdgeInsets.only(top: kMarginY).add(
                              EdgeInsets.symmetric(horizontal: kMarginX * 2)),
                          child: ShimmerLivraison()))
                  : Scaffold(
                      appBar: AppBar(
                        backgroundColor: Color(0xE9E9E9),
                        elevation: 0,
                        leading: AppBackButton(),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                    radius: 20,
                                    backgroundImage: AssetImage(Assets.logo)),
                                BlocBuilder<HomeBloc, HomeState>(
                                  builder: (context, state) => Container(
                                    margin: EdgeInsets.only(left: kMarginX / 2),
                                    child: CircleAvatar(
                                      radius: 20,
                                      child: CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        imageUrl: state.user!.profile,
                                        imageBuilder: (context, imageProvider) {
                                          return Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          );
                                        },
                                        placeholder: (context, url) {
                                          return Container(
                                            child: Center(
                                                child:
                                                    CircularProgressIndicator(
                                              color: ColorsApp.primary,
                                            )),
                                          );
                                        },
                                        errorWidget: (context, url, error) {
                                          return CircleAvatar(
                                              backgroundColor:
                                                  ColorsApp.primary,
                                              radius: 20,
                                              backgroundImage:
                                                  AssetImage(Assets.babana));
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text('Call Center'.tr()),
                          ],
                        ),
                        centerTitle: true,
                        actions: [
                          Container(
                            margin: EdgeInsets.only(right: kMarginX * 2),
                            child: InkWell(
                              child: Icon(Icons.refresh),
                              onTap: () => context
                                  .read<CallCenterBloc>()
                                  .add(GetMessage()),
                            ),
                          )
                        ],
                      ),
                      body: ListView.builder(
                        controller: stateScrollController,
                        shrinkWrap: true,
                        itemCount: state.messages!.length + 1,
                        itemBuilder: (context, index) {
                          if (index == state.messages!.length) {
                            return Container(
                              height: 100,
                            );
                          }

                          return MessageComponent(
                              message: state.messages![index]);
                        },
                      ),
                      bottomSheet: Container(
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
                    );
            }));
  }
}
