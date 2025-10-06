import "dart:async";

import "../models/entities/chat_message.dart";
import "../sources/chat_local_source.dart";
import "../sources/chat_remote_source.dart";
import "chat_repository.dart";

/// Implementation of ChatRepository
class ChatRepositoryImpl implements ChatRepository {
  ChatRepositoryImpl(this._remote, this._local);
  final ChatRemoteSource _remote;
  final ChatLocalSource _local;

  @override
  Stream<(List<ChatMessage>, String)> sendAndStream(String userText) async* {
    // Create user message
    final userMessage = ChatMessage(id: DateTime.now().millisecondsSinceEpoch.toString(), role: "user", content: userText, createdAt: DateTime.now());

    // Add user message to local storage
    _local.addMessage(userMessage);

    // Create assistant message placeholder
    final assistantId = "assistant-${DateTime.now().millisecondsSinceEpoch}";
    final assistantMessage = ChatMessage(id: assistantId, role: "assistant", content: "", createdAt: DateTime.now());

    // Add empty assistant message to local storage
    _local.addMessage(assistantMessage);

    // Stream tokens from remote source
    final buffer = StringBuffer();
    await for (final token in _remote.streamCompletion(history: _local.getHistory(), prompt: userText)) {
      buffer.write(token);

      // Update the assistant message content
      final updatedAssistantMessage = ChatMessage(id: assistantId, role: "assistant", content: buffer.toString(), createdAt: assistantMessage.createdAt);

      // Replace the last message (assistant) with updated content
      final history = _local.getHistory();
      final updatedHistory = history.isEmpty ? [updatedAssistantMessage] : [...history.take(history.length - 1), updatedAssistantMessage];

      // Update local storage
      _local.clear();
      for (final msg in updatedHistory) {
        _local.addMessage(msg);
      }

      // Yield updated history and current token
      yield (updatedHistory, token);
    }
  }
}
