// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'chat_message_dto.dart';

class ChatMessageDtoMapper extends ClassMapperBase<ChatMessageDto> {
  ChatMessageDtoMapper._();

  static ChatMessageDtoMapper? _instance;
  static ChatMessageDtoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChatMessageDtoMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ChatMessageDto';

  static String _$id(ChatMessageDto v) => v.id;
  static const Field<ChatMessageDto, String> _f$id = Field('id', _$id);
  static String _$role(ChatMessageDto v) => v.role;
  static const Field<ChatMessageDto, String> _f$role = Field('role', _$role);
  static String _$content(ChatMessageDto v) => v.content;
  static const Field<ChatMessageDto, String> _f$content = Field('content', _$content);
  static String _$createdAt(ChatMessageDto v) => v.createdAt;
  static const Field<ChatMessageDto, String> _f$createdAt = Field('createdAt', _$createdAt);

  @override
  final MappableFields<ChatMessageDto> fields = const {#id: _f$id, #role: _f$role, #content: _f$content, #createdAt: _f$createdAt};

  static ChatMessageDto _instantiate(DecodingData data) {
    return ChatMessageDto(id: data.dec(_f$id), role: data.dec(_f$role), content: data.dec(_f$content), createdAt: data.dec(_f$createdAt));
  }

  @override
  final Function instantiate = _instantiate;

  static ChatMessageDto fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ChatMessageDto>(map);
  }

  static ChatMessageDto fromJson(String json) {
    return ensureInitialized().decodeJson<ChatMessageDto>(json);
  }
}

mixin ChatMessageDtoMappable {
  String toJson() {
    return ChatMessageDtoMapper.ensureInitialized().encodeJson<ChatMessageDto>(this as ChatMessageDto);
  }

  Map<String, dynamic> toMap() {
    return ChatMessageDtoMapper.ensureInitialized().encodeMap<ChatMessageDto>(this as ChatMessageDto);
  }

  ChatMessageDtoCopyWith<ChatMessageDto, ChatMessageDto, ChatMessageDto> get copyWith => _ChatMessageDtoCopyWithImpl(this as ChatMessageDto, $identity, $identity);
  @override
  String toString() {
    return ChatMessageDtoMapper.ensureInitialized().stringifyValue(this as ChatMessageDto);
  }

  @override
  bool operator ==(Object other) {
    return ChatMessageDtoMapper.ensureInitialized().equalsValue(this as ChatMessageDto, other);
  }

  @override
  int get hashCode {
    return ChatMessageDtoMapper.ensureInitialized().hashValue(this as ChatMessageDto);
  }
}

extension ChatMessageDtoValueCopy<$R, $Out> on ObjectCopyWith<$R, ChatMessageDto, $Out> {
  ChatMessageDtoCopyWith<$R, ChatMessageDto, $Out> get $asChatMessageDto => $base.as((v, t, t2) => _ChatMessageDtoCopyWithImpl(v, t, t2));
}

abstract class ChatMessageDtoCopyWith<$R, $In extends ChatMessageDto, $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id, String? role, String? content, String? createdAt});
  ChatMessageDtoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ChatMessageDtoCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, ChatMessageDto, $Out> implements ChatMessageDtoCopyWith<$R, ChatMessageDto, $Out> {
  _ChatMessageDtoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ChatMessageDto> $mapper = ChatMessageDtoMapper.ensureInitialized();
  @override
  $R call({String? id, String? role, String? content, String? createdAt}) =>
      $apply(FieldCopyWithData({if (id != null) #id: id, if (role != null) #role: role, if (content != null) #content: content, if (createdAt != null) #createdAt: createdAt}));
  @override
  ChatMessageDto $make(CopyWithData data) => ChatMessageDto(
    id: data.get(#id, or: $value.id),
    role: data.get(#role, or: $value.role),
    content: data.get(#content, or: $value.content),
    createdAt: data.get(#createdAt, or: $value.createdAt),
  );

  @override
  ChatMessageDtoCopyWith<$R2, ChatMessageDto, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) => _ChatMessageDtoCopyWithImpl($value, $cast, t);
}
