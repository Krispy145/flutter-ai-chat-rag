import "package:dio/dio.dart";
import "package:get_it/get_it.dart";

import "../../data/repositories/chat_repository.dart";
import "../../data/repositories/chat_repository_impl.dart";
import "../../data/sources/chat_local_source.dart";
import "../../data/sources/chat_remote_source.dart";
import "../../presentation/router/router.dart";
import "../config/flavor.dart";
import "../network/http_client.dart";

/// Global GetIt instance
final getIt = GetIt.instance;

/// Configures all dependencies for the application
Future<void> configureDependencies(Flavor flavor) async {
  // Network
  final dio = HttpClientFactory.create();
  getIt.registerLazySingleton<Dio>(() => dio);

  // Data sources
  getIt.registerLazySingleton<ChatRemoteSource>(() => ChatRemoteSourceHttp(getIt<Dio>()));
  getIt.registerLazySingleton<ChatLocalSource>(ChatLocalSourceMemory.new);

  // Repository
  getIt.registerLazySingleton<ChatRepository>(() => ChatRepositoryImpl(getIt<ChatRemoteSource>(), getIt<ChatLocalSource>()));

  // Router
  getIt.registerLazySingleton<AppRouter>(AppRouter.new);
}

/// Extension for easy access to router
extension AppRouterExtension on GetIt {
  AppRouter get router => get<AppRouter>();
}
