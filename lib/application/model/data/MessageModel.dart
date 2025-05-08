class MessageModel {
  final int id;
  final bool isCallCenter;
  final bool isDelete;
  final String message;
  final String dateSend;
  final String heureSend;
  final String? dateRead;
  final String? heureRead;
  final MessageModel? messageTarget;
  final List<AttachFile> attachFile;

  MessageModel({
    required this.id,
    required this.isDelete,
    required this.isCallCenter,
    required this.message,
    required this.dateSend,
    required this.heureSend,
    this.dateRead,
    this.heureRead,
    this.messageTarget,
    required this.attachFile,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    var attachFileList = json['attach_file'] as List;
    List<AttachFile> attachFile =
        attachFileList.map((item) => AttachFile.fromJson(item)).toList();

    return MessageModel(
      id: json['id'],
      isDelete: json['isDelete'],
      isCallCenter: json['isCallCenter'],
      message: json['message'],
      dateSend: json['dateSend'],
      heureSend: json['heureSend'],
      dateRead: json['dateRead'],
      heureRead: json['heureRead'],
      messageTarget: json['messageTarget'] == null
          ? null
          : MessageModel.fromJson(json['messageTarget']),
      attachFile: attachFile,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'isDelete': isDelete,
      'isCallCenter': isCallCenter,
      'message': message,
      'dateSend': dateSend,
      'heureSend': heureSend,
      'dateRead': dateRead,
      'heureRead': heureRead,
      'messageTarget': messageTarget,
      'attach_file': attachFile.map((item) => item.toJson()).toList(),
    };
  }
}

class AttachFile {
  final String src;

  AttachFile({required this.src});

  factory AttachFile.fromJson(Map<String, dynamic> json) {
    return AttachFile(
      src: json['src'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'src': src,
    };
  }
}
