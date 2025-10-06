/// Environment configuration loaded from --dart-define
class Env {
  static const String _baseUrl = String.fromEnvironment("RAG_BASE_URL", defaultValue: "https://api.example.com");

  static const String _apiKey = String.fromEnvironment("RAG_API_KEY");

  static const String _appName = String.fromEnvironment("APP_NAME", defaultValue: "AI Chat (RAG)");

  static String get baseUrl => _baseUrl;
  static String get apiKey => _apiKey;
  static String get appName => _appName;
}
