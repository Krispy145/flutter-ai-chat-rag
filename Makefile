# AI Chat (RAG) - Makefile
# Production-grade Flutter project automation

.PHONY: help install clean build test analyze codegen splash flavors

# Default target
help:
	@echo "AI Chat (RAG) - Available commands:"
	@echo "  install     - Install dependencies"
	@echo "  clean       - Clean build artifacts"
	@echo "  build       - Build the application"
	@echo "  test        - Run tests"
	@echo "  analyze     - Run static analysis"
	@echo "  codegen     - Generate code (dart_mappable)"
	@echo "  splash      - Generate native splash screen"
	@echo "  flavors     - Build for different flavors"
	@echo "  dev         - Run development version"
	@echo "  prod        - Run production version"

# Install dependencies
install:
	flutter pub get

# Clean build artifacts
clean:
	flutter clean
	flutter pub get

# Generate code
codegen:
	flutter packages pub run build_runner build --delete-conflicting-outputs

# Generate native splash screen
splash:
	flutter pub run flutter_native_splash:create

# Run static analysis
analyze:
	flutter analyze

# Run tests
test:
	flutter test --coverage

# Build for different platforms
build:
	@echo "Building for all platforms..."
	flutter build apk --release --target-platform android-arm64
	flutter build web --release
	flutter build ios --release --no-codesign

# Build development flavor
build-dev:
	@echo "Building development flavor..."
	flutter build apk --release --flavor dev -t lib/main_dev.dart
	flutter build web --release -t lib/main_dev.dart

# Build production flavor
build-prod:
	@echo "Building production flavor..."
	flutter build apk --release --flavor prod -t lib/main_prod.dart
	flutter build web --release -t lib/main_prod.dart

# Run development version
dev:
	flutter run -t lib/main_dev.dart --flavor dev

# Run production version
prod:
	flutter run -t lib/main_prod.dart --flavor prod

# Shorebird commands
shorebird-dev:
	shorebird release android --flavor dev -t lib/main_dev.dart

shorebird-prod:
	shorebird release android --flavor prod -t lib/main_prod.dart

# Full setup
setup: install codegen splash
	@echo "Setup complete! Run 'make dev' to start development."

# CI pipeline
ci: analyze test build-prod
	@echo "CI pipeline completed successfully."
