import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "../core/config/env.dart";
import "../core/di/di.dart";
import "theme/app_theme.dart";

/// Main application widget
class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(title: Env.appName, theme: AppTheme.lightTheme, darkTheme: AppTheme.darkTheme, routerConfig: getIt.router.config(), debugShowCheckedModeBanner: false);
  }
}
