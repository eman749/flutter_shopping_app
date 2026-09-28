import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/app_localizations.dart';
import 'state/locale_notifier.dart';
import 'theme/app_theme.dart';
import 'screens/welcome_screen.dart';

/// Root Application Widget configured with Localization and Theme.
class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: localeNotifier,
      builder: (context, _) {
        return MaterialApp(
          title: 'ShopEase',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          locale: localeNotifier.locale,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'), // English
            Locale('ar'), // Arabic
          ],
          home: const WelcomeScreen(),
        );
      },
    );
  }
}
