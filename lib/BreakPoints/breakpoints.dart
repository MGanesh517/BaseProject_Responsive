import 'package:responsive_toolkit/breakpoints.dart';
import 'package:responsive_toolkit/responsive_grid.dart';

class ResponsiveConstants {
  final buttonBreakpoints = Breakpoints(
    xs: const ResponsiveColumnConfig(span: 6),
    sm: const ResponsiveColumnConfig(span: 4),
    md: const ResponsiveColumnConfig(span: 3),
    lg: const ResponsiveColumnConfig(span: 2),
    // xl: const ResponsiveColumnConfig(span: 3),
  );

  // final gridBreakPoints = Breakpoints(
  //   xs: const ResponsiveColumnConfig(span: 6),
  //   sm: const ResponsiveColumnConfig(span: 4),
  //   md: const ResponsiveColumnConfig(span: 3),
  //   lg: const ResponsiveColumnConfig(span: 2),
  //   // xl: const ResponsiveColumnConfig(span: 3),
  // );

  final noBreakPoints = Breakpoints(
    xs: const ResponsiveColumnConfig(span: 6),
    sm: const ResponsiveColumnConfig(span: 6),
    md: const ResponsiveColumnConfig(span: 6),
    lg: const ResponsiveColumnConfig(span: 6),
    xl: const ResponsiveColumnConfig(span: 6),
    xxl: const ResponsiveColumnConfig(span: 6),
  );


  final gridBreakpoints = Breakpoints(
    xs: const ResponsiveColumnConfig(span: 12),
    sm: const ResponsiveColumnConfig(span: 10),
    md: const ResponsiveColumnConfig(span: 8),
    lg: const ResponsiveColumnConfig(span: 6),
    xl: const ResponsiveColumnConfig(span: 4),
    xxl: const ResponsiveColumnConfig(span: 3)
  );

  final fixedBreakPoints = Breakpoints(
    xs: const ResponsiveColumnConfig(span: 3),
    // sm: const ResponsiveColumnConfig(span: 4),
    // md: const ResponsiveColumnConfig(span: 3),
    // lg: const ResponsiveColumnConfig(span: 2),
    // xl: const ResponsiveColumnConfig(span: 3),
  );
  
  final searchBreakPoint = Breakpoints(
    xs: const ResponsiveColumnConfig(span: 12),
    sm: const ResponsiveColumnConfig(span: 10),
    md: const ResponsiveColumnConfig(span: 8),
    lg: const ResponsiveColumnConfig(span: 6),
  );

  final cardBreakpoints = Breakpoints(
    xs: const ResponsiveColumnConfig(span: 12),
    sm: const ResponsiveColumnConfig(span: 10),
    md: const ResponsiveColumnConfig(span: 8),
    lg: const ResponsiveColumnConfig(span: 6),
    xl: const ResponsiveColumnConfig(span: 4),
  );

  final listCardBreakpoints = Breakpoints(
    xs: const ResponsiveColumnConfig(span: 12),
    // md: const ResponsiveColumnConfig(span: 11),
    // lg: const ResponsiveColumnConfig(span: 10),
    // xl: const ResponsiveColumnConfig(span: 9),
    lg: const ResponsiveColumnConfig(span: 12),
  );

  final textFormField = Breakpoints(
    xs: const ResponsiveColumnConfig(span: 12),
    sm: const ResponsiveColumnConfig(span: 10),
    md: const ResponsiveColumnConfig(span: 8),
    lg: const ResponsiveColumnConfig(span: 6),
    xl: const ResponsiveColumnConfig(span: 4),
    xxl: const ResponsiveColumnConfig(span: 3)
  );

  final smallBreakpoints = Breakpoints(
    xs: const ResponsiveColumnConfig(span: 12),
    // sm: const ResponsiveColumnConfig(span: 10),
    // md: const ResponsiveColumnConfig(span: 8),
    // lg: const ResponsiveColumnConfig(span: 6),
    // xl: const ResponsiveColumnConfig(span: 4),
    xxl: const ResponsiveColumnConfig(span: 1)
  );


  // var desktopWidth = 992;
  // var tabWidth = 768;


  ////// Seperate Grid BreakPoints Example
  
  final fullScreen = Breakpoints(
    xs: const ResponsiveColumnConfig(span: 12),
    sm: const ResponsiveColumnConfig(span: 12),
    md: const ResponsiveColumnConfig(span: 12),
    lg: const ResponsiveColumnConfig(span: 12),
    xl: const ResponsiveColumnConfig(span: 12),
    xxl: const ResponsiveColumnConfig(span: 12)
  );

  final twoGridRes = Breakpoints(
    xs: const ResponsiveColumnConfig(span: 6),
    sm: const ResponsiveColumnConfig(span: 6),
    md: const ResponsiveColumnConfig(span: 6),
    lg: const ResponsiveColumnConfig(span: 6),
    xl: const ResponsiveColumnConfig(span: 6),
    xxl: const ResponsiveColumnConfig(span: 6)
  );

  final threeGridRes = Breakpoints(
    xs: const ResponsiveColumnConfig(span: 4),
    sm: const ResponsiveColumnConfig(span: 4),
    md: const ResponsiveColumnConfig(span: 4),
    lg: const ResponsiveColumnConfig(span: 4),
    xl: const ResponsiveColumnConfig(span: 4),
    xxl: const ResponsiveColumnConfig(span: 4)
  );

  final fourGridRes = Breakpoints(
    xs: const ResponsiveColumnConfig(span: 3),
    sm: const ResponsiveColumnConfig(span: 3),
    md: const ResponsiveColumnConfig(span: 3),
    lg: const ResponsiveColumnConfig(span: 3),
    xl: const ResponsiveColumnConfig(span: 3),
    xxl: const ResponsiveColumnConfig(span: 3)
  );

  final nineBreakPoint = Breakpoints(
    xs: const ResponsiveColumnConfig(span: 9),
    sm: const ResponsiveColumnConfig(span: 9),
    md: const ResponsiveColumnConfig(span: 9),
    lg: const ResponsiveColumnConfig(span: 9),
    xl: const ResponsiveColumnConfig(span: 9),
    xxl: const ResponsiveColumnConfig(span: 9)
  );

  final twoBreakPoint = Breakpoints(
    xs: const ResponsiveColumnConfig(span: 2),
    sm: const ResponsiveColumnConfig(span: 2),
    md: const ResponsiveColumnConfig(span: 2),
    lg: const ResponsiveColumnConfig(span: 2),
    xl: const ResponsiveColumnConfig(span: 2),
    xxl: const ResponsiveColumnConfig(span: 2)
  );
}
