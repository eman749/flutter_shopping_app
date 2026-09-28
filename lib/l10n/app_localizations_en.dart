// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Flutter Shopping App';

  @override
  String get welcomeTitle => 'Discover Trendy Shopping';

  @override
  String get welcomeSubtitle =>
      'Explore thousands of products with unbeatable prices, smooth experience, and premium quality.';

  @override
  String get signUp => 'Sign-up';

  @override
  String get signIn => 'Sign-in';

  @override
  String get alreadyHaveAccount => 'Already have an account? Sign In';

  @override
  String get dontHaveAccount => 'Don\'t have an account? Sign Up';

  @override
  String get fullNameLabel => 'Full Name';

  @override
  String get fullNameHint => 'e.g. John Doe';

  @override
  String get fullNameRequired => 'Full Name is required';

  @override
  String get fullNameCapitalError => 'First letter must be uppercase';

  @override
  String get emailLabel => 'Email';

  @override
  String get emailHint => 'example@domain.com';

  @override
  String get emailRequired => 'Email is required';

  @override
  String get emailInvalidError => 'Email must include @';

  @override
  String get passwordLabel => 'Password';

  @override
  String get passwordHint => 'Enter your password';

  @override
  String get passwordRequired => 'Password is required';

  @override
  String get passwordLengthError => 'Password must be at least 6 characters';

  @override
  String get confirmPasswordLabel => 'Confirm Password';

  @override
  String get confirmPasswordHint => 'Re-enter your password';

  @override
  String get confirmPasswordRequired => 'Please confirm your password';

  @override
  String get passwordMismatchError => 'Must match password';

  @override
  String get accountCreatedSuccess => 'Account created successfully';

  @override
  String get accountSignInSuccess => 'Account sign-in successfully';

  @override
  String get dialogCloseButton => 'Close';

  @override
  String get ourProducts => 'Our Products';

  @override
  String get featuredProducts => 'Featured Collections';

  @override
  String get hotOffers => 'Hot Offers';

  @override
  String get itemAddedToCart => 'Item added to the cart';

  @override
  String get specialDiscount => 'Special Discount';

  @override
  String get off => 'OFF';

  @override
  String get buyNow => 'Buy Now';

  @override
  String get currency => '\$';

  @override
  String get localBadge => 'Local Asset';

  @override
  String get onlineBadge => 'Online Image';
}
