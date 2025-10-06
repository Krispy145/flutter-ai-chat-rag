import "package:ai_chat_rag/data/models/entities/chat_message.dart";
import "package:ai_chat_rag/data/repositories/chat_repository_impl.dart";
import "package:ai_chat_rag/data/sources/chat_local_source.dart";
import "package:ai_chat_rag/data/sources/chat_remote_source.dart";
import "package:flutter_test/flutter_test.dart";
import "package:mocktail/mocktail.dart";

class MockChatRemoteSource extends Mock implements ChatRemoteSource {}

class MockChatLocalSource extends Mock implements ChatLocalSource {}

void main() {
  group("ChatRepositoryImpl", () {
    late ChatRepositoryImpl repository;
    late MockChatRemoteSource mockRemoteSource;
    late MockChatLocalSource mockLocalSource;

    setUpAll(() {
      registerFallbackValue(ChatMessage(id: "test", role: "user", content: "test", createdAt: DateTime.now()));
    });

    setUp(() {
      mockRemoteSource = MockChatRemoteSource();
      mockLocalSource = MockChatLocalSource();
      repository = ChatRepositoryImpl(mockRemoteSource, mockLocalSource);
    });

    test("should stream completion tokens correctly", () async {
      // Arrange
      const userText = "Hello, AI!";
      final tokens = ["Hello", ", ", "how ", "can ", "I ", "help", "?"];

      when(() => mockLocalSource.getHistory()).thenReturn([]);
      when(() => mockLocalSource.addMessage(any())).thenReturn(null);
      when(() => mockLocalSource.clear()).thenReturn(null);

      when(
        () => mockRemoteSource.streamCompletion(
          history: any(named: "history"),
          prompt: any(named: "prompt"),
        ),
      ).thenAnswer((_) => Stream.fromIterable(tokens));

      // Act
      final results = <(List<ChatMessage>, String)>[];
      await for (final result in repository.sendAndStream(userText)) {
        results.add(result);
      }

      // Assert
      expect(results.length, equals(tokens.length));
      verify(() => mockLocalSource.addMessage(any())).called(greaterThan(0));
      verify(
        () => mockRemoteSource.streamCompletion(
          history: any(named: "history"),
          prompt: userText,
        ),
      ).called(1);
    });

    test("should handle empty user text gracefully", () async {
      // Arrange
      const userText = "";

      // Act & Assert
      expect(() => repository.sendAndStream(userText), returnsNormally);
    });
  });
}
