import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:BabanaExpress/application/model/data/MessageModel.dart';
import 'package:BabanaExpress/presentation/components/Widget/load_file_online.dart';

import '../exportcomponent.dart';

class MessageComponent extends StatefulWidget {
  const MessageComponent({Key? key, required this.message}) : super(key: key);
  final MessageModel message;

  @override
  State<MessageComponent> createState() => _MessageComponentState();
}

class _MessageComponentState extends State<MessageComponent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(
          milliseconds: 150), // Shorter duration for quicker transition
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(0.1, 0.0), // Slight transition to the right
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut, // Smoother transition
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    if (!widget.message.isDelete) {
      if (details.primaryDelta! > 0) {
        _controller.forward().then((value) {
          _controller.reverse(); // Automatically reverse after forwarding
        });
        context
            .read<CallCenterBloc>()
            .add(TargetMessage(message_target: widget.message));
      }
    }
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    print('dddd00');
    if (_controller.status == AnimationStatus.forward) {
      _controller.reverse(); // Ensure it reverses if the drag ends
    }
  }

  @override
  Widget build(BuildContext context) {
    final alignment = !widget.message.isCallCenter
        ? Alignment.centerRight
        : Alignment.centerLeft;
    final color =
        !widget.message.isCallCenter ? ColorsApp.black : ColorsApp.greyNew;
    final colorInter =
        !widget.message.isCallCenter ? ColorsApp.black : ColorsApp.grey;
    final colorText =
        widget.message.isCallCenter ? ColorsApp.black : ColorsApp.white;
    final colorText2 =
        widget.message.isCallCenter ? ColorsApp.black : ColorsApp.white;
    final colorDrag = widget.message.isCallCenter
        ? const Color.fromARGB(255, 3, 10, 19)
        : ColorsApp.white;

    return GestureDetector(
      onLongPressStart: (details) {
        if (!widget.message.isDelete) {
          _showPopupMenu(context, details.globalPosition, widget.message);
        }
      },
      onHorizontalDragUpdate: _onHorizontalDragUpdate,
      onHorizontalDragEnd: _onHorizontalDragEnd,
      child: SlideTransition(
        position: _offsetAnimation,
        child: Container(
          margin: EdgeInsets.only(top: kMarginY / 2)
              .add(EdgeInsets.symmetric(horizontal: kMarginX * 2)),
          alignment: alignment,
          child: Row(
            mainAxisAlignment: !widget.message.isCallCenter
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(bottom: kMarginY / 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          /*  !widget.message.isCallCenter
                              ? BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10))
                              : BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)), */
                          color: color.withOpacity(0.8)),
                      constraints: BoxConstraints(
                        maxWidth: getWidth(context) * .50,
                        minWidth: getWidth(context) * .35,
                      ),
                      padding: EdgeInsets.all(3),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (widget.message.messageTarget != null)
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: colorInter),
                                padding: EdgeInsets.all(3),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 35,
                                      width: 4,
                                      decoration: BoxDecoration(
                                          color: colorDrag,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(30),
                                              bottomLeft: Radius.circular(30),
                                              bottomRight:
                                                  Radius.circular(30))),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: kMarginX / 2),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              child: widget
                                                      .message
                                                      .messageTarget!
                                                      .isCallCenter
                                                  ? Text('Call Center',
                                                      style: TextStyle(
                                                          fontFamily: 'Lato',
                                                          color: ColorsApp.tird,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w600))
                                                  : Text('Vous',
                                                      style: TextStyle(
                                                          fontFamily: 'Lato',
                                                          color:
                                                              ColorsApp.second,
                                                          fontSize: 12,
                                                          fontWeight: FontWeight
                                                              .w600))),
                                          Text(
                                              widget.message.messageTarget!
                                                  .message,
                                              style: TextStyle(
                                                fontFamily: 'Lato',
                                                color:
                                                    colorText2.withOpacity(.5),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            if (widget.message.attachFile.isNotEmpty)
                              SingleChildScrollView(
                                  child: widget.message.attachFile.length == 1
                                      ? Container(
                                          height: 150,
                                          child: LoadFileOnlineWidget(
                                              file:
                                                  widget.message.attachFile[0]))
                                      : Container(
                                          // height: 150,
                                          child: GridView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 2,
                                                      crossAxisSpacing: 1.0,
                                                      childAspectRatio: 1,
                                                      mainAxisExtent: 180,
                                                      mainAxisSpacing: 1.0),
                                              itemCount: widget
                                                  .message.attachFile.length,
                                              itemBuilder: (_ctx, index) =>
                                                  LoadFileOnlineWidget(
                                                      file: widget.message
                                                          .attachFile[index])),
                                        )),
                            Container(
                              padding: EdgeInsets.all(5),
                              child: Text(widget.message.message,
                                  style: TextStyle(
                                      fontFamily: 'Lato',
                                      color: widget.message.isDelete
                                          ? colorText.withOpacity(.5)
                                          : colorText,
                                      fontStyle: widget.message.isDelete
                                          ? FontStyle.italic
                                          : FontStyle.normal)),
                            ),
                          ])),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

void _showPopupMenu(
    BuildContext context, Offset offset, MessageModel message) async {
  double left = offset.dx;
  double top = offset.dy;
  await showMenu(
    constraints: BoxConstraints(
      maxWidth: getWidth(context) * .50,
      minWidth: getWidth(context) * .35,
    ),
    context: context,
    position: RelativeRect.fromLTRB(left, top, left + 1, top + 1),
    items: [
      new PopupMenuItem(
          child: Text('Modifier'),
          onTap: () => context.read<CallCenterBloc>().add(
                SetMessageToUpdate(message: message),
              )),
      new PopupMenuItem(
        child: Text('Supprimer'),
        onTap: () =>
            context.read<CallCenterBloc>().add(DeleteMessage(message: message)),
      ),
    ],
  );
}
