import "package:flutter_riverpod/flutter_riverpod.dart";
import "../../../../core/di/di.dart";
import "../../../../data/repositories/chat_repository.dart";

/// Provider for ChatRepository
final chatRepositoryProvider = Provider<ChatRepository>((ref) {
  return getIt<ChatRepository>();
});
