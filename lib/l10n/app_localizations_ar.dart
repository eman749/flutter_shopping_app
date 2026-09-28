// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'تطبيق التسوق الذكي';

  @override
  String get welcomeTitle => 'اكتشف متعة التسوق العصري';

  @override
  String get welcomeSubtitle =>
      'استكشف آلاف المنتجات المميزة بأفضل الأسعار وأعلى جودة وتجربة فريدة.';

  @override
  String get signUp => 'إنشاء حساب';

  @override
  String get signIn => 'تسجيل الدخول';

  @override
  String get alreadyHaveAccount => 'لديك حساب بالفعل؟ تسجيل الدخول';

  @override
  String get dontHaveAccount => 'ليس لديك حساب؟ إنشاء حساب جديد';

  @override
  String get fullNameLabel => 'الاسم الكامل';

  @override
  String get fullNameHint => 'مثال: Ahmed Ali';

  @override
  String get fullNameRequired => 'الاسم الكامل مطلوب';

  @override
  String get fullNameCapitalError =>
      'يجب أن يبدأ الحرف الأول بحرف كبير (Uppercase)';

  @override
  String get emailLabel => 'البريد الإلكتروني';

  @override
  String get emailHint => 'example@domain.com';

  @override
  String get emailRequired => 'البريد الإلكتروني مطلوب';

  @override
  String get emailInvalidError => 'يجب أن يحتوي البريد على علامة @';

  @override
  String get passwordLabel => 'كلمة المرور';

  @override
  String get passwordHint => 'أدخل كلمة المرور';

  @override
  String get passwordRequired => 'كلمة المرور مطلوبة';

  @override
  String get passwordLengthError => 'يجب ألا تقل كلمة المرور عن 6 أحرف';

  @override
  String get confirmPasswordLabel => 'تأكيد كلمة المرور';

  @override
  String get confirmPasswordHint => 'أعد إدخال كلمة المرور';

  @override
  String get confirmPasswordRequired => 'يرجى تأكيد كلمة المرور';

  @override
  String get passwordMismatchError => 'يجب أن تتطابق كلمة المرور';

  @override
  String get accountCreatedSuccess => 'تم إنشاء الحساب بنجاح';

  @override
  String get accountSignInSuccess => 'تم تسجيل الدخول بنجاح';

  @override
  String get dialogCloseButton => 'إغلاق';

  @override
  String get ourProducts => 'منتجاتنا';

  @override
  String get featuredProducts => 'مجموعات مميزة';

  @override
  String get hotOffers => 'العروض الساخنة';

  @override
  String get itemAddedToCart => 'تمت إضافة العنصر إلى السلة';

  @override
  String get specialDiscount => 'خصم مميز';

  @override
  String get off => 'خصم';

  @override
  String get buyNow => 'اشتري الآن';

  @override
  String get currency => 'ج.م';

  @override
  String get localBadge => 'صورة محلية';

  @override
  String get onlineBadge => 'صورة أونلاين';
}
