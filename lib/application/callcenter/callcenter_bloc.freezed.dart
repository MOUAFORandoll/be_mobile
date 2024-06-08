// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'callcenter_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CallCenterEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getMessage,
    required TResult Function() newMessage,
    required TResult Function(MessageModel? message_target) targetMessage,
    required TResult Function(int? type) fileMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getMessage,
    TResult? Function()? newMessage,
    TResult? Function(MessageModel? message_target)? targetMessage,
    TResult? Function(int? type)? fileMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getMessage,
    TResult Function()? newMessage,
    TResult Function(MessageModel? message_target)? targetMessage,
    TResult Function(int? type)? fileMessage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(GetMessage value) getMessage,
    required TResult Function(NewMessage value) newMessage,
    required TResult Function(TargetMessage value) targetMessage,
    required TResult Function(FileMessage value) fileMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetMessage value)? getMessage,
    TResult? Function(NewMessage value)? newMessage,
    TResult? Function(TargetMessage value)? targetMessage,
    TResult? Function(FileMessage value)? fileMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetMessage value)? getMessage,
    TResult Function(NewMessage value)? newMessage,
    TResult Function(TargetMessage value)? targetMessage,
    TResult Function(FileMessage value)? fileMessage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CallCenterEventCopyWith<$Res> {
  factory $CallCenterEventCopyWith(
          CallCenterEvent value, $Res Function(CallCenterEvent) then) =
      _$CallCenterEventCopyWithImpl<$Res, CallCenterEvent>;
}

/// @nodoc
class _$CallCenterEventCopyWithImpl<$Res, $Val extends CallCenterEvent>
    implements $CallCenterEventCopyWith<$Res> {
  _$CallCenterEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$CallCenterEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'CallCenterEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getMessage,
    required TResult Function() newMessage,
    required TResult Function(MessageModel? message_target) targetMessage,
    required TResult Function(int? type) fileMessage,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getMessage,
    TResult? Function()? newMessage,
    TResult? Function(MessageModel? message_target)? targetMessage,
    TResult? Function(int? type)? fileMessage,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getMessage,
    TResult Function()? newMessage,
    TResult Function(MessageModel? message_target)? targetMessage,
    TResult Function(int? type)? fileMessage,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(GetMessage value) getMessage,
    required TResult Function(NewMessage value) newMessage,
    required TResult Function(TargetMessage value) targetMessage,
    required TResult Function(FileMessage value) fileMessage,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetMessage value)? getMessage,
    TResult? Function(NewMessage value)? newMessage,
    TResult? Function(TargetMessage value)? targetMessage,
    TResult? Function(FileMessage value)? fileMessage,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetMessage value)? getMessage,
    TResult Function(NewMessage value)? newMessage,
    TResult Function(TargetMessage value)? targetMessage,
    TResult Function(FileMessage value)? fileMessage,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements CallCenterEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GetMessageImplCopyWith<$Res> {
  factory _$$GetMessageImplCopyWith(
          _$GetMessageImpl value, $Res Function(_$GetMessageImpl) then) =
      __$$GetMessageImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetMessageImplCopyWithImpl<$Res>
    extends _$CallCenterEventCopyWithImpl<$Res, _$GetMessageImpl>
    implements _$$GetMessageImplCopyWith<$Res> {
  __$$GetMessageImplCopyWithImpl(
      _$GetMessageImpl _value, $Res Function(_$GetMessageImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetMessageImpl implements GetMessage {
  const _$GetMessageImpl();

  @override
  String toString() {
    return 'CallCenterEvent.getMessage()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetMessageImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getMessage,
    required TResult Function() newMessage,
    required TResult Function(MessageModel? message_target) targetMessage,
    required TResult Function(int? type) fileMessage,
  }) {
    return getMessage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getMessage,
    TResult? Function()? newMessage,
    TResult? Function(MessageModel? message_target)? targetMessage,
    TResult? Function(int? type)? fileMessage,
  }) {
    return getMessage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getMessage,
    TResult Function()? newMessage,
    TResult Function(MessageModel? message_target)? targetMessage,
    TResult Function(int? type)? fileMessage,
    required TResult orElse(),
  }) {
    if (getMessage != null) {
      return getMessage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(GetMessage value) getMessage,
    required TResult Function(NewMessage value) newMessage,
    required TResult Function(TargetMessage value) targetMessage,
    required TResult Function(FileMessage value) fileMessage,
  }) {
    return getMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetMessage value)? getMessage,
    TResult? Function(NewMessage value)? newMessage,
    TResult? Function(TargetMessage value)? targetMessage,
    TResult? Function(FileMessage value)? fileMessage,
  }) {
    return getMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetMessage value)? getMessage,
    TResult Function(NewMessage value)? newMessage,
    TResult Function(TargetMessage value)? targetMessage,
    TResult Function(FileMessage value)? fileMessage,
    required TResult orElse(),
  }) {
    if (getMessage != null) {
      return getMessage(this);
    }
    return orElse();
  }
}

