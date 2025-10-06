import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "core/config/flavor.dart";
import "core/di/di.dart";
import "presentation/app.dart";

/// Bootstrap function to initialize the app
Future<void> bootstrap(Flavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();

  // Configure dependencies
  await configureDependencies(flavor);

  // Run the app with ProviderScope
  runApp(const ProviderScope(child: App()));
}
