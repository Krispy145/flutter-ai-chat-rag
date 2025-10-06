import "package:dart_mappable/dart_mappable.dart";

part "chat_message_dto.mapper.dart";

/// Chat message DTO for API communication
@MappableClass()
class ChatMessageDto with ChatMessageDtoMappable {
  // ISO8601 string

  const ChatMessageDto({required this.id, required this.role, required this.content, required this.createdAt});
  final String id;
  final String role;
  final String content;
  final String createdAt;

  @override
  String toString() {
    return "ChatMessageDto(id: $id, role: $role, content: $content, createdAt: $createdAt)";
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ChatMessageDto && other.id == id && other.role == role && other.content == content && other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^ role.hashCode ^ content.hashCode ^ createdAt.hashCode;
  }
}
