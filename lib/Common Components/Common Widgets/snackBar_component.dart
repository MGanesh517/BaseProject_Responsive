import 'package:flutter/material.dart';

enum SnackbarType { success, error, warning, info }

class AnimatedSnackbar extends StatelessWidget {
  final String message;
  final SnackbarType type;
  final VoidCallback? onDismiss;

  const AnimatedSnackbar({
    super.key,
    required this.message,
    this.type = SnackbarType.info,
    this.onDismiss,
  });

  Color get backgroundColor {
    switch (type) {
      case SnackbarType.success:
        return Colors.green;
      case SnackbarType.error:
        return Colors.red;
      case SnackbarType.warning:
        return Colors.orange;
      case SnackbarType.info:
        return Colors.black;
    }
  }

  IconData? get icon {
    switch (type) {
      case SnackbarType.success:
        return Icons.check_circle;
      case SnackbarType.error:
        return Icons.close;
      case SnackbarType.warning:
        return Icons.warning;
      case SnackbarType.info:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: Colors.transparent,
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null)
                  Icon(icon, color: Colors.white, size: 20),
                if (icon != null) const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    message,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                if (onDismiss != null)
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: onDismiss,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SnackbarService {
  static OverlayEntry? _currentSnackbar;

  static void showSnackbar(
    BuildContext context, {
    required String message,
    SnackbarType type = SnackbarType.info,
  }) {
    // Remove any existing snackbar
    dismiss();

    final overlay = Overlay.of(context);
    final animationController = AnimationController(
      vsync: NavigatorState(),
      duration: const Duration(milliseconds: 300),
    );

    final fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeIn),
    );

    _currentSnackbar = OverlayEntry(
      builder: (context) => FadeTransition(
        opacity: fadeAnimation,
        child: AnimatedSnackbar(
          message: message,
          type: type,
          onDismiss: () {
            animationController.reverse();
            Future.delayed(const Duration(milliseconds: 300), () => dismiss());
          },
        ),
      ),
    );

    overlay.insert(_currentSnackbar!);

    animationController.forward();
    Future.delayed(const Duration(seconds: 3), () {
      animationController.reverse();
      Future.delayed(const Duration(milliseconds: 300), () => dismiss());
    });
  }

  static void dismiss() {
    _currentSnackbar?.remove();
    _currentSnackbar = null;
  }
}
