import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import '../widgets/success_dialog.dart';
import '../utils/page_transitions.dart';
import 'home_screen.dart';
import 'signup_screen.dart';

/// Feature 2-B: Sign-In Screen with email and password validations.
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      final l10n = AppLocalizations.of(context);
      final successMsg = l10n?.accountSignInSuccess ?? 'Account sign-in successfully';

      SuccessDialog.show(
        context: context,
        message: successMsg,
        onClose: () {
          // Feature 3: Smooth Animated Navigation to HomeScreen
          Navigator.pushAndRemoveUntil(
            context,
            FadePageRoute(page: const HomeScreen()),
            (route) => false,
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    final titleText = l10n?.signIn ?? 'Sign-in';
    final dontHaveAccountText = l10n?.dontHaveAccount ?? "Don't have an account? Sign Up";

    return Scaffold(
      appBar: AppBar(
        title: Text(
          titleText,
          style: const TextStyle(
            fontFamily: 'Suwannaphum',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withValues(alpha: 0.08),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.lock_open_rounded,
                      size: 48,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // Email field: Must include @
                CustomTextField(
                  controller: _emailController,
                  label: l10n?.emailLabel ?? 'Email',
                  hint: l10n?.emailHint ?? 'example@domain.com',
                  prefixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return l10n?.emailRequired ?? 'Email is required';
                    }
                    if (!value.contains('@')) {
                      return l10n?.emailInvalidError ?? 'Email must include @';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 18),

                // Password field: At least 6 characters
                CustomTextField(
                  controller: _passwordController,
                  label: l10n?.passwordLabel ?? 'Password',
                  hint: l10n?.passwordHint ?? 'At least 6 characters',
                  prefixIcon: Icons.lock_outline,
                  isPassword: true,
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return l10n?.passwordRequired ?? 'Password is required';
                    }
                    if (value.length < 6) {
                      return l10n?.passwordLengthError ?? 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32),

                // Sign-in submit button
                CustomButton(
                  text: titleText,
                  icon: Icons.login_rounded,
                  onPressed: _submitForm,
                ),
                const SizedBox(height: 16),

                // Switch to Sign Up
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SignUpScreen(),
                        ),
                      );
                    },
                    child: Text(
                      dontHaveAccountText,
                      style: const TextStyle(
                        fontFamily: 'Suwannaphum',
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
    );
  }
}
