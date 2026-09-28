import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../state/locale_notifier.dart';
import '../widgets/custom_button.dart';
import 'signup_screen.dart';
import 'signin_screen.dart';

/// Feature 1: Aesthetic Welcome Screen (Static Intro Widget)
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    final title = l10n?.appTitle ?? 'Flutter Shopping App';
    final welcomeTitle = l10n?.welcomeTitle ?? 'Discover Trendy Shopping';
    final welcomeSubtitle = l10n?.welcomeSubtitle ??
        'Explore thousands of products with unbeatable prices, smooth experience, and premium quality.';
    final signUpText = l10n?.signUp ?? 'Sign-up';
    final signInText = l10n?.signIn ?? 'Sign-in';
    final localBadgeText = l10n?.localBadge ?? 'Local Asset';
    final onlineBadgeText = l10n?.onlineBadge ?? 'Online Image';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            fontFamily: 'Suwannaphum',
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF4F46E5),
          ),
        ),
        actions: [
          // Language Switcher Action
          TextButton.icon(
            onPressed: () {
              localeNotifier.toggleLocale();
            },
            icon: const Icon(Icons.language, size: 20),
            label: Text(
              localeNotifier.isArabic ? 'English' : 'العربية',
              style: const TextStyle(
                fontFamily: 'Suwannaphum',
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Title with custom font size, bold, colored (Requirement)
                Text(
                  welcomeTitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Suwannaphum',
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF1E1B4B),
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 12),

                // Subtitle
                Text(
                  welcomeSubtitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Suwannaphum',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF64748B),
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 28),

                // Two images in a row (1 local image + 1 online image) (Requirement)
                Row(
                  children: [
                    // Image 1: Local Image
                    Expanded(
                      child: Container(
                        height: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.08),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.asset(
                                'assets/images/welcome.jpg',
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) => Container(
                                  color: theme.colorScheme.primary.withValues(alpha: 0.1),
                                  child: const Icon(Icons.image, size: 40, color: Colors.grey),
                                ),
                              ),
                              Positioned(
                                bottom: 8,
                                left: 8,
                                right: 8,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withValues(alpha: 0.65),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    localBadgeText,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontFamily: 'Suwannaphum',
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),

                    // Image 2: Online Image
                    Expanded(
                      child: Container(
                        height: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.08),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.network(
                                'https://images.unsplash.com/photo-1472851294608-062f824d29cc?w=600&auto=format&fit=crop&q=80',
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) => Container(
                                  color: theme.colorScheme.secondary.withValues(alpha: 0.1),
                                  child: const Icon(Icons.cloud_off, size: 40, color: Colors.grey),
                                ),
                                loadingBuilder: (context, child, progress) {
                                  if (progress == null) return child;
                                  return Container(
                                    color: Colors.grey[200],
                                    child: const Center(
                                      child: CircularProgressIndicator(strokeWidth: 2),
                                    ),
                                  );
                                },
                              ),
                              Positioned(
                                bottom: 8,
                                left: 8,
                                right: 8,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withValues(alpha: 0.65),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    onlineBadgeText,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontFamily: 'Suwannaphum',
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 36),

                // Button 1: Sign-up (Requirement)
                CustomButton(
                  text: signUpText,
                  icon: Icons.person_add_rounded,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SignUpScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 14),

                // Button 2: Sign-in (Requirement)
                CustomButton(
                  text: signInText,
                  isOutlined: true,
                  icon: Icons.login_rounded,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SignInScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
