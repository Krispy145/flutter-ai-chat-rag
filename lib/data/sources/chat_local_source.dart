import "../models/entities/chat_message.dart";

/// Abstract interface for local chat data source
abstract class ChatLocalSource {
  /// Get the current chat history
  List<ChatMessage> getHistory();

  /// Add a message to the history
  void addMessage(ChatMessage message);

  /// Clear the chat history
  void clear();
}

/// In-memory implementation of ChatLocalSource
class ChatLocalSourceMemory implements ChatLocalSource {
  final List<ChatMessage> _messages = [];

  @override
  List<ChatMessage> getHistory() => List.unmodifiable(_messages);

  @override
  void addMessage(ChatMessage message) => _messages.add(message);

  @override
  void clear() => _messages.clear();
}
