import "dart:async";

import "package:flutter_riverpod/flutter_riverpod.dart";

import "chat_repository_provider.dart";
import "message_list_provider.dart";

/// Controller for handling RAG queries and streaming responses
class RagQueryController extends AsyncNotifier<void> {
  StreamSubscription<(List<dynamic>, String)>? _subscription;

  @override
  FutureOr<void> build() {
    // Initial state
  }

  /// Send a message and stream the response
  Future<void> send(String text, WidgetRef ref) async {
    if (text.trim().isEmpty) return;

    state = const AsyncLoading();

    try {
      final repository = ref.read(chatRepositoryProvider);
      final messageController = ref.read(messageListProvider.notifier);

      // Cancel any existing subscription
      _subscription?.cancel();

      // Start streaming
      _subscription = repository
          .sendAndStream(text)
          .listen(
            (tuple) {
              final (updatedHistory, _) = tuple;
              messageController.updateMessages(updatedHistory);
            },
            onDone: () {
              state = const AsyncData(null);
            },
            onError: (Object error, StackTrace stackTrace) {
              state = AsyncError(error, stackTrace);
            },
          );
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    }
  }

  void dispose() {
    _subscription?.cancel();
  }
}

/// Provider for RAG query controller
final ragQueryProvider = AsyncNotifierProvider<RagQueryController, void>(RagQueryController.new);
