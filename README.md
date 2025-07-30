# Purse Eka 💰

A simple, user-friendly expense tracking app designed to help elderly users manage their personal finances with ease.

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)

## 📖 About

**Purse Eka** (meaning "The Purse AKA Wallet" in Sinhala) was born from a personal need to help my parents better manage their daily expenses and financial tracking. Many elderly users find complex financial apps overwhelming, so this app focuses on simplicity, clarity, and ease of use.

### 🎯 **The Problem**

- Traditional expense tracking apps are often too complex for elderly users
- Language barriers prevent non-English speakers from using most financial apps
- Small text and cluttered interfaces make it difficult for seniors to navigate
- Complex features overwhelm users who just want basic expense tracking

### 💡 **The Solution**

Purse Eka provides a clean, intuitive interface with:

- **Large, clear text and buttons** for better readability
- **Bilingual support** (English & Sinhala) for Sri Lankan users
- **Simple workflow** - just add money, track expenses, view reports
- **Visual category icons** for easy recognition
- **Professional color scheme** that's easy on the eyes

## ✨ Features

### 🏠 **Core Functionality**

- **Wallet Balance Management** - Add money and track your available balance
- **Expense Tracking** - Record daily expenses with categories
- **Category System** - Organize expenses into Food, Transport, Shopping, Bills, Entertainment, Education, and Other
- **Daily Reports** - View today's spending with category breakdowns
- **Monthly Reports** - Comprehensive monthly spending analysis
- **Persistent Storage** - All data saved locally on your device

### 🌍 **Accessibility**

- **Bilingual Interface** - Full support for English and Sinhala languages
- **Senior-Friendly Design** - Large fonts, clear icons, and intuitive navigation
- **Visual Categories** - Color-coded expense categories with meaningful icons
- **Simple Workflow** - Minimal steps to complete any action

### 🎨 **Modern Design**

- **Professional Color Palette** - Carefully chosen colors for trust and clarity
- **Material Design 3** - Modern Android design principles
- **Gradient Cards** - Beautiful visual elements without complexity
- **Consistent Typography** - Easy-to-read fonts throughout the app

## 📱 Screenshots

_Screenshots will be added soon_

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.7.2 or higher)
- Dart SDK
- Android Studio / VS Code
- Android device or emulator

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/yourusername/purse-eka.git
   cd purse-eka
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## 📦 Dependencies

```yaml
dependencies:
  flutter: sdk: flutter
  shared_preferences: ^2.2.2  # Local data storage
  intl: ^0.18.1               # Date formatting and localization
  cupertino_icons: ^1.0.8     # iOS-style icons

dev_dependencies:
  flutter_test: sdk: flutter
  flutter_lints: ^5.0.0       # Linting rules
  flutter_launcher_icons: ^0.13.1  # App icon generation
```

## 🏗️ Project Structure

```
lib/
├── main.dart              # Main app entry point with all components
├── models/
│   └── Expense class      # Expense data model (in main.dart)
├── helpers/
│   └── LocalizationHelper # Language support (in main.dart)
├── screens/
│   ├── LanguageSelectionScreen # Language selection
│   └── HomeScreen         # Main expense tracking interface
└── utils/
    └── AppColors         # App color palette (in main.dart)
```

## 🌐 Localization

The app supports two languages:

- **English** - Primary language
- **Sinhala (සිංහල)** - For Sri Lankan users

Adding new languages is straightforward by extending the `LocalizationHelper` class.

## 🎨 Design Philosophy

### Color Palette

- **Primary Blue** (#1E3A8A) - Trust and stability
- **Secondary Teal** (#0D9488) - Growth and balance
- **Success Green** (#059669) - Positive actions
- **Warning Orange** (#EA580C) - Expenses and alerts
- **Error Red** (#DC2626) - Critical actions

### Typography

- **Large, readable fonts** (16-36px)
- **High contrast** text for accessibility
- **Consistent spacing** for visual harmony

## 📊 Category System

| Category      | Icon | Color  | Use Case                   |
| ------------- | ---- | ------ | -------------------------- |
| Food          | 🍽️   | Orange | Meals, groceries, dining   |
| Transport     | 🚗   | Blue   | Bus, taxi, fuel, parking   |
| Shopping      | 🛍️   | Purple | Clothes, household items   |
| Bills         | 📋   | Red    | Utilities, phone, internet |
| Entertainment | 🎬   | Pink   | Movies, games, hobbies     |
| Education     | 🎓   | Green  | Books, courses, training   |
| Other         | 📂   | Gray   | Miscellaneous expenses     |

## 🤝 Contributing

This project was created to help my family, but I welcome contributions from anyone who wants to help make financial management easier for elderly users.

### How to Contribute

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Areas for Contribution

- Additional language support
- Accessibility improvements
- Data export features
- Budget planning tools
- UI/UX enhancements

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 💝 Acknowledgments

- **My parents** - The inspiration behind this app
- **Flutter community** - For excellent documentation and support
- **Material Design** - For design guidelines and principles

## 📞 Contact

Created with ❤️ for family by [Your Name]

- **GitHub**: [@vihangawijerathna](https://github.com/vihangawijerathna)
- **Email**: vihangawijerathna1@gmail.com

---

_"Technology should serve people, not complicate their lives. This app is my small contribution to making financial management accessible to everyone, regardless of age or technical expertise."_
