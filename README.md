# 🛒 Flutter Shopping App Project

A modern, responsive, and fully localized e-commerce Flutter mobile application built following professional standards, clean architecture, and modular UI widget decomposition.

![Flutter](https://img.shields.io/badge/Flutter-3.47+-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.13+-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Localization](https://img.shields.io/badge/Localization-English%20%26%20Arabic-4F46E5?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-success?style=for-the-badge)

---

## 📌 Project Overview

This project was developed according to the comprehensive **Sprints Flutter Shopping App** project specification. It takes learners through core Dart programming principles, object-oriented concepts, and advanced Flutter UI/UX implementations—ranging from authentication flows and responsive grid systems to custom animations and internationalization (`.arb` / `intl`).

---

## ✨ Features Implemented

### 1. 🎨 Aesthetic Welcome Screen (Static Intro Widget)
- **App Bar**: Clean top bar with application branding and instant one-tap **Language Switcher (AR / EN)**.
- **Dual Image Showcase**: Side-by-side display of **1 local asset image** and **1 online network image** with rounded corners, elevation shadows, and badge tags.
- **Custom Typography**: Configured with the **`Suwannaphum-Regular`** font family, bold weight, custom sizing, and elegant colors.
- **Centered Layout**: Responsive spacing and alignment ensuring balanced aesthetic presentation across various screen dimensions.
- **Navigation Buttons**: Prominent **Sign-Up** (solid) and **Sign-In** (outlined) action buttons leading directly to the authentication flows.

### 2. 🔐 Authentication & Form Validation
- **Feature 2-A: Sign-Up Form**:
  - `Full Name`: Required, validates that the **first letter is uppercase**.
  - `Email`: Required, validates that the email **includes `@`**.
  - `Password`: Required, validates a **minimum length of 6 characters**.
  - `Confirm Password`: Required, validates that it **matches the password**.
  - Valid submission displays an alert dialog: `"Account created successfully"` (or `"تم إنشاء الحساب بنجاح"`).
  - Dialog contains a **"Close"** button that navigates seamlessly to the Shopping Home screen.
- **Feature 2-B: Sign-In Form**:
  - `Email`: Required, validates that it contains `@`.
  - `Password`: Required, validates minimum 6 characters.
  - Valid submission displays an alert dialog: `"Account sign-in successfully"` (or `"تم تسجيل الدخول بنجاح"`).
  - Dialog contains a **"Close"** button that navigates to the Shopping Home screen.

### 3. 🎬 Smooth Transition into the App (Animated Navigation)
- Custom `FadePageRoute` utilizing Flutter's `PageRouteBuilder` and `FadeTransition`.
- Upon successful sign-up or sign-in, the authentication screen fades out while the main shopping screen fades in smoothly.

### 4. 🛍️ Explore the Shopping Home Screen
- **App Bar**: Titled **`"Our Products"`** (or **`"منتجاتنا"`** in Arabic) with language switch and logout buttons.
- **Featured Carousel (`PageView`)**:
  - Horizontal scrollable banner displaying featured promotional deals.
  - Automatic sliding with animated dot indicators.
- **Responsive Products Grid (`GridView`)**:
  - 2 items per row with high-resolution product imagery, title, pricing, and ratings.
  - **Add to Cart Icon**: Tapping the icon displays a floating `SnackBar`: `"Item added to the cart"` (or `"تمت إضافة العنصر إلى السلة"`).
- **"Hot Offers" Section (`ListView.builder`)**:
  - Renders **5 vertically scrollable hot offers**.
  - Implements the required layout using `Expanded` for descriptions paired alongside offer images and voucher tags.

### 5. 🌐 Arabic Language Support & Localization (Bonus)
- Full internationalization support using `.arb` translation files (`app_en.arb` and `app_ar.arb`) and the `intl` package.
- **Zero hardcoded strings** in UI code.
- Uses exact designated Arabic strings:
  - `"منتجاتنا"` instead of `"Our Products"`
  - `"العروض الساخنة"` for `"Hot Offers"`
  - Full Arabic validation errors, dialog messages, and buttons.
- Built-in dynamic locale switcher permitting instant language switching without restarting the app.

---

## 📁 Project Architecture & Folder Structure

Following clean architecture principles, every widget, model, and screen resides in its own distinct file:

```text
flutter_shopping_app/
├── assets/
│   ├── fonts/
│   │   └── Suwannaphum-Regular.ttf      # Custom required font
│   └── images/
│       ├── welcome.jpg                  # Local asset image
│       ├── product_watch.jpg
│       └── product_headphones.jpg
├── lib/
│   ├── l10n/
│   │   ├── app_ar.arb                   # Arabic localization strings
│   │   └── app_en.arb                   # English localization strings
│   ├── models/
│   │   ├── product.dart                 # Product data entity
│   │   └── offer.dart                   # Hot Offer data entity
│   ├── data/
│   │   └── mock_data.dart               # Static mock data repository
│   ├── theme/
│   │   └── app_theme.dart               # Global styling & Suwannaphum font config
│   ├── state/
│   │   └── locale_notifier.dart         # Reactive language state manager
│   ├── utils/
│   │   └── page_transitions.dart        # FadePageRoute animated transitions
│   ├── widgets/
│   │   ├── custom_button.dart           # Reusable styled button
│   │   ├── custom_text_field.dart       # Form text field with validation
│   │   ├── success_dialog.dart          # Success modal dialog
│   │   ├── section_header.dart          # Consistent section title widget
│   │   ├── featured_carousel.dart       # Horizontal PageView carousel
│   │   ├── product_card.dart            # GridView product item
│   │   └── hot_offer_card.dart          # ListView.builder offer item (Expanded)
│   ├── screens/
│   │   ├── welcome_screen.dart          # Intro welcome screen (Feature 1)
│   │   ├── signup_screen.dart           # Sign-up screen (Feature 2-A)
│   │   ├── signin_screen.dart           # Sign-in screen (Feature 2-B)
│   │   └── home_screen.dart             # Main shopping page (Feature 4)
│   ├── app.dart                         # Root MaterialApp configuration
│   └── main.dart                        # Application entry point
├── test/
│   └── widget_test.dart                 # Automated widget smoke tests
├── l10n.yaml                            # Flutter localization generator config
├── pubspec.yaml                         # Project dependencies & assets configuration
└── README.md                            # Documentation & project guide
```

---

## 🚀 Setup & Execution Guide

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (version `3.19.0` or higher)
- [Dart SDK](https://dart.dev/get-dart)
- An Android Emulator, iOS Simulator, or Chrome browser

### Step 1: Clone the Repository
```bash
git clone https://github.com/<YOUR_GITHUB_USERNAME>/flutter_shopping_app.git
cd flutter_shopping_app
```

### Step 2: Install Dependencies & Generate Localizations
```bash
flutter pub get
flutter gen-l10n
```

### Step 3: Run the Application
```bash
# Run on connected device or emulator
flutter run

# Or run on Chrome Web
flutter run -d chrome
```

### Step 4: Run Static Analysis & Tests
```bash
flutter analyze
flutter test
```

---

## 📸 Screenshots & Output Demo

| Welcome Screen (English) | Welcome Screen (Arabic) |
| :---: | :---: |
| <img width="400"  alt="image" src="https://github.com/user-attachments/assets/b54ddc27-ab8b-4f16-b24a-9a91ee8b37cf" />
 |<img width="400"  alt="image" src="https://github.com/user-attachments/assets/6e843147-d3c5-425c-b5b6-2ade9b45cc96" />
 |

| Sign-Up Form & Validation | Sign-In Form |
| :---: | :---: |
| <img width="400"  alt="image" src="https://github.com/user-attachments/assets/bfd88999-6b45-49ed-b661-83f1858bd4d0" />
 | <img width="400" alt="image" src="https://github.com/user-attachments/assets/abfd18b2-0b24-40b6-9f7a-f080440cdad9" />
 |

| Success Dialog | Main Products & Offers Screen |
| :---: | :---: |
| <img width="400" alt="image" src="https://github.com/user-attachments/assets/3b093f6e-c039-427d-ba18-0b54301b8832" />
 | <img width="400"  alt="image" src="https://github.com/user-attachments/assets/98bba988-cb86-48e6-8880-08896ee4f121" />
 |

---

## 🧑‍💻 Author & Submission
- **Project**: Flutter Shopping App
- **Developer**: Eman Tamer
- **Repository**: https://github.com/eman749/flutter_shopping_app