abstract class GetMessage implements CallCenterEvent {
  const factory GetMessage() = _$GetMessageImpl;
}

/// @nodoc
abstract class _$$NewMessageImplCopyWith<$Res> {
  factory _$$NewMessageImplCopyWith(
          _$NewMessageImpl value, $Res Function(_$NewMessageImpl) then) =
      __$$NewMessageImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NewMessageImplCopyWithImpl<$Res>
    extends _$CallCenterEventCopyWithImpl<$Res, _$NewMessageImpl>
    implements _$$NewMessageImplCopyWith<$Res> {
  __$$NewMessageImplCopyWithImpl(
      _$NewMessageImpl _value, $Res Function(_$NewMessageImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NewMessageImpl implements NewMessage {
  const _$NewMessageImpl();

  @override
  String toString() {
    return 'CallCenterEvent.newMessage()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NewMessageImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getMessage,
    required TResult Function() newMessage,
    required TResult Function(MessageModel? message_target) targetMessage,
    required TResult Function(int? type) fileMessage,
  }) {
    return newMessage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getMessage,
    TResult? Function()? newMessage,
    TResult? Function(MessageModel? message_target)? targetMessage,
    TResult? Function(int? type)? fileMessage,
  }) {
    return newMessage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getMessage,
    TResult Function()? newMessage,
    TResult Function(MessageModel? message_target)? targetMessage,
    TResult Function(int? type)? fileMessage,
    required TResult orElse(),
  }) {
    if (newMessage != null) {
      return newMessage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(GetMessage value) getMessage,
    required TResult Function(NewMessage value) newMessage,
    required TResult Function(TargetMessage value) targetMessage,
    required TResult Function(FileMessage value) fileMessage,
  }) {
    return newMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetMessage value)? getMessage,
    TResult? Function(NewMessage value)? newMessage,
    TResult? Function(TargetMessage value)? targetMessage,
    TResult? Function(FileMessage value)? fileMessage,
  }) {
    return newMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetMessage value)? getMessage,
    TResult Function(NewMessage value)? newMessage,
    TResult Function(TargetMessage value)? targetMessage,
    TResult Function(FileMessage value)? fileMessage,
    required TResult orElse(),
  }) {
    if (newMessage != null) {
      return newMessage(this);
    }
    return orElse();
  }
}

abstract class NewMessage implements CallCenterEvent {
  const factory NewMessage() = _$NewMessageImpl;
}

/// @nodoc
abstract class _$$TargetMessageImplCopyWith<$Res> {
  factory _$$TargetMessageImplCopyWith(
          _$TargetMessageImpl value, $Res Function(_$TargetMessageImpl) then) =
      __$$TargetMessageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MessageModel? message_target});
}

/// @nodoc
class __$$TargetMessageImplCopyWithImpl<$Res>
    extends _$CallCenterEventCopyWithImpl<$Res, _$TargetMessageImpl>
    implements _$$TargetMessageImplCopyWith<$Res> {
  __$$TargetMessageImplCopyWithImpl(
      _$TargetMessageImpl _value, $Res Function(_$TargetMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message_target = freezed,
  }) {
    return _then(_$TargetMessageImpl(
      message_target: freezed == message_target
          ? _value.message_target
          : message_target // ignore: cast_nullable_to_non_nullable
              as MessageModel?,
    ));
  }
}

/// @nodoc

class _$TargetMessageImpl implements TargetMessage {
  const _$TargetMessageImpl({this.message_target});

  @override
  final MessageModel? message_target;

