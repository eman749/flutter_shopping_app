import 'package:flutter/material.dart';

/// Custom PageRoute that performs a smooth Fade Transition between screens.
class FadePageRoute<T> extends PageRouteBuilder<T> {
  final Widget page;
  final Duration transitionDurationCustom;

  FadePageRoute({
    required this.page,
    this.transitionDurationCustom = const Duration(milliseconds: 600),
  }) : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionDuration: transitionDurationCustom,
          reverseTransitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            // Fade-out transition for the outgoing route and Fade-in for the incoming route
            final curvedAnimation = CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            );

            return FadeTransition(
              opacity: curvedAnimation,
              child: child,
            );
          },
        );
}
