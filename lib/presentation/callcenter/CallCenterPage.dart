import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:BabanaExpress/presentation/components/Widget/BoxInputMessaage.dart';
import 'package:BabanaExpress/presentation/components/Widget/MessageComponent.dart';
import 'package:BabanaExpress/presentation/components/Widget/ShimmerMessage.dart';
import 'package:BabanaExpress/presentation/components/Widget/file_option.dart';
import 'package:BabanaExpress/presentation/components/Widget/global_bottom_sheet.dart';
import 'package:BabanaExpress/presentation/components/Widget/load_file_option.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/utils/constants/assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
 
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
              if (state.isToUpdate) {
                FocusScope.of(context).requestFocus(state.focusNode);
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
                          margin: EdgeInsets.only(top: kMarginY)
                              .add(EdgeInsets.symmetric(horizontal: kMarginX)),
                          child: ShimmerMessage()))
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
                        shrinkWrap: false,
                        physics: new ScrollPhysics(),
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
                        constraints: BoxConstraints(
                            maxHeight: getHeight(context) * .08 +
                                (state.message_target != null
                                    ? getHeight(context) * .04
                                    : 0) +
                                (state.filesMessage!.length != 0
                                    ? getHeight(context) * .08
                                    : 0)),
                        alignment: Alignment.bottomCenter,
                        decoration: BoxDecoration(
                            color: ColorsApp.grey.withOpacity(.3)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            if (state.filesMessage!.length != 0)
                              Container(
                                height: getHeight(context) * .07,
                                child: ListView.builder(
                                  controller: stateScrollController,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: state.filesMessage!.length,
                                  itemBuilder: (context, index) {
                                    return LoadFileWidget(
                                        onTap: () => context
                                            .read<CallCenterBloc>()
                                            .add(RemoveFilesMessage(
                                                file: state
                                                    .filesMessage![index])),
                                        file: state.filesMessage![index]);
                                  },
                                ),
                              ),
                            if (state.message_target != null)
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 8,
                                            decoration: BoxDecoration(
                                              color: ColorsApp.primary,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: kMarginX),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                    child: state.message_target!
                                                            .isCallCenter
                                                        ? Text('Call Center',
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Lato',
                                                                color: ColorsApp
                                                                    .tird,
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600))
                                                        : Text('Vous',
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Lato',
                                                                color: ColorsApp
                                                                    .second,
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600))),
                                                Container(
                                                    child: Text(state
                                                        .message_target!
                                                        .message)),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                        decoration: BoxDecoration(
                                          color: ColorsApp.grey,
                                          border: Border.all(),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        padding: EdgeInsets.all(2),
                                        margin: EdgeInsets.only(right: 10),
                                        child: InkWell(
                                            onTap: () => context
                                                .read<CallCenterBloc>()
                                                .add(TargetMessage(
                                                    message_target: null)),
                                            child: Icon(
                                              Icons.close,
                                              color: ColorsApp.red,
                                              weight: 30,
                                            ))),
                                  ],
                                ),
                              ),
                            BoxInputMessaage(
                              focusNode: state.focusNode,
                              controller: state.messageText,
                              sending: state.isLoadSend == 0,
                              isUpdate: state.isToUpdate,
                              onTapFile: () => state.isToUpdate
                                  ? context
                                      .read<CallCenterBloc>()
                                      .add(CancelSetMessageToUpdate())
                                  : onGetFile(context),
                              onTap: () => state.isToUpdate
                                  ? context
                                      .read<CallCenterBloc>()
                                      .add(UpdateMessage())
                                  : context
                                      .read<CallCenterBloc>()
                                      .add(NewMessage()),
                            ),
                          ],
                        ),
                      ),
                    );
            }));
  }
}

onGetFile(context) => GlobalBottomSheet.show(
      maxHeight: getHeight(context) * .3,
      context: context,
      title: 'Selectionner une Option'.tr(),
      widget: Container(
          margin: EdgeInsets.only(top: kMarginY),
          height: getHeight(context) * .2,
          child: GridView.count(
              crossAxisCount: 2, // Two items per row
              mainAxisSpacing: 28.0, // Spacing between rows
              crossAxisSpacing: 28.0, // Spacing between columns
              childAspectRatio: 1,
              children: [
                FileOptionWidget(
                  title: 'Photos'.tr(),
                  icon: FontAwesomeIcons.image,
                  onTap: () => BlocProvider.of<CallCenterBloc>(context)
                      .add(FilesMessage(type: 0)),
                ),
                FileOptionWidget(
                  title: 'Camera'.tr(),
                  onTap: () => BlocProvider.of<CallCenterBloc>(context)
                      .add(FilesMessage(type: 1)),
                  icon: FontAwesomeIcons.cameraRetro,
                ),
                // FileOptionWidget(
                //   title: 'Document'.tr(),
                //   icon: FontAwesomeIcons.file,
                //   arg: '',
                //   onTap: () => BlocProvider.of<CallCenterBloc>(context)
                //       .add(FilesMessage(type: 2)),
                // ),
                // FileOptionWidget(
                //   icon: FontAwesomeIcons.addressBook,
                //   title: 'Contact',
                //   onTap: () => BlocProvider.of<CallCenterBloc>(context)
                //       .add(FilesMessage(type: 3)),
                // ),
              ])),
    );
