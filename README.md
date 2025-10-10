# AI Chat (RAG)

Flutter RAG chat with streaming UI (Riverpod + GetIt), connects to Secure AI API.

---

## 📈 Status

- **Status:** scaffolded (core app complete, awaiting backend integration)
- **Focus:** RAG chat pipeline, streaming UI, and secure API integration
- **Last updated:** 06/10/2025
- **Next milestone:** Connect to Secure AI API backend

---

## 🔑 Highlights

- **RAG Implementation:** Embedding + vector retrieval → LLM responses (streaming UI)
- **State Management:** Riverpod (AsyncNotifiers for tokenized responses)
- **Dependency Injection:** GetIt (feature-first DI graph for services and repositories)
- **Data Models:** dart_mappable (type-safe DTOs + entities)
- **Networking:** Dio with interceptors (auth, retries, logging)
- **Flavors:** Dev & Prod with `--dart-define` configs
- **CI/CD:** GitHub Actions + Shorebird OTA channels
- **Testing:** Unit, widget, and golden tests for maintainability

---

## 📱 About the App

- **App name:** AI Chat (RAG)
- **Package:** `com.krispy.ai_chat_rag`
- **Platforms:** Android, iOS, Web
- **Primary color:** `#2D70FF`

Currently connected to a **mock streaming service**, easily swappable with a real RAG backend (via `ChatRemoteSource`).

---

## 🏗 Architecture Overview

```
lib/
 ├─ core/           # env, DI, error, networking
 ├─ data/           # DTOs, entities, sources, repositories
 ├─ features/chat/  # chat feature (providers, pages, widgets)
 └─ presentation/   # app shell, router, theme
```

- **Repository pattern** → clean separation between UI and data
- **Riverpod** → reactive, stream-based updates
- **GetIt** → flavor-based DI
- **dart_mappable** → type-safe data modeling

---

## 🚀 Getting Started

```bash
git clone https://github.com/Krispy145/ai_chat_rag.git
cd ai_chat_rag
flutter pub get
```

**Run (Dev):**

```bash
flutter run -t lib/main_dev.dart --flavor dev   --dart-define=RAG_BASE_URL=https://api-dev.example.com   --dart-define=RAG_API_KEY=your-key
```

**Run (Prod):**

```bash
flutter run -t lib/main_prod.dart --flavor prod   --dart-define=RAG_BASE_URL=https://api.example.com   --dart-define=RAG_API_KEY=your-key
```

**Codegen:**

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

---

## 🧪 Testing

```bash
flutter test --coverage
```

- Unit → repositories, services
- Widget → chat UI, message list
- Golden → visual regression tests

---

## 🔒 Security & Next Steps

- Integrate **Secure AI API** for backend inference
- Implement **JWT interceptor** using `flutter_iam`
- Add **conversation encryption** (AES) for local storage
- Rate limiting & token validation testing

---

## 🗓 Roadmap

| Milestone                | Target Date | Status         |
| ------------------------ | ----------- | -------------- |
| Scaffold repo            | 06/10/2025  | ✅ Done        |
| Streaming RAG UI         | 10/10/2025  | ⏳ In Progress |
| Connect to Secure AI API | 15/10/2025  | ⏳ Planned     |
| Integrate Flutter IAM    | 20/10/2025  | ⏳ Planned     |
| Web Demo Deployment      | 25/10/2025  | ⏳ Planned     |

---

## 📦 CI/CD

- **GitHub Actions** → analyze, test, and build web + APK
- **Shorebird** → hotfix releases per flavor (Dev/Prod)

---

## 📄 License

MIT © Krispy145
