# Flutter Ai Chat Rag

Flutter RAG chat with streaming UI (Riverpod + GetIt), connects to Secure AI API.

---

## 📈 Status

- **Status:** scaffolded (Scaffolded)
- **Focus:** Flutter RAG chat with streaming UI (Riverpod + GetIt), connects to Secure AI API.
- **Last updated:** 11/10/2025
- **Target completion:** 25/10/2025

---

## 🔑 Highlights

- **Cross-platform** → Android, iOS, Web support
- **State Management** → Riverpod/GetIt for reactive updates
- **Dependency Injection** → Clean architecture with GetIt
- **Type Safety** → dart_mappable for data modeling
- **Networking** → Dio with interceptors and error handling
- **CI/CD** → GitHub Actions + Shorebird OTA updates
- **Testing** → Unit, widget, and golden tests

---

## 🏗 Architecture Overview

```
lib/
 ├─ core/           # DI, error handling, networking
 ├─ data/           # DTOs, entities, sources, repositories
 ├─ features/       # feature modules (providers, pages, widgets)
 └─ presentation/   # app shell, router, theme
```

**Patterns used:**

- **Repository pattern** → clean separation between UI and data
- **Riverpod/GetIt** → reactive state management and dependency injection
- **dart_mappable** → type-safe data modeling
- **Dio** → HTTP client with interceptors and error handling

---

## 📱 What It Demonstrates

- Cross-platform mobile app development with Flutter
- Clean architecture patterns and state management
- API integration and data persistence
- Modern Flutter development practices and tooling

---

## 🚀 Getting Started

```bash
git clone https://github.com/Krispy145/flutter-ai-chat-rag.git
cd flutter-ai-chat-rag
flutter pub get
```

**Run (Dev):**
```bash
flutter run --flavor dev
```

**Run (Prod):**
```bash
flutter run --flavor prod
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
- Widget → UI components and interactions
- Golden → visual regression tests

---

## 🔒 Security & Next Steps

- Follow security best practices for the technology stack
- Implement proper authentication and authorization
- Add comprehensive error handling and validation
- Set up monitoring and logging

---

## 🗓 Roadmap

| Milestone                    | Category              | Target Date | Status     |
| ---------------------------- | --------------------- | ----------- | ---------- |
| Scaffold repo | Flutter App & Packages | 06/10/2025 | ✅ Done |
| Streaming RAG UI | Flutter App & Packages | 12/10/2025 | ⏳ In Progress |
| Connect to Secure AI API | Flutter App & Packages | 16/10/2025 | ⏳ In Progress |
| Integrate Flutter IAM | Flutter App & Packages | 20/10/2025 | ⏳ In Progress |
| Web Demo Deployment | Flutter App & Packages | 25/10/2025 | ⏳ In Progress |


---

## 📄 License

MIT © Krispy145