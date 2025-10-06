/// Application flavor enum for dev/prod environments
enum Flavor { dev, prod }

extension FlavorExtension on Flavor {
  String get name {
    switch (this) {
      case Flavor.dev:
        return "dev";
      case Flavor.prod:
        return "prod";
    }
  }

  String get displayName {
    switch (this) {
      case Flavor.dev:
        return "Development";
      case Flavor.prod:
        return "Production";
    }
  }
}
