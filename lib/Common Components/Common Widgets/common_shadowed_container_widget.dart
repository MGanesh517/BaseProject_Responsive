import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ShadowContainer extends StatefulWidget {
  final Widget child;
  final double? height;
  final double? width;
  final double? radius;
  final bool defaultRadius;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  const ShadowContainer(
      {super.key, required this.child, this.height, this.width, this.radius, required this.defaultRadius, this.margin, this.padding});

  @override
  State<ShadowContainer> createState() => _ShadowContainerState();
}

class _ShadowContainerState extends State<ShadowContainer> {
  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.synchronized(
        duration: Duration(milliseconds: 500),
        child: ScaleAnimation(
            child: FadeInAnimation(
                child: Container(
                    padding: widget.padding ?? EdgeInsets.symmetric(horizontal: 0),
                    margin: widget.margin ?? EdgeInsets.symmetric(horizontal: 0),
                    height: widget.height,
                    width: widget.width,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(42, 0, 71, 1).withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                      borderRadius: widget.defaultRadius ? BorderRadius.circular(20) : BorderRadius.circular(widget.radius!),
                    ),
                    child: widget.child))));
  }
}
