import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import '../widgets/success_dialog.dart';
import '../utils/page_transitions.dart';
import 'home_screen.dart';
import 'signin_screen.dart';

/// Feature 2-A: Sign-Up Screen with comprehensive input validation.
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      final l10n = AppLocalizations.of(context);
      final successMsg = l10n?.accountCreatedSuccess ?? 'Account created successfully';

      SuccessDialog.show(
        context: context,
        message: successMsg,
        onClose: () {
          // Feature 3: Smooth Animated Navigation with FadeTransition to HomeScreen
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

    final titleText = l10n?.signUp ?? 'Sign-up';
    final alreadyAccountText = l10n?.alreadyHaveAccount ?? 'Already have an account? Sign In';

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
                const SizedBox(height: 12),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withValues(alpha: 0.08),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.person_add_alt_1_rounded,
                      size: 48,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Full Name field: First letter must be uppercase
                CustomTextField(
                  controller: _fullNameController,
                  label: l10n?.fullNameLabel ?? 'Full Name',
                  hint: l10n?.fullNameHint ?? 'e.g. John Doe',
                  prefixIcon: Icons.person_outline,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return l10n?.fullNameRequired ?? 'Full Name is required';
                    }
                    final trimmed = value.trim();
                    final firstLetter = trimmed[0];
                    // Check if first character is lowercase
                    if (RegExp(r'^[a-z]').hasMatch(firstLetter)) {
                      return l10n?.fullNameCapitalError ?? 'First letter must be uppercase';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

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
                const SizedBox(height: 16),

                // Password field: At least 6 characters
                CustomTextField(
                  controller: _passwordController,
                  label: l10n?.passwordLabel ?? 'Password',
                  hint: l10n?.passwordHint ?? 'At least 6 characters',
                  prefixIcon: Icons.lock_outline,
                  isPassword: true,
                  textInputAction: TextInputAction.next,
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
                const SizedBox(height: 16),

                // Confirm Password field: Must match password
                CustomTextField(
                  controller: _confirmPasswordController,
                  label: l10n?.confirmPasswordLabel ?? 'Confirm Password',
                  hint: l10n?.confirmPasswordHint ?? 'Re-enter your password',
                  prefixIcon: Icons.lock_reset_outlined,
                  isPassword: true,
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return l10n?.confirmPasswordRequired ?? 'Please confirm your password';
                    }
                    if (value != _passwordController.text) {
                      return l10n?.passwordMismatchError ?? 'Must match password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 28),

                // Sign-up submit button
                CustomButton(
                  text: titleText,
                  icon: Icons.check_circle_outline,
                  onPressed: _submitForm,
                ),
                const SizedBox(height: 16),

                // Switch to Sign In
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SignInScreen(),
                        ),
                      );
                    },
                    child: Text(
                      alreadyAccountText,
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
