
import 'package:flutter/material.dart';

enum ToastType { success, error, info, warning }
enum ToastPosition { top, bottom, center }
enum ToastAnimation { fadeIn, slideIn, scale }

class CustomToast extends StatelessWidget {
  final String message;
  final ToastType type;
  final ToastPosition position;
  final ToastAnimation animation;
  final Duration displayDuration;
  final Duration animationDuration;

  const CustomToast({
    super.key,
    required this.message,
    this.type = ToastType.info,
    this.position = ToastPosition.bottom,
    this.animation = ToastAnimation.fadeIn,
    this.displayDuration = const Duration(seconds: 2),
    this.animationDuration = const Duration(milliseconds: 300),
  });

  Color get backgroundColor {
    switch (type) {
      case ToastType.success:
        return Colors.green.shade800;
      case ToastType.error:
        return Colors.red.shade800;
      case ToastType.warning:
        return Colors.orange.shade800;
      case ToastType.info:
        return Colors.blue.shade800;
    }
  }

  IconData get icon {
    switch (type) {
      case ToastType.success:
        return Icons.check_circle;
      case ToastType.error:
        return Icons.error;
      case ToastType.warning:
        return Icons.warning;
      case ToastType.info:
        return Icons.info;
    }
  }

  double getTopOffset(BuildContext context, ToastPosition position) {
    final padding = MediaQuery.of(context).padding;
    final height = MediaQuery.of(context).size.height;

    switch (position) {
      case ToastPosition.top:
        return padding.top + 20;
      case ToastPosition.bottom:
        return height - 100 - padding.bottom;
      case ToastPosition.center:
        return (height - padding.top - padding.bottom) / 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: _ToastAnimationWrapper(
        animation: animation,
        position: position,
        displayDuration: displayDuration,
        animationDuration: animationDuration,
        topOffset: getTopOffset(context, position),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Colors.white),
              const SizedBox(width: 12),
              Flexible(
                child: Text(
                  message,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ToastAnimationWrapper extends StatefulWidget {
  final Widget child;
  final ToastAnimation animation;
  final ToastPosition position;
  final Duration displayDuration;
  final Duration animationDuration;
  final double topOffset;

  const _ToastAnimationWrapper({
    required this.child,
    required this.animation,
    required this.position,
    required this.displayDuration,
    required this.animationDuration,
    required this.topOffset,
  });

  @override
  State<_ToastAnimationWrapper> createState() => _ToastAnimationWrapperState();
}

class _ToastAnimationWrapperState extends State<_ToastAnimationWrapper>
  with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  bool isDismissing = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    switch (widget.animation) {
      case ToastAnimation.fadeIn:
        animation = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: controller, curve: Curves.easeIn),
        );
        break;
      case ToastAnimation.slideIn:
        animation = Tween<double>(begin: 100.0, end: 0.0).animate(
          CurvedAnimation(parent: controller, curve: Curves.easeOut),
        );
        break;
      case ToastAnimation.scale:
        animation = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: controller, curve: Curves.elasticOut),
        );
        break;
    }

    controller.forward();
    setupAutoDismiss();
  }

  void setupAutoDismiss() async {
    await Future.delayed(widget.displayDuration);
    if (mounted && !isDismissing) {
      isDismissing = true;
      try {
        await controller.reverse();
        if (mounted) {
          ToastService.dismiss();
        }
      } catch (e) {
        debugPrint("Error during toast dismissal: $e");
      }
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            Widget animatedChild;
            switch (widget.animation) {
              case ToastAnimation.fadeIn:
                animatedChild = Opacity(
                  opacity: animation.value,
                  child: child,
                );
                break;
              case ToastAnimation.slideIn:
                animatedChild = Transform.translate(
                  offset: Offset(0, animation.value),
                  child: child,
                );
                break;
              case ToastAnimation.scale:
                animatedChild = Transform.scale(
                  scale: animation.value,
                  child: child,
                );
                break;
            }

            return Positioned(
              left: 0,
              right: 0,
              top: widget.topOffset,
              child: SafeArea(
                child: Center(child: animatedChild),
              ),
            );
          },
          child: widget.child,
        ),
      ],
    );
  }
}

class ToastService {
  static OverlayEntry? _currentToast;

  static void show(
    BuildContext context, {
    required String message,
    ToastType type = ToastType.info,
    ToastPosition position = ToastPosition.bottom,
    ToastAnimation animation = ToastAnimation.fadeIn,
    Duration? displayDuration,
    Duration? animationDuration,
  }) {
    // Dismiss the current toast if it exists
    _currentToast?.remove();
    _currentToast = null;

    final OverlayState overlayState = Overlay.of(context);

    _currentToast = OverlayEntry(
      builder: (context) => CustomToast(
        message: message,
        type: type,
        position: position,
        animation: animation,
        displayDuration: displayDuration ?? const Duration(seconds: 2),
        animationDuration:
            animationDuration ?? const Duration(milliseconds: 300),
      ),
    );

    overlayState.insert(_currentToast!);
  }

  static void dismiss() {
    if (_currentToast != null) {
      _currentToast?.remove();
      _currentToast = null;
      debugPrint("Toast dismissed");
    }
  }
}