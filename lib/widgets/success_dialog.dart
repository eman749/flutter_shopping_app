import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import 'custom_button.dart';

/// Reusable success dialog shown upon valid form submissions.
class SuccessDialog extends StatelessWidget {
  final String message;
  final VoidCallback onClose;

  const SuccessDialog({
    super.key,
    required this.message,
    required this.onClose,
  });

  /// Static helper to show the dialog conveniently
  static Future<void> show({
    required BuildContext context,
    required String message,
    required VoidCallback onClose,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => SuccessDialog(
        message: message,
        onClose: onClose,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final closeLabel = l10n?.dialogCloseButton ?? 'Close';

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      elevation: 8,
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Success Icon container
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: const Color(0xFF10B981).withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check_circle_rounded,
                color: Color(0xFF10B981),
                size: 44,
              ),
            ),
            const SizedBox(height: 20),

            // Dialog Title / Message
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Suwannaphum',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 24),

            // Close button that triggers navigation
            CustomButton(
              text: closeLabel,
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss dialog
                onClose(); // Trigger navigation action
              },
            ),
          ],
        ),
      ),
    );
  }
}
