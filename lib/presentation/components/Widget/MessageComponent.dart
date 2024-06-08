import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:BabanaExpress/application/model/data/MessageModel.dart';
import 'package:BabanaExpress/core.dart';
import 'package:BabanaExpress/utils/constants/assets.dart';
import 'package:BabanaExpress/utils/functions/formatData.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../exportcomponent.dart';

class MessageComponent extends StatefulWidget {
  const MessageComponent({required this.message});
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
    if (details.primaryDelta! > 0) {
      _controller.forward().then((value) {
        _controller.reverse(); // Automatically reverse after forwarding
      });
      context
          .read<CallCenterBloc>()
          .add(TargetMessage(message_target: widget.message));
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
              (widget.message.messageTarget != null)
                  ? Container(
                      margin: EdgeInsets.only(bottom: kMarginY / 2),
                      decoration: BoxDecoration(
                          borderRadius: !widget.message.isCallCenter
                              ? BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10))
                              : BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                          color: color.withOpacity(0.8)),
                      constraints: BoxConstraints(
                        maxWidth: getWith(context) * .50,
                        minWidth: getWith(context) * .35,
                      ),
                      padding: EdgeInsets.all(3),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                                            bottomRight: Radius.circular(30))),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: kMarginX / 2),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            child: widget.message.messageTarget!
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
                                                        color: ColorsApp.second,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w600))),
                                        Text(
                                            widget
                                                .message.messageTarget!.message,
                                            style: TextStyle(
                                              fontFamily: 'Lato',
                                              color: colorText2.withOpacity(.5),
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              child: Text(widget.message.message,
                                  style: TextStyle(
                                    fontFamily: 'Lato',
                                    color: colorText,
                                  )),
                            ),
                          ]))
                  : Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                                margin: EdgeInsets.only(bottom: kMarginY / 2),
                                decoration: BoxDecoration(
                                    borderRadius: !widget.message.isCallCenter
                                        ? BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10))
                                        : BorderRadius.only(
                                            topRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10)),
                                    color: color),
                                constraints: BoxConstraints(
                                  maxWidth: getWith(context) * .50,
                                  minWidth: getWith(context) * .35,
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: kMarginX * 1.3,
                                    vertical: kMarginY * 1.5),
                                child: Text(widget.message.message,
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      color: colorText,
                                    ))),
                            Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  padding: EdgeInsets.all(7),
                                  child: Text(widget.message.heureSend,
                                      style: TextStyle(
                                          fontFamily: 'Lato',
                                          color: colorText,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold)),
                                )),
                          ],
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
