import "dart:async";

import "package:flutter_riverpod/flutter_riverpod.dart";

import "../../../../core/di/di.dart";
import "../../../../data/models/entities/chat_message.dart";
import "../../../../data/sources/chat_local_source.dart";

/// Controller for managing the list of chat messages
class MessageListController extends AsyncNotifier<List<ChatMessage>> {
  @override
  FutureOr<List<ChatMessage>> build() async {
    return getIt<ChatLocalSource>().getHistory();
  }

  /// Clear all messages
  void clear() {
    getIt<ChatLocalSource>().clear();
    state = const AsyncData([]);
  }

  /// Add a message to the list
  void addMessage(ChatMessage message) {
    getIt<ChatLocalSource>().addMessage(message);
    // Refresh the state
    ref.invalidateSelf();
  }

  /// Update the entire message list
  void updateMessages(List<ChatMessage> messages) {
    getIt<ChatLocalSource>().clear();
    messages.forEach(getIt<ChatLocalSource>().addMessage);
    state = AsyncData(messages);
  }
}

/// Provider for the message list
final messageListProvider = AsyncNotifierProvider<MessageListController, List<ChatMessage>>(MessageListController.new);
