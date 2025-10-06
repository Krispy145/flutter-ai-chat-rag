import "package:dio/dio.dart";

import "../models/entities/chat_message.dart";

/// Abstract interface for remote chat data source
abstract class ChatRemoteSource {
  /// Returns a stream of partial tokens for a response to `prompt`
  Stream<String> streamCompletion({required List<ChatMessage> history, required String prompt});
}

/// Mock implementation of ChatRemoteSource for development/testing
class ChatRemoteSourceMock implements ChatRemoteSource {
  @override
  Stream<String> streamCompletion({required List<ChatMessage> history, required String prompt}) async* {
    // Simulate streaming tokens with delays
    const tokens = [
      "Sure",
      ", ",
      "here's ",
      "a ",
      "mock ",
      "answer",
      " to ",
      "your ",
      "question",
      ": ",
      "This ",
      "is ",
      "a ",
      "simulated ",
      "response",
      " from ",
      "the ",
      "AI ",
      "chat ",
      "system",
      ".",
    ];

    for (final token in tokens) {
      await Future<void>.delayed(const Duration(milliseconds: 150));
      yield token;
    }
  }
}

/// HTTP implementation of ChatRemoteSource
class ChatRemoteSourceHttp implements ChatRemoteSource {
  ChatRemoteSourceHttp(this._dio);
  // ignore: unused_field
  final Dio _dio;

  @override
  Stream<String> streamCompletion({required List<ChatMessage> history, required String prompt}) async* {
    // For now, fall back to mock implementation
    // In production, this would implement actual HTTP streaming using _dio
    // Example: final response = await _dio.post('/chat/stream', data: {...});
    yield* ChatRemoteSourceMock().streamCompletion(history: history, prompt: prompt);
  }
}
