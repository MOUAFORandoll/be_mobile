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
mixin _$CallcenterEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getMessage,
    required TResult Function() newMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getMessage,
    TResult? Function()? newMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getMessage,
    TResult Function()? newMessage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(GetMessage value) getMessage,
    required TResult Function(NewMessage value) newMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetMessage value)? getMessage,
    TResult? Function(NewMessage value)? newMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetMessage value)? getMessage,
    TResult Function(NewMessage value)? newMessage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CallcenterEventCopyWith<$Res> {
  factory $CallcenterEventCopyWith(
          CallcenterEvent value, $Res Function(CallcenterEvent) then) =
      _$CallcenterEventCopyWithImpl<$Res, CallcenterEvent>;
}

/// @nodoc
class _$CallcenterEventCopyWithImpl<$Res, $Val extends CallcenterEvent>
    implements $CallcenterEventCopyWith<$Res> {
  _$CallcenterEventCopyWithImpl(this._value, this._then);

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
    extends _$CallcenterEventCopyWithImpl<$Res, _$StartedImpl>
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
    return 'CallcenterEvent.started()';
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
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getMessage,
    TResult? Function()? newMessage,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getMessage,
    TResult Function()? newMessage,
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
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetMessage value)? getMessage,
    TResult? Function(NewMessage value)? newMessage,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetMessage value)? getMessage,
    TResult Function(NewMessage value)? newMessage,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements CallcenterEvent {
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
    extends _$CallcenterEventCopyWithImpl<$Res, _$GetMessageImpl>
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
    return 'CallcenterEvent.getMessage()';
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
  }) {
    return getMessage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getMessage,
    TResult? Function()? newMessage,
  }) {
    return getMessage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getMessage,
    TResult Function()? newMessage,
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
  }) {
    return getMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetMessage value)? getMessage,
    TResult? Function(NewMessage value)? newMessage,
  }) {
    return getMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetMessage value)? getMessage,
    TResult Function(NewMessage value)? newMessage,
    required TResult orElse(),
  }) {
    if (getMessage != null) {
      return getMessage(this);
    }
    return orElse();
  }
}

abstract class GetMessage implements CallcenterEvent {
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
    extends _$CallcenterEventCopyWithImpl<$Res, _$NewMessageImpl>
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
    return 'CallcenterEvent.newMessage()';
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
  }) {
    return newMessage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getMessage,
    TResult? Function()? newMessage,
  }) {
    return newMessage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getMessage,
    TResult Function()? newMessage,
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
  }) {
    return newMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetMessage value)? getMessage,
    TResult? Function(NewMessage value)? newMessage,
  }) {
    return newMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetMessage value)? getMessage,
    TResult Function(NewMessage value)? newMessage,
    required TResult orElse(),
  }) {
    if (newMessage != null) {
      return newMessage(this);
    }
    return orElse();
  }
}

abstract class NewMessage implements CallcenterEvent {
  const factory NewMessage() = _$NewMessageImpl;
}

/// @nodoc
mixin _$CallcenterState {
  TextEditingController? get messageText => throw _privateConstructorUsedError;
  int? get isLoadMessageCallCenter => throw _privateConstructorUsedError;
  int? get isLoadSend => throw _privateConstructorUsedError;
  int? get message_target => throw _privateConstructorUsedError;
  List<MessageModel>? get messages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CallcenterStateCopyWith<CallcenterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CallcenterStateCopyWith<$Res> {
  factory $CallcenterStateCopyWith(
          CallcenterState value, $Res Function(CallcenterState) then) =
      _$CallcenterStateCopyWithImpl<$Res, CallcenterState>;
  @useResult
  $Res call(
      {TextEditingController? messageText,
      int? isLoadMessageCallCenter,
      int? isLoadSend,
      int? message_target,
      List<MessageModel>? messages});
}

/// @nodoc
class _$CallcenterStateCopyWithImpl<$Res, $Val extends CallcenterState>
    implements $CallcenterStateCopyWith<$Res> {
  _$CallcenterStateCopyWithImpl(this._value, this._then);

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
    Object? message_target = freezed,
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
      message_target: freezed == message_target
          ? _value.message_target
          : message_target // ignore: cast_nullable_to_non_nullable
              as int?,
      messages: freezed == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<MessageModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CallcenterStateImplCopyWith<$Res>
    implements $CallcenterStateCopyWith<$Res> {
  factory _$$CallcenterStateImplCopyWith(_$CallcenterStateImpl value,
          $Res Function(_$CallcenterStateImpl) then) =
      __$$CallcenterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TextEditingController? messageText,
      int? isLoadMessageCallCenter,
      int? isLoadSend,
      int? message_target,
      List<MessageModel>? messages});
}

/// @nodoc
class __$$CallcenterStateImplCopyWithImpl<$Res>
    extends _$CallcenterStateCopyWithImpl<$Res, _$CallcenterStateImpl>
    implements _$$CallcenterStateImplCopyWith<$Res> {
  __$$CallcenterStateImplCopyWithImpl(
      _$CallcenterStateImpl _value, $Res Function(_$CallcenterStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageText = freezed,
    Object? isLoadMessageCallCenter = freezed,
    Object? isLoadSend = freezed,
    Object? message_target = freezed,
    Object? messages = freezed,
  }) {
    return _then(_$CallcenterStateImpl(
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
      message_target: freezed == message_target
          ? _value.message_target
          : message_target // ignore: cast_nullable_to_non_nullable
              as int?,
      messages: freezed == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<MessageModel>?,
    ));
  }
}

/// @nodoc

class _$CallcenterStateImpl implements _CallcenterState {
  const _$CallcenterStateImpl(
      {this.messageText,
      this.isLoadMessageCallCenter,
      this.isLoadSend,
      this.message_target,
      final List<MessageModel>? messages})
      : _messages = messages;

  @override
  final TextEditingController? messageText;
  @override
  final int? isLoadMessageCallCenter;
  @override
  final int? isLoadSend;
  @override
  final int? message_target;
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
    return 'CallcenterState(messageText: $messageText, isLoadMessageCallCenter: $isLoadMessageCallCenter, isLoadSend: $isLoadSend, message_target: $message_target, messages: $messages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CallcenterStateImpl &&
            (identical(other.messageText, messageText) ||
                other.messageText == messageText) &&
            (identical(
                    other.isLoadMessageCallCenter, isLoadMessageCallCenter) ||
                other.isLoadMessageCallCenter == isLoadMessageCallCenter) &&
            (identical(other.isLoadSend, isLoadSend) ||
                other.isLoadSend == isLoadSend) &&
            (identical(other.message_target, message_target) ||
                other.message_target == message_target) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      messageText,
      isLoadMessageCallCenter,
      isLoadSend,
      message_target,
      const DeepCollectionEquality().hash(_messages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CallcenterStateImplCopyWith<_$CallcenterStateImpl> get copyWith =>
      __$$CallcenterStateImplCopyWithImpl<_$CallcenterStateImpl>(
          this, _$identity);
}

abstract class _CallcenterState implements CallcenterState {
  const factory _CallcenterState(
      {final TextEditingController? messageText,
      final int? isLoadMessageCallCenter,
      final int? isLoadSend,
      final int? message_target,
      final List<MessageModel>? messages}) = _$CallcenterStateImpl;

  @override
  TextEditingController? get messageText;
  @override
  int? get isLoadMessageCallCenter;
  @override
  int? get isLoadSend;
  @override
  int? get message_target;
  @override
  List<MessageModel>? get messages;
  @override
  @JsonKey(ignore: true)
  _$$CallcenterStateImplCopyWith<_$CallcenterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
