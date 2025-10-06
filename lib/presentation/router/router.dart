import "package:auto_route/auto_route.dart";

import "../../features/chat/presentation/pages/chat_page.dart";

part "router.gr.dart";

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [AutoRoute(page: ChatRoute.page, path: "/", initial: true)];
}
