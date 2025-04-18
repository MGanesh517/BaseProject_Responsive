import 'package:flutter/material.dart';

class ReducedDownwardDragScrollPhysics extends ScrollPhysics {
  final double reduction;

  const ReducedDownwardDragScrollPhysics({super.parent, this.reduction = 0.5}) : assert(reduction >= 0 && reduction <= 1);

  @override
  ReducedDownwardDragScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return ReducedDownwardDragScrollPhysics(parent: buildParent(ancestor), reduction: reduction);
  }

  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    // Only reduce drag when scrolling downwards (negative offset)
    if (offset > 0) {
      return offset * (1 - reduction);
    }
    // Normal behavior for upward scrolling
    return offset;
  }
}
