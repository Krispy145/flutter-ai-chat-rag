import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "../providers/message_list_provider.dart";
import "../providers/rag_query_controller.dart";
import "../widgets/chat_bubble.dart";
import "../widgets/typing_indicator.dart";

/// Main chat page with message list and input field
@RoutePage()
class ChatPage extends ConsumerStatefulWidget {
  const ChatPage({super.key});

  @override
  ConsumerState<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
      }
    });
  }

  void _sendMessage() {
    final text = _textController.text.trim();
    if (text.isEmpty) return;

    _textController.clear();
    ref.read(ragQueryProvider.notifier).send(text, ref);
    _scrollToBottom();
  }

  @override
  Widget build(BuildContext context) {
    final messagesAsync = ref.watch(messageListProvider);
    final queryAsync = ref.watch(ragQueryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("AI Chat (RAG)"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              ref.read(messageListProvider.notifier).clear();
            },
            icon: const Icon(Icons.clear_all),
            tooltip: "Clear chat",
          ),
        ],
      ),
      body: Column(
        children: [
          // Messages list
          Expanded(
            child: messagesAsync.when(
              data: (messages) {
                if (messages.isEmpty) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.chat_bubble_outline, size: 64, color: Colors.grey),
                        SizedBox(height: 16),
                        Text("Start a conversation with AI", style: TextStyle(fontSize: 18, color: Colors.grey)),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  controller: _scrollController,
                  itemCount: messages.length + (queryAsync.isLoading ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index < messages.length) {
                      return ChatBubble(message: messages[index]);
                    } else {
                      return const TypingIndicator();
                    }
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline, size: 64, color: Colors.red),
                    const SizedBox(height: 16),
                    Text(
                      "Error loading messages: $error",
                      style: const TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        ref.invalidate(messageListProvider);
                      },
                      child: const Text("Retry"),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Input field
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              border: Border(top: BorderSide(color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2))),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      hintText: "Type your message...",
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(24))),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    maxLines: null,
                    textCapitalization: TextCapitalization.sentences,
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                const SizedBox(width: 8),
                FloatingActionButton.small(
                  onPressed: queryAsync.isLoading ? null : _sendMessage,
                  child: queryAsync.isLoading ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2)) : const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
