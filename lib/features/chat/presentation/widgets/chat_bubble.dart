import "package:flutter/material.dart";

import "../../../../data/models/entities/chat_message.dart";

/// Widget for displaying individual chat messages
class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.message});
  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    final isUser = message.role == "user";
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: Row(
        mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isUser) ...[
            CircleAvatar(
              radius: 16,
              backgroundColor: theme.colorScheme.primary,
              child: Icon(Icons.smart_toy, size: 16, color: theme.colorScheme.onPrimary),
            ),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Container(
              constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: isUser ? theme.colorScheme.primary : theme.colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(
                  20,
                ).copyWith(bottomLeft: isUser ? const Radius.circular(20) : const Radius.circular(4), bottomRight: isUser ? const Radius.circular(4) : const Radius.circular(20)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(message.content, style: theme.textTheme.bodyMedium?.copyWith(color: isUser ? theme.colorScheme.onPrimary : theme.colorScheme.onSurface)),
                  const SizedBox(height: 4),
                  Text(
                    _formatTime(message.createdAt),
                    style: theme.textTheme.labelSmall?.copyWith(color: isUser ? theme.colorScheme.onPrimary.withValues(alpha: 0.7) : theme.colorScheme.onSurface.withValues(alpha: 0.7)),
                  ),
                ],
              ),
            ),
          ),
          if (isUser) ...[
            const SizedBox(width: 8),
            CircleAvatar(
              radius: 16,
              backgroundColor: theme.colorScheme.secondary,
              child: Icon(Icons.person, size: 16, color: theme.colorScheme.onSecondary),
            ),
          ],
        ],
      ),
    );
  }

  String _formatTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes < 1) {
      return "now";
    } else if (difference.inHours < 1) {
      return "${difference.inMinutes}m";
    } else if (difference.inDays < 1) {
      return "${difference.inHours}h";
    } else {
      return "${dateTime.day}/${dateTime.month}";
    }
  }
}