  @override
  String toString() {
    return 'CallCenterEvent.targetMessage(message_target: $message_target)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TargetMessageImpl &&
            (identical(other.message_target, message_target) ||
                other.message_target == message_target));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message_target);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TargetMessageImplCopyWith<_$TargetMessageImpl> get copyWith =>
      __$$TargetMessageImplCopyWithImpl<_$TargetMessageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getMessage,
    required TResult Function() newMessage,
    required TResult Function(MessageModel? message_target) targetMessage,
    required TResult Function(int? type) fileMessage,
  }) {
    return targetMessage(message_target);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getMessage,
    TResult? Function()? newMessage,
    TResult? Function(MessageModel? message_target)? targetMessage,
    TResult? Function(int? type)? fileMessage,
  }) {
    return targetMessage?.call(message_target);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getMessage,
    TResult Function()? newMessage,
    TResult Function(MessageModel? message_target)? targetMessage,
    TResult Function(int? type)? fileMessage,
    required TResult orElse(),
  }) {
    if (targetMessage != null) {
      return targetMessage(message_target);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(GetMessage value) getMessage,
    required TResult Function(NewMessage value) newMessage,
    required TResult Function(TargetMessage value) targetMessage,
    required TResult Function(FileMessage value) fileMessage,
  }) {
    return targetMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetMessage value)? getMessage,
    TResult? Function(NewMessage value)? newMessage,
    TResult? Function(TargetMessage value)? targetMessage,
    TResult? Function(FileMessage value)? fileMessage,
  }) {
    return targetMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetMessage value)? getMessage,
    TResult Function(NewMessage value)? newMessage,
    TResult Function(TargetMessage value)? targetMessage,
    TResult Function(FileMessage value)? fileMessage,
    required TResult orElse(),
  }) {
    if (targetMessage != null) {
      return targetMessage(this);
    }
    return orElse();
  }
}

abstract class TargetMessage implements CallCenterEvent {
  const factory TargetMessage({final MessageModel? message_target}) =
      _$TargetMessageImpl;

  MessageModel? get message_target;
  @JsonKey(ignore: true)
  _$$TargetMessageImplCopyWith<_$TargetMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FileMessageImplCopyWith<$Res> {
  factory _$$FileMessageImplCopyWith(
          _$FileMessageImpl value, $Res Function(_$FileMessageImpl) then) =
      __$$FileMessageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? type});
}

/// @nodoc
class __$$FileMessageImplCopyWithImpl<$Res>
    extends _$CallCenterEventCopyWithImpl<$Res, _$FileMessageImpl>
    implements _$$FileMessageImplCopyWith<$Res> {
  __$$FileMessageImplCopyWithImpl(
      _$FileMessageImpl _value, $Res Function(_$FileMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
  }) {
    return _then(_$FileMessageImpl(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$FileMessageImpl implements FileMessage {
  const _$FileMessageImpl({this.type});

  @override
  final int? type;

  @override
  String toString() {
    return 'CallCenterEvent.fileMessage(type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FileMessageImpl &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FileMessageImplCopyWith<_$FileMessageImpl> get copyWith =>
      __$$FileMessageImplCopyWithImpl<_$FileMessageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getMessage,
    required TResult Function() newMessage,
    required TResult Function(MessageModel? message_target) targetMessage,
    required TResult Function(int? type) fileMessage,
  }) {
    return fileMessage(type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getMessage,
    TResult? Function()? newMessage,
    TResult? Function(MessageModel? message_target)? targetMessage,
    TResult? Function(int? type)? fileMessage,
  }) {
    return fileMessage?.call(type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getMessage,
    TResult Function()? newMessage,
    TResult Function(MessageModel? message_target)? targetMessage,
    TResult Function(int? type)? fileMessage,
    required TResult orElse(),
  }) {
    if (fileMessage != null) {
      return fileMessage(type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(GetMessage value) getMessage,
    required TResult Function(NewMessage value) newMessage,
    required TResult Function(TargetMessage value) targetMessage,
    required TResult Function(FileMessage value) fileMessage,
  }) {
    return fileMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetMessage value)? getMessage,
    TResult? Function(NewMessage value)? newMessage,
    TResult? Function(TargetMessage value)? targetMessage,
    TResult? Function(FileMessage value)? fileMessage,
  }) {
    return fileMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetMessage value)? getMessage,
    TResult Function(NewMessage value)? newMessage,
    TResult Function(TargetMessage value)? targetMessage,
    TResult Function(FileMessage value)? fileMessage,
    required TResult orElse(),
  }) {
    if (fileMessage != null) {
      return fileMessage(this);
    }
    return orElse();
  }
}

