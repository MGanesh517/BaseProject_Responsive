
import 'package:flutter/material.dart';

enum DialogAnimationType {
  scale,
  fade,
  slideBottom,
  slideTop,
  slideLeft,
  slideRight,
  scaleAndFade,
  rotate,
  scaleAndSlideBottom,
  rotateAndFade,
  zoomIn,
  zoomOut,
  spin360
}

enum DialogWidth {
  extraSmall,
  small,
  medium,
  large,
  extraLarge,
  custom,
}

enum DialogHeight {
  extraSmall,
  small,
  medium,
  large,
  extraLarge,
  custom,
  fitContent,
}

class AnimatedDialog extends StatelessWidget {
  final Widget title;
  final Widget content;
  final Widget? closeButtonTitle;
  final Widget? saveButtonTitle;
  final VoidCallback? onSave;
  final VoidCallback? onClose;
  final bool showCloseButton;
  final bool showSaveButton;
  final DialogAnimationType animationType;
  final Duration animationDuration;
  final Duration? autoCloseDuration;
  final Widget? customContent;

  final DialogWidth dialogWidth;
  final double? customWidth;
  final double? maxWidthPercentage;
  final double? minWidth;

  final DialogHeight dialogHeight;
  final double? customHeight;
  final double? maxHeightPercentage;
  final double? minHeight;

  const AnimatedDialog({
    super.key,
    this.title = const Text('Modal Title'),
    this.content =
        const Text('This is an example modal with a unique animation.'),
    this.closeButtonTitle = const Text('Close'),
    this.saveButtonTitle = const Text('Save'),
    this.onSave,
    this.onClose,
    this.showCloseButton = true,
    this.showSaveButton = false,
    this.animationType = DialogAnimationType.scale,
    this.animationDuration = const Duration(milliseconds: 400),
    this.autoCloseDuration,
    this.customContent,
    this.dialogWidth = DialogWidth.medium,
    this.customWidth,
    this.maxWidthPercentage = 0.9,
    this.minWidth = 300,
    this.dialogHeight = DialogHeight.fitContent,
    this.customHeight,
    this.maxHeightPercentage = 0.9,
    this.minHeight = 200,
  })  : assert(
          dialogWidth != DialogWidth.custom || customWidth != null,
          'customWidth must be provided when using DialogWidth.custom',
        ),
        assert(
          dialogHeight != DialogHeight.custom || customHeight != null,
          'customHeight must be provided when using DialogHeight.custom',
        );

  double getDialogWidth(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double targetWidth;

    switch (dialogWidth) {
      case DialogWidth.extraSmall:
        targetWidth = 300;
      case DialogWidth.small:
        targetWidth = 400;
      case DialogWidth.medium:
        targetWidth = 600;
      case DialogWidth.large:
        targetWidth = 800;
      case DialogWidth.extraLarge:
        targetWidth = 1000;
      case DialogWidth.custom:
        targetWidth = customWidth!;
    }

    double maxWidth = screenWidth * (maxWidthPercentage ?? 0.9);
    double constrainedWidth = targetWidth.clamp(minWidth ?? 300, maxWidth);

    return constrainedWidth;
  }

  double? getDialogHeight(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    // If fitContent is selected, return null to allow content-based sizing
    if (dialogHeight == DialogHeight.fitContent) {
      return null;
    }

    double targetHeight;

    switch (dialogHeight) {
      case DialogHeight.extraSmall:
        targetHeight = 200;
      case DialogHeight.small:
        targetHeight = 300;
      case DialogHeight.medium:
        targetHeight = 500;
      case DialogHeight.large:
        targetHeight = 700;
      case DialogHeight.extraLarge:
        targetHeight = 900;
      case DialogHeight.custom:
        targetHeight = customHeight!;
      case DialogHeight.fitContent:
        return null;
    }

    double maxHeight = screenHeight * (maxHeightPercentage ?? 0.9);
    double constrainedHeight = targetHeight.clamp(minHeight ?? 200, maxHeight);

    return constrainedHeight;
  }

  void show(BuildContext context) {
    // Show the dialog
    final overlayEntry = OverlayEntry(
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: getDialogWidth(context),
              maxHeight: getDialogHeight(context) ?? double.infinity,
            ),
            child: Container(
              width: getDialogWidth(context),
              height: getDialogHeight(context),
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    title,
                    const SizedBox(height: 16),
                    customContent ?? content,
                    const SizedBox(height: 24),
                    // Only show button row if at least one button is visible
                    if (showCloseButton || showSaveButton)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (showCloseButton)
                            TextButton(
                              onPressed: () {
                                onClose?.call();
                                Navigator.of(context).pop();
                              },
                              child: closeButtonTitle ?? const Text('Close'),
                            ),
                          if (showCloseButton && showSaveButton)
                            const SizedBox(width: 8),
                          if (showSaveButton)
                            ElevatedButton(
                              onPressed: () {
                                onSave?.call();
                                Navigator.of(context).pop();
                              },
                              child: saveButtonTitle ?? const Text('Save'),
                            ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );

    Overlay.of(context).insert(overlayEntry);

    // Auto-close logic
    if (autoCloseDuration != null) {
      Future.delayed(autoCloseDuration!, () {
        overlayEntry.remove();
      });
    }
  }

  Widget buildTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    switch (animationType) {
      case DialogAnimationType.scale:
        return ScaleTransition(
          scale: CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          child: child,
        );
      case DialogAnimationType.fade:
        return FadeTransition(opacity: animation, child: child);
      case DialogAnimationType.slideBottom:
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
              .animate(animation),
          child: child,
        );
      case DialogAnimationType.slideTop:
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero)
              .animate(animation),
          child: child,
        );
      case DialogAnimationType.slideLeft:
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
              .animate(animation),
          child: child,
        );
      case DialogAnimationType.slideRight:
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
              .animate(animation),
          child: child,
        );
      case DialogAnimationType.scaleAndFade:
        return ScaleTransition(
          scale: animation,
          child: FadeTransition(opacity: animation, child: child),
        );
      case DialogAnimationType.rotate:
        return RotationTransition(
          turns: Tween<double>(begin: 0, end: 1).animate(animation),
          child: child,
        );
      case DialogAnimationType.scaleAndSlideBottom:
        return ScaleTransition(
          scale: animation,
          child: SlideTransition(
            position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
                .animate(animation),
            child: child,
          ),
        );
      case DialogAnimationType.rotateAndFade:
        return RotationTransition(
          turns: Tween<double>(begin: 0, end: 1).animate(animation),
          child: FadeTransition(opacity: animation, child: child),
        );
      case DialogAnimationType.zoomIn:
        return ScaleTransition(
          scale: Tween<double>(begin: 0.5, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOutBack)),
          child: child,
        );

      case DialogAnimationType.zoomOut:
        return ScaleTransition(
          scale: Tween<double>(begin: 1.2, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeInBack)),
          child: child,
        );

      case DialogAnimationType.spin360:
        return RotationTransition(
          turns: Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
          child: child,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
