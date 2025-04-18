import 'package:flutter/material.dart';
import 'package:gowri_seva_sangam/Screen/Scaffold%20Custom%20Appbar/custom_appbar.dart';
import 'package:responsive_framework/responsive_row_column.dart';

enum Justify { start, center, end, spaceBetween, spaceAround, spaceEvenly }

class ResponsiveGridRow extends StatelessWidget {
  final List<ResponsiveRowColumnItem> children;
  final Justify justify;

  const ResponsiveGridRow({
    super.key,
    required this.children,
    this.justify = Justify.start,
  });

  MainAxisAlignment getAlignment() {
    switch (justify) {
      case Justify.center:
        return MainAxisAlignment.center;
      case Justify.end:
        return MainAxisAlignment.end;
      case Justify.spaceBetween:
        return MainAxisAlignment.spaceBetween;
      case Justify.spaceAround:
        return MainAxisAlignment.spaceAround;
      case Justify.spaceEvenly:
        return MainAxisAlignment.spaceEvenly;
      default:
        return MainAxisAlignment.start;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveRowColumn(
      rowMainAxisAlignment: getAlignment(),
      layout: ResponsiveRowColumnType.ROW,
      children: children,
    );
  }
}

class ResponsiveGridCol extends StatelessWidget {
  final int span;
  final Widget child;

  const ResponsiveGridCol({super.key, required this.span, required this.child});

  double getWidth(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return screenWidth * (span / 24);
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveRowColumnItem(
      rowFlex: span,
      child: Container(
        width: getWidth(context),
        padding: const EdgeInsets.all(8),
        child: child,
      ),
    );
  }
}

class ResponsiveGridExample extends StatelessWidget {
  const ResponsiveGridExample({super.key});

  Widget buildBox(String label, [Color? color]) {
    return Container(
      height: 50,
      color: color ?? Colors.blue,
      alignment: Alignment.center,
      child: Text(label, style: const TextStyle(color: Colors.white)),
    );
  }

  List<ResponsiveRowColumnItem> buildCols(int count) {
    final List<int> shades = [200, 300, 400, 500, 600, 700, 800, 900];

    return List.generate(count, (index) {
      final color = Colors.blue[shades[index % shades.length]];
      return ResponsiveRowColumnItem(
        child: ResponsiveGridCol(span: 4, child: buildBox('col-4', color)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffoldWithAppBar(
      body: Column(
        // padding: const EdgeInsets.all(16),
        children: [
          const Text("Align: Start"),
          ResponsiveGridRow(justify: Justify.start, children: buildCols(4)),

          const Text("Align: Center"),
          ResponsiveGridRow(justify: Justify.center, children: buildCols(4)),

          const Text("Align: End"),
          ResponsiveGridRow(justify: Justify.end, children: buildCols(4)),

          const Text("Align: SpaceBetween"),
          ResponsiveGridRow(
            justify: Justify.spaceBetween,
            children: buildCols(4),
          ),

          const Text("Align: SpaceAround"),
          ResponsiveGridRow(
            justify: Justify.spaceAround,
            children: buildCols(4),
          ),

          const Text("Align: SpaceEvenly"),
          ResponsiveGridRow(
            justify: Justify.spaceEvenly,
            children: buildCols(4),
          ),
        ],
      ),
    );
  }
}
