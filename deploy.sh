#!/bin/bash

# Sara Baby Landing Page Deployment Script
# This script builds and deploys the Flutter web app to Firebase Hosting

set -e  # Exit on any error

echo "🚀 Starting deployment process..."

# Check if Flutter is installed
if ! command -v flutter &> /dev/null; then
    echo "❌ Flutter is not installed or not in PATH"
    exit 1
fi

# Check if Firebase CLI is installed
if ! command -v firebase &> /dev/null; then
    echo "❌ Firebase CLI is not installed or not in PATH"
    echo "Install it with: npm install -g firebase-tools"
    exit 1
fi

# Check if we're in the right directory
if [ ! -f "pubspec.yaml" ]; then
    echo "❌ pubspec.yaml not found. Are you in the Flutter project root?"
    exit 1
fi

# Clean previous build
echo "🧹 Cleaning previous build..."
flutter clean

# Get dependencies
echo "📦 Getting dependencies..."
flutter pub get

# Generate localization files
echo "🌍 Generating localization files..."
flutter gen-l10n

# Build for web
echo "🔨 Building for web..."
flutter build web --release --web-renderer html

# Check if build was successful
if [ ! -d "build/web" ]; then
    echo "❌ Build failed - build/web directory not found"
    exit 1
fi

echo "✅ Build completed successfully!"

# Deploy to Firebase
echo "🚀 Deploying to Firebase..."
firebase deploy --only hosting

echo "🎉 Deployment completed successfully!"
echo "🌐 Your app should be available at your Firebase hosting URL"

# Optional: Open the deployed site
read -p "Would you like to open the deployed site? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    firebase hosting:channel:open live
fi
