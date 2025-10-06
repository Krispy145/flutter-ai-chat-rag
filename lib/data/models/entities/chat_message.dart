import "package:dart_mappable/dart_mappable.dart";

part "chat_message.mapper.dart";

/// Chat message entity
@MappableClass()
class ChatMessage with ChatMessageMappable {
  const ChatMessage({required this.id, required this.role, required this.content, required this.createdAt});
  final String id;
  final String role; // "user" | "assistant" | "system"
  final String content;
  final DateTime createdAt;

  @override
  String toString() {
    return "ChatMessage(id: $id, role: $role, content: $content, createdAt: $createdAt)";
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ChatMessage && other.id == id && other.role == role && other.content == content && other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^ role.hashCode ^ content.hashCode ^ createdAt.hashCode;
  }
}
