import "package:ai_chat_rag/features/chat/presentation/pages/chat_page.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  testWidgets("Chat page smoke test", (tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: MaterialApp(home: ChatPage())));

    // Verify that the chat page loads
    expect(find.text("AI Chat (RAG)"), findsOneWidget);
    expect(find.text("Type your message..."), findsOneWidget);
  });
}
