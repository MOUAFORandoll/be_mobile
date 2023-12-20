import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:sdp_transform/sdp_transform.dart';

import 'utils/functions/viewFunctions.dart';

class Test extends StatefulWidget {
  const Test({
    Key? key,
  }) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  final _localVideoRenderer = RTCVideoRenderer();
  final _remoteVideoRenderer = RTCVideoRenderer();
  final sdpController = TextEditingController();

  bool _offer = false;

  RTCPeerConnection? _peerConnection;
  MediaStream? _localStream;

  initRenderer() async {
    await _localVideoRenderer.initialize();
    await _remoteVideoRenderer.initialize();
  }

  _getUserMedia() async {
    final Map<String, dynamic> mediaConstraints = {
      'audio': true,
      'video': {
        'facingMode': 'user',
      }
    };

    MediaStream stream =
        await navigator.mediaDevices.getUserMedia(mediaConstraints);

    _localVideoRenderer.srcObject = stream;
    return stream;
  }

  _createPeerConnecion() async {
    Map<String, dynamic> configuration = {
      'iceServers': [
        {
          'urls': [
            'stun:stun1.l.google.com:19302',
            'stun:stun2.l.google.com:19302'
          ]
        }
      ]
    };

    final Map<String, dynamic> offerSdpConstraints = {
      "mandatory": {
        "OfferToReceiveAudio": true,
        "OfferToReceiveVideo": true,
      },
      "optional": [],
    };

    _localStream = await _getUserMedia();

    RTCPeerConnection pc =
        await createPeerConnection(configuration, offerSdpConstraints);

    pc.addStream(_localStream!);

    pc.onIceCandidate = (e) {
      if (e.candidate != null) {
        print(json.encode({
          'candidate': e.candidate.toString(),
          'sdpMid': e.sdpMid.toString(),
          'sdpMlineIndex': e.sdpMLineIndex,
        }));
      }
    };

    pc.onIceConnectionState = (e) {
      print("-------------errrorr perrr$e");
    };

    pc.onAddStream = (stream) {
      print('addStream: ' + stream.id);
      _remoteVideoRenderer.srcObject = stream;
    };

    return pc;
  }

  void _createOffer() async {
    if (_peerConnection != null) {
      RTCSessionDescription description =
          await _peerConnection!.createOffer({'offerToReceiveVideo': 1});
      var session = parse(description.sdp.toString());
      print(json.encode(session));
      _offer = true;

      _peerConnection!.setLocalDescription(description);
    } else {
      print("Error: _peerConnection is null");
      // Handle the case where _peerConnection is null, throw an exception, or log an error.
    }
  }

  void _createAnswer() async {
    RTCSessionDescription description =
        await _peerConnection!.createAnswer({'offerToReceiveVideo': 1});

    var session = parse(description.sdp.toString());
    print(json.encode(session));

    _peerConnection!.setLocalDescription(description);
  }

  void _setRemoteDescription() async {
    String jsonString = sdpController.text;
    dynamic session = await jsonDecode(jsonString);

    String sdp = write(session, null);

    RTCSessionDescription description =
        RTCSessionDescription(sdp, _offer ? 'answer' : 'offer');
    print(description.toMap());

    await _peerConnection!.setRemoteDescription(description);
  }

  void _addCandidate() async {
    String jsonString = sdpController.text;
    dynamic session = await jsonDecode(jsonString);
    print(session['candidate']);
    dynamic candidate = RTCIceCandidate(
        session['candidate'], session['sdpMid'], session['sdpMlineIndex']);
    await _peerConnection!.addCandidate(candidate);
  }

  @override
  void initState() {
    print('-_getUserMedia*--------is _getUserMedia-----${_peerConnection}');
    _getUserMedia();
    initRenderer();
    _createPeerConnecion().then((pc) {
      print('-_peerConnection*--------start');
      _peerConnection = pc;
      print('-_peerConnection*--------is create-----${_peerConnection}');
    });
    super.initState();
  }

  init() {
    _createPeerConnecion().then((pc) {
      _peerConnection = pc;
      print('-_peerConnection*--------is create-----${_peerConnection}');
    });
  }

  @override
  void dispose() async {
    await _localVideoRenderer.dispose();
    sdpController.dispose();
    super.dispose();
  }

  var fn = new ViewFunctions();

  SizedBox videoRenderers() => SizedBox(
        height: 210,
        child: Row(children: [
          Flexible(
            child: Container(
              key: const Key('local'),
              margin: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
              decoration: const BoxDecoration(color: Colors.black),
              child: RTCVideoView(_localVideoRenderer),
            ),
          ),
          Flexible(
            child: Container(
              key: const Key('remote'),
              margin: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
              decoration: const BoxDecoration(color: Colors.black),
              child: RTCVideoView(_remoteVideoRenderer),
            ),
          ),
        ]),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('widget'),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                fn.loading(
                    'Eiusmod ex quis deserunt ex eiusmod adipisicing duis fugiat excepteur non velit fugiat id id. ',
                    '');
              }, // _createOffer,
              child:
                  Container(height: 150, width: 250, child: const Text("Test")),
            ),
            // videoRenderers(),
            Column(
              children: [
                // Padding(
                //   padding: const EdgeInsets.all(16.0),
                //   child: SizedBox(
                //     width: MediaQuery.of(context).size.width * 0.5,
                //     child: TextField(
                //       controller: sdpController,
                //       keyboardType: TextInputType.multiline,
                //       maxLines: 4,
                //       maxLength: TextField.noMaxLength,
                //     ),
                //   ),
                // ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: init, // _createOffer,
                      child: const Text("Offer"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: _createAnswer,
                      child: const Text("Answer"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: _setRemoteDescription,
                      child: const Text("Set Remote Description"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: _addCandidate,
                      child: const Text("Set Candidate"),
                    ),
                  ],
                )
              ],
            ),
          ],
        ));
  }
}
