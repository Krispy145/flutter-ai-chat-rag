import "../models/entities/chat_message.dart";

/// Abstract interface for chat repository
abstract class ChatRepository {
  /// Send a message and stream the response tokens
  /// Returns a stream of (updated history, current token) tuples
  Stream<(List<ChatMessage> updatedHistory, String token)> sendAndStream(String userText);
}
