.PHONY: build_runner icon_generate run_staging run_prod clean pub-get build clean-get
build_runner:
	dart run build_runner build --delete-conflicting-outputs
icon_generate:
	dart run flutter_launcher_icons -f flutter_launcher_icons.yaml
run_staging:
	@echo "Launching Boiler Plate (Staging) build..."
	flutter run --flavor staging -t lib/main_staging.dart
run_prod:
	@echo "Launching Boiler Plate (Production) build..."
	flutter run --flavor production -t lib/main_prod.dart

# Target to remove the build directories and clean the cache
clean:
	@echo "🧹 Running flutter clean..."
	flutter clean

# Target to fetch all packages
pub-get:
	@echo "📦 Running flutter pub get..."
	flutter pub get

# Target to compile the Android app (replace 'apk' with 'appbundle' or 'ios' as needed)
build: pub-get
	@echo "⚙️ Running flutter build..."
	flutter build apk

# Target to clean and fetch all packages
clean-get: clean pub-get

