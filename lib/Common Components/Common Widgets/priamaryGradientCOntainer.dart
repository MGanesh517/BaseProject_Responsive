import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get_it/get_it.dart';
import 'package:gowri_seva_sangam/Theme/theme_config.dart';

class PrimaryGradiantContainer extends StatefulWidget {
  final Widget? child;
  final double? height;
  final double? width;
  final double? radius;
  final bool onlyBottomRadius;
  const PrimaryGradiantContainer({super.key, this.child, this.height, this.width, this.radius, required this.onlyBottomRadius});
  @override
  State<PrimaryGradiantContainer> createState() => _PrimaryGradiantContainerState();
}

class _PrimaryGradiantContainerState extends State<PrimaryGradiantContainer> {
  MyTheme currentTheme = GetIt.I<MyTheme>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
          Theme.of(context).colorScheme.secondaryContainer,
          Theme.of(context).colorScheme.secondary,
          // Theme.of(context).colorScheme.primary,
        ]),
        borderRadius: widget.radius != null
            ? widget.onlyBottomRadius
                ? BorderRadius.only(bottomLeft: Radius.circular(widget.radius!), bottomRight: Radius.circular(widget.radius!))
                : BorderRadius.circular(widget.radius!)
            : BorderRadius.circular(0),
      ),
      child: widget.child,
    );
  }
}

class SecondaryGradientContainer extends StatefulWidget {
  final Widget? child;
  final double? height;
  final double? width;
  final BoxShape? shape;

  const SecondaryGradientContainer({
    super.key,
    required this.child,
    this.height,
    this.width,
    this.shape,
  });
  @override
  State<SecondaryGradientContainer> createState() => _SecondaryGradientContainerState();
}

class _SecondaryGradientContainerState extends State<SecondaryGradientContainer> {
  MyTheme currentTheme = GetIt.I<MyTheme>();
  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.synchronized(
        duration: Duration(milliseconds: 500),
        child: ScaleAnimation(
            child: FadeInAnimation(
                child: Container(
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
            shape: widget.shape != null ? widget.shape! : BoxShape.rectangle,
            borderRadius: widget.shape != null ? null : BorderRadius.circular(10.0),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              // colors: [Color.fromRGBO(234, 116, 57, 1), Color.fromRGBO(199, 78, 12, 1)],
              colors: [Color.fromRGBO(22, 20, 30, 1), Color.fromRGBO(25, 22, 36, 1)]
            ),
          ),
          child: widget.child,
        ))));
  }
}

class GradientButtonContainer extends StatefulWidget {
  final Widget? child;
  final double? height;
  final double? width;
  final BoxShape? shape;

  const GradientButtonContainer({
    super.key,
    required this.child,
    this.height,
    this.width,
    this.shape,
  });
  @override
  State<GradientButtonContainer> createState() => _GradientButtonContainerState();
}

class _GradientButtonContainerState extends State<GradientButtonContainer> {
  MyTheme currentTheme = GetIt.I<MyTheme>();
  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.synchronized(
        duration: Duration(milliseconds: 500),
        child: ScaleAnimation(
            child: FadeInAnimation(
                child: Container(
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
            shape: widget.shape != null ? widget.shape! : BoxShape.rectangle,
            borderRadius: widget.shape != null ? null : BorderRadius.circular(10.0),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              // colors: [Color.fromRGBO(12, 13, 19, 1), Color.fromRGBO(40, 43, 55, 1), Color.fromRGBO(23, 28, 37, 1)],
              colors: [Color.fromRGBO(197, 0, 53, 1), Color.fromRGBO(126, 32, 57, 1)]
            ),
          ),
          child: widget.child,
        ))));
  }
}
