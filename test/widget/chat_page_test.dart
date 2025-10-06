import "package:ai_chat_rag/features/chat/presentation/pages/chat_page.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  group("ChatPage", () {
    testWidgets("should display empty state when no messages", (tester) async {
      await tester.pumpWidget(const ProviderScope(child: MaterialApp(home: ChatPage())));

      // Wait for the widget to build
      await tester.pump();

      // Check for loading state or empty state
      expect(find.text("Type your message..."), findsOneWidget);
    });

    testWidgets("should display text input and send button", (tester) async {
      await tester.pumpWidget(const ProviderScope(child: MaterialApp(home: ChatPage())));

      expect(find.byType(TextField), findsOneWidget);
      expect(find.byIcon(Icons.send), findsOneWidget);
      expect(find.text("Type your message..."), findsOneWidget);
    });

    testWidgets("should clear text when send button is pressed", (tester) async {
      await tester.pumpWidget(const ProviderScope(child: MaterialApp(home: ChatPage())));

      final textField = find.byType(TextField);
      await tester.enterText(textField, "Test message");
      expect(find.text("Test message"), findsOneWidget);

      await tester.tap(find.byIcon(Icons.send));
      await tester.pump();

      expect(find.text("Test message"), findsNothing);
    });
  });
}