abstract class FileMessage implements CallCenterEvent {
  const factory FileMessage({final int? type}) = _$FileMessageImpl;

  int? get type;
  @JsonKey(ignore: true)
  _$$FileMessageImplCopyWith<_$FileMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CallCenterState {
  TextEditingController? get messageText => throw _privateConstructorUsedError;
  int? get isLoadMessageCallCenter => throw _privateConstructorUsedError;
  int? get isLoadSend => throw _privateConstructorUsedError;
  ScrollController? get callcenterSrollController =>
      throw _privateConstructorUsedError;
  MessageModel? get message_target => throw _privateConstructorUsedError;
  XFile? get fileMessage => throw _privateConstructorUsedError;
  List<MessageModel>? get messages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CallCenterStateCopyWith<CallCenterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CallCenterStateCopyWith<$Res> {
  factory $CallCenterStateCopyWith(
          CallCenterState value, $Res Function(CallCenterState) then) =
      _$CallCenterStateCopyWithImpl<$Res, CallCenterState>;
  @useResult
  $Res call(
      {TextEditingController? messageText,
      int? isLoadMessageCallCenter,
      int? isLoadSend,
      ScrollController? callcenterSrollController,
      MessageModel? message_target,
      XFile? fileMessage,
      List<MessageModel>? messages});
}

/// @nodoc
class _$CallCenterStateCopyWithImpl<$Res, $Val extends CallCenterState>
    implements $CallCenterStateCopyWith<$Res> {
  _$CallCenterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageText = freezed,
    Object? isLoadMessageCallCenter = freezed,
    Object? isLoadSend = freezed,
    Object? callcenterSrollController = freezed,
    Object? message_target = freezed,
    Object? fileMessage = freezed,
    Object? messages = freezed,
  }) {
    return _then(_value.copyWith(
      messageText: freezed == messageText
          ? _value.messageText
          : messageText // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
      isLoadMessageCallCenter: freezed == isLoadMessageCallCenter
          ? _value.isLoadMessageCallCenter
          : isLoadMessageCallCenter // ignore: cast_nullable_to_non_nullable
              as int?,
      isLoadSend: freezed == isLoadSend
          ? _value.isLoadSend
          : isLoadSend // ignore: cast_nullable_to_non_nullable
              as int?,
      callcenterSrollController: freezed == callcenterSrollController
          ? _value.callcenterSrollController
          : callcenterSrollController // ignore: cast_nullable_to_non_nullable
              as ScrollController?,
      message_target: freezed == message_target
          ? _value.message_target
          : message_target // ignore: cast_nullable_to_non_nullable
              as MessageModel?,
      fileMessage: freezed == fileMessage
          ? _value.fileMessage
          : fileMessage // ignore: cast_nullable_to_non_nullable
              as XFile?,
      messages: freezed == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<MessageModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CallCenterStateImplCopyWith<$Res>
    implements $CallCenterStateCopyWith<$Res> {
  factory _$$CallCenterStateImplCopyWith(_$CallCenterStateImpl value,
          $Res Function(_$CallCenterStateImpl) then) =
      __$$CallCenterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TextEditingController? messageText,
      int? isLoadMessageCallCenter,
      int? isLoadSend,
      ScrollController? callcenterSrollController,
      MessageModel? message_target,
      XFile? fileMessage,
      List<MessageModel>? messages});
}

/// @nodoc
class __$$CallCenterStateImplCopyWithImpl<$Res>
    extends _$CallCenterStateCopyWithImpl<$Res, _$CallCenterStateImpl>
    implements _$$CallCenterStateImplCopyWith<$Res> {
  __$$CallCenterStateImplCopyWithImpl(
      _$CallCenterStateImpl _value, $Res Function(_$CallCenterStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageText = freezed,
    Object? isLoadMessageCallCenter = freezed,
    Object? isLoadSend = freezed,
    Object? callcenterSrollController = freezed,
    Object? message_target = freezed,
    Object? fileMessage = freezed,
    Object? messages = freezed,
  }) {
    return _then(_$CallCenterStateImpl(
      messageText: freezed == messageText
          ? _value.messageText
          : messageText // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
      isLoadMessageCallCenter: freezed == isLoadMessageCallCenter
          ? _value.isLoadMessageCallCenter
          : isLoadMessageCallCenter // ignore: cast_nullable_to_non_nullable
              as int?,
      isLoadSend: freezed == isLoadSend
          ? _value.isLoadSend
          : isLoadSend // ignore: cast_nullable_to_non_nullable
              as int?,
      callcenterSrollController: freezed == callcenterSrollController
          ? _value.callcenterSrollController
          : callcenterSrollController // ignore: cast_nullable_to_non_nullable
              as ScrollController?,
      message_target: freezed == message_target
          ? _value.message_target
          : message_target // ignore: cast_nullable_to_non_nullable
              as MessageModel?,
      fileMessage: freezed == fileMessage
          ? _value.fileMessage
          : fileMessage // ignore: cast_nullable_to_non_nullable
              as XFile?,
      messages: freezed == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<MessageModel>?,
    ));
  }
}

/// @nodoc

class _$CallCenterStateImpl implements _CallCenterState {
  const _$CallCenterStateImpl(
      {this.messageText,
      this.isLoadMessageCallCenter,
      this.isLoadSend,
      this.callcenterSrollController,
      this.message_target,
      this.fileMessage,
      final List<MessageModel>? messages})
      : _messages = messages;

  @override
  final TextEditingController? messageText;
  @override
  final int? isLoadMessageCallCenter;
  @override
  final int? isLoadSend;
  @override
  final ScrollController? callcenterSrollController;
  @override
  final MessageModel? message_target;
  @override
  final XFile? fileMessage;
  final List<MessageModel>? _messages;
  @override
  List<MessageModel>? get messages {
    final value = _messages;
    if (value == null) return null;
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CallCenterState(messageText: $messageText, isLoadMessageCallCenter: $isLoadMessageCallCenter, isLoadSend: $isLoadSend, callcenterSrollController: $callcenterSrollController, message_target: $message_target, fileMessage: $fileMessage, messages: $messages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CallCenterStateImpl &&
            (identical(other.messageText, messageText) ||
                other.messageText == messageText) &&
            (identical(
                    other.isLoadMessageCallCenter, isLoadMessageCallCenter) ||
                other.isLoadMessageCallCenter == isLoadMessageCallCenter) &&
            (identical(other.isLoadSend, isLoadSend) ||
                other.isLoadSend == isLoadSend) &&
            (identical(other.callcenterSrollController,
                    callcenterSrollController) ||
                other.callcenterSrollController == callcenterSrollController) &&
            (identical(other.message_target, message_target) ||
                other.message_target == message_target) &&
            (identical(other.fileMessage, fileMessage) ||
                other.fileMessage == fileMessage) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      messageText,
      isLoadMessageCallCenter,
      isLoadSend,
      callcenterSrollController,
      message_target,
      fileMessage,
      const DeepCollectionEquality().hash(_messages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CallCenterStateImplCopyWith<_$CallCenterStateImpl> get copyWith =>
      __$$CallCenterStateImplCopyWithImpl<_$CallCenterStateImpl>(
          this, _$identity);
}

abstract class _CallCenterState implements CallCenterState {
  const factory _CallCenterState(
      {final TextEditingController? messageText,
      final int? isLoadMessageCallCenter,
      final int? isLoadSend,
      final ScrollController? callcenterSrollController,
      final MessageModel? message_target,
      final XFile? fileMessage,
      final List<MessageModel>? messages}) = _$CallCenterStateImpl;

  @override
  TextEditingController? get messageText;
  @override
  int? get isLoadMessageCallCenter;
  @override
  int? get isLoadSend;
  @override
  ScrollController? get callcenterSrollController;
  @override
  MessageModel? get message_target;
  @override
  XFile? get fileMessage;
  @override
  List<MessageModel>? get messages;
  @override
  @JsonKey(ignore: true)
  _$$CallCenterStateImplCopyWith<_$CallCenterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
