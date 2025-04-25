import 'package:flutter/material.dart';
import 'package:gowri_seva_sangam/BreakPoints/breakpoints.dart';
import 'package:gowri_seva_sangam/Screen/Scaffold%20Custom%20Appbar/custom_appbar.dart';
import 'package:responsive_toolkit/responsive_grid.dart';

class ModalScreen extends StatefulWidget {
  const ModalScreen({super.key});

  @override
  State<ModalScreen> createState() => _ModalScreenState();
}

class _ModalScreenState extends State<ModalScreen> {
  @override
  Widget build(BuildContext context) {
    return CommonScaffoldWithAppBar(
      body: Container(
          height: MediaQuery.of(context).size.height,
          child: const ModalAnimationExample()),
    );
  }
}

class ModalAnimationExample extends StatelessWidget {
  const ModalAnimationExample({super.key});

  void showAnimatedDialog(BuildContext context, Widget child,
      RouteTransitionsBuilder transitionBuilder) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Modal Title',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text(
                  'This is an example modal with a unique animation. You can customize each transition as needed.',
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Close'),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(' Save changes'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      transitionBuilder: transitionBuilder,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          ResponsiveRow(spacing: 20, runSpacing: 20, columns: [
            ResponsiveColumn(
              ResponsiveConstants().buttonBreakpoints,
              child: ElevatedButton(
                onPressed: () {
                  // Scale transition (Zoom in)
                  showAnimatedDialog(
                    context,
                    const Text('Scale Animation'),
                    (context, animation, secondaryAnimation, child) {
                      return ScaleTransition(
                        scale: CurvedAnimation(
                            parent: animation, curve: Curves.easeInOut),
                        child: child,
                      );
                    },
                  );
                },
                child: const Text('Scale Animation'),
              ),
            ),
            ResponsiveColumn(
              ResponsiveConstants().buttonBreakpoints,
              child: ElevatedButton(
                onPressed: () {
                  // Fade transition (Fade in)
                  showAnimatedDialog(
                    context,
                    const Text('Fade Animation'),
                    (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  );
                },
                child: const Text('Fade Animation'),
              ),
            ),
            ResponsiveColumn(
              ResponsiveConstants().buttonBreakpoints,
              child: ElevatedButton(
                onPressed: () {
                  // Slide from bottom
                  showAnimatedDialog(
                    context,
                    const Text('Slide from Bottom'),
                    (context, animation, secondaryAnimation, child) {
                      return SlideTransition(
                        position: Tween<Offset>(
                                begin: const Offset(0, 1), end: Offset.zero)
                            .animate(animation),
                        child: child,
                      );
                    },
                  );
                },
                child: const Text('Slide from Bottom'),
              ),
            ),
            ResponsiveColumn(
              ResponsiveConstants().buttonBreakpoints,
              child: ElevatedButton(
                onPressed: () {
                  // Slide from top
                  showAnimatedDialog(
                    context,
                    const Text('Slide from Top'),
                    (context, animation, secondaryAnimation, child) {
                      return SlideTransition(
                        position: Tween<Offset>(
                                begin: const Offset(0, -1), end: Offset.zero)
                            .animate(animation),
                        child: child,
                      );
                    },
                  );
                },
                child: const Text('Slide from Top'),
              ),
            ),
            ResponsiveColumn(
              ResponsiveConstants().buttonBreakpoints,
              child: ElevatedButton(
                onPressed: () {
                  // Slide from left
                  showAnimatedDialog(
                    context,
                    const Text('Slide from Left'),
                    (context, animation, secondaryAnimation, child) {
                      return SlideTransition(
                        position: Tween<Offset>(
                                begin: const Offset(-1, 0), end: Offset.zero)
                            .animate(animation),
                        child: child,
                      );
                    },
                  );
                },
                child: const Text('Slide from Left'),
              ),
            ),
            ResponsiveColumn(
              ResponsiveConstants().buttonBreakpoints,
              child: ElevatedButton(
                onPressed: () {
                  // Slide from right
                  showAnimatedDialog(
                    context,
                    const Text('Slide from Right'),
                    (context, animation, secondaryAnimation, child) {
                      return SlideTransition(
                        position: Tween<Offset>(
                                begin: const Offset(1, 0), end: Offset.zero)
                            .animate(animation),
                        child: child,
                      );
                    },
                  );
                },
                child: const Text('Slide from Right'),
              ),
            ),
            ResponsiveColumn(
              ResponsiveConstants().buttonBreakpoints,
              child: ElevatedButton(
                onPressed: () {
                  // Scale and Fade combined
                  showAnimatedDialog(
                    context,
                    const Text('Scale and Fade'),
                    (context, animation, secondaryAnimation, child) {
                      return ScaleTransition(
                        scale: animation,
                        child: FadeTransition(opacity: animation, child: child),
                      );
                    },
                  );
                },
                child: const Text('Scale and Fade Animation'),
              ),
            ),
            ResponsiveColumn(
              ResponsiveConstants().buttonBreakpoints,
              child: ElevatedButton(
                onPressed: () {
                  // Rotation animation
                  showAnimatedDialog(
                    context,
                    const Text('Rotation Animation'),
                    (context, animation, secondaryAnimation, child) {
                      return RotationTransition(
                        turns:
                            Tween<double>(begin: 0, end: 1).animate(animation),
                        child: child,
                      );
                    },
                  );
                },
                child: const Text('Rotation Animation'),
              ),
            ),
            ResponsiveColumn(
              ResponsiveConstants().buttonBreakpoints,
              child: ElevatedButton(
                onPressed: () {
                  // Scale and Slide from Bottom
                  showAnimatedDialog(
                    context,
                    const Text('Scale and Slide from Bottom'),
                    (context, animation, secondaryAnimation, child) {
                      return ScaleTransition(
                        scale: animation,
                        child: SlideTransition(
                          position: Tween<Offset>(
                                  begin: const Offset(0, 1), end: Offset.zero)
                              .animate(animation),
                          child: child,
                        ),
                      );
                    },
                  );
                },
                child: const Text('Scale and Slide from Bottom'),
              ),
            ),
            ResponsiveColumn(
              ResponsiveConstants().buttonBreakpoints,
              child: ElevatedButton(
                onPressed: () {
                  // Rotation and Fade combined
                  showAnimatedDialog(
                    context,
                    const Text('Rotation and Fade'),
                    (context, animation, secondaryAnimation, child) {
                      return RotationTransition(
                        turns:
                            Tween<double>(begin: 0, end: 1).animate(animation),
                        child: FadeTransition(opacity: animation, child: child),
                      );
                    },
                  );
                },
                child: const Text('Rotation and Fade Animation'),
              ),
            ),
          ])
        ],
      ),
    );
  }
}
