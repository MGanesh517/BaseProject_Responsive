// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:gowri_seva_sangam/BreakPoints/breakpoints.dart';
// import 'package:gowri_seva_sangam/Screen/Scaffold%20Custom%20Appbar/custom_appbar.dart';
// import 'package:responsive_toolkit/responsive_grid.dart';

// class ButtonTypes extends StatelessWidget {
//   const ButtonTypes({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return CommonScaffoldWithAppBar(
//       body: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               ResponsiveRow(
//                 runSpacing: 20.0,
//                 spacing: 20.0,
//                 columns: [
//                   ResponsiveColumn(
//                     ResponsiveConstants().buttonBreakpoints,
//                     child: ButtonTypeCommonComponents.defaultMaterialButton(
//                       context,
//                       onPressed: () {},
//                       text: "MaterialButton",
//                     ),
//                   ),
//                   ResponsiveColumn(
//                     ResponsiveConstants().buttonBreakpoints,
//                     child: ButtonTypeCommonComponents.defaultElevatedButton(
//                       context,
//                       onPressed: () {},
//                       text: "ElevatedButton",
//                     ),
//                   ),
//                   ResponsiveColumn(
//                     ResponsiveConstants().buttonBreakpoints,
//                     child: ButtonTypeCommonComponents.defaultTextButton(
//                       context,
//                       onPressed: () {},
//                       text: "TextButton",
//                     ),
//                   ),
//                   ResponsiveColumn(
//                     ResponsiveConstants().buttonBreakpoints,
//                     child: ButtonTypeCommonComponents.defaultOutlinedButton(
//                       context,
//                       onPressed: () {},
//                       text: "OutlinedButton",
//                     ),
//                   ),
//                   ResponsiveColumn(
//                     ResponsiveConstants().buttonBreakpoints,
//                     child: ButtonTypeCommonComponents.defaultFloatingActionButton(
//                       context,
//                       onPressed: () {},
//                       icon: Icons.add,
//                       isExtended: false,
//                     ),
//                   ),
//                   ResponsiveColumn(
//                     ResponsiveConstants().buttonBreakpoints,
//                     child: ButtonTypeCommonComponents.defaultIconButton(
//                       context,
//                       onPressed: () {},
//                       icon: Icons.thumb_up,
//                     ),
//                   ),
//                   ResponsiveColumn(
//                     ResponsiveConstants().buttonBreakpoints,
//                     child: ButtonTypeCommonComponents.defaultPopupMenuButton(
//                       context,
//                       onSelected: (value) {},
//                       items: ["Item 1", "Item 2", "Item 3"],
//                     ),
//                   ),
//                   ResponsiveColumn(
//                     ResponsiveConstants().buttonBreakpoints,
//                     child: ButtonTypeCommonComponents.defaultDropdownButton(
//                       context,
//                       onChanged: (value) {},
//                       items: ["Select 1", "Select 2", "Select 3"],
//                     ),
//                   ),
//                   ResponsiveColumn(
//                     ResponsiveConstants().buttonBreakpoints,
//                     child: ButtonTypeCommonComponents.defaultToggleButton(
//                       context,
//                       onPressed: (index) {},
//                       isSelected: [true, false, false],
//                       children: [Text("1"), Text("2"), Text("3")],
//                     ),
//                   ),
//                 ],
//               ),

//           Container(
//                 height: Get.height * 40 / 896,
//               ),

//               // ResponsiveRow(
//               //    runSpacing: 20.0,
//               //   spacing: 20.0,
//               //   columns: [
//               //      ResponsiveColumn(
//               //       ResponsiveConstants().searchBreakPoint,
//               //       child: ButtonTypeCommonComponents.defaultMaterialButton(
//               //         context,
//               //         onPressed: () {},
//               //         text: "MaterialButton",
//               //       ),
//               //     ),
//               //     ResponsiveColumn(
//               //       ResponsiveConstants().searchBreakPoint,
//               //       child: ButtonTypeCommonComponents.defaultElevatedButton(
//               //         context,
//               //         onPressed: () {},
//               //         text: "ElevatedButton",
//               //       ),
//               //     ),
//               //     ResponsiveColumn(
//               //       ResponsiveConstants().searchBreakPoint,
//               //       child: ButtonTypeCommonComponents.defaultTextButton(
//               //         context,
//               //         onPressed: () {},
//               //         text: "TextButton",
//               //       ),
//               //     ),
//               //     ResponsiveColumn(
//               //       ResponsiveConstants().searchBreakPoint,
//               //       child: ButtonTypeCommonComponents.defaultOutlinedButton(
//               //         context,
//               //         onPressed: () {},
//               //         text: "OutlinedButton",
//               //       ),
//               //     ),
//               //     ResponsiveColumn(
//               //       ResponsiveConstants().searchBreakPoint,
//               //       child: ButtonTypeCommonComponents.defaultFloatingActionButton(
//               //         context,
//               //         onPressed: () {},
//               //         icon: Icons.add,
//               //         isExtended: false,
//               //       ),
//               //     ),
//               //     ResponsiveColumn(
//               //       ResponsiveConstants().searchBreakPoint,
//               //       child: ButtonTypeCommonComponents.defaultIconButton(
//               //         context,
//               //         onPressed: () {},
//               //         icon: Icons.thumb_up,
//               //       ),
//               //     ),
//               //     ResponsiveColumn(
//               //       ResponsiveConstants().searchBreakPoint,
//               //       child: ButtonTypeCommonComponents.defaultPopupMenuButton(
//               //         context,
//               //         onSelected: (value) {},
//               //         items: ["Item 1", "Item 2", "Item 3"],
//               //       ),
//               //     ),
//               //     ResponsiveColumn(
//               //       ResponsiveConstants().searchBreakPoint,
//               //       child: ButtonTypeCommonComponents.defaultDropdownButton(
//               //         context,
//               //         onChanged: (value) {},
//               //         items: ["Select 1", "Select 2", "Select 3"],
//               //       ),
//               //     ),
//               //     ResponsiveColumn(
//               //       ResponsiveConstants().searchBreakPoint,
//               //       child: ButtonTypeCommonComponents.defaultToggleButton(
//               //         context,
//               //         onPressed: (index) {},
//               //         isSelected: [true, false, false],
//               //         children: [Text("A"), Text("B"), Text("C")],
//               //       ),
//               //     ),
//               //   ],
//               // ),

//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gowri_seva_sangam/BreakPoints/breakpoints.dart';
import 'package:gowri_seva_sangam/Screen/Scaffold%20Custom%20Appbar/custom_appbar.dart';
import 'package:responsive_toolkit/responsive_grid.dart';

class ButtonTypes extends StatefulWidget {
  const ButtonTypes({super.key});

  @override
  State<ButtonTypes> createState() => _ButtonTypesState();
}

class _ButtonTypesState extends State<ButtonTypes> {
  bool isExpanded = false;

  void toggleFab() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final RxList<bool> isSelected = [true, false, false].obs;
    final RxBool isLoading = false.obs;

    return CommonScaffoldWithAppBar(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Variants',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Primary'),
                    ),
                    ButtonTypeCommonComponents.defaultOutlinedButton(
                      context,
                      onPressed: () {},
                      text: 'Outlined',
                    ),
                    TextButton(onPressed: () {}, child: const Text('Text')),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        side: const BorderSide(color: Colors.grey),
                        foregroundColor: Colors.black,
                        shadowColor: Colors.transparent,
                      ),
                      child: const Text('Ghost'),
                    ),
                    TextButton(
                      onPressed: () => launchUrl('https://your-link.com'),
                      child: const Text(
                        'Link',
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                const Text(
                  'States & Icons',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.download),
                      label: const Text('Download'),
                    ),
                    ElevatedButton(
                      onPressed:
                          isLoading.value
                              ? null
                              : () {
                                isLoading.value = true;
                                Future.delayed(
                                  const Duration(seconds: 2),
                                  () => isLoading.value = false,
                                );
                              },
                      child:
                          isLoading.value
                              ? const SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                              : const Text('Loading'),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.thumb_up),
                      tooltip: 'Like',
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search),
                      tooltip: 'Search',
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.grey.shade200,
                        shape: const CircleBorder(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                const Text(
                  'Color Themes',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Wrap(
                  spacing: 12,
                  children: [
                    ButtonTypeCommonComponents.defaultElevatedButton(
                      context,
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      text: "Success",
                    ),
                    ButtonTypeCommonComponents.defaultElevatedButton(
                      context,
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      text: 'Danger',
                    ),
                    ButtonTypeCommonComponents.defaultOutlinedButton(
                      context,
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                      ),
                      text: 'Danger (Outlined)',
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                const Text(
                  'Toggle / Grouped',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ButtonTypeCommonComponents.defaultToggleButton(
                  context,
                  isSelected: isSelected,
                  onPressed: (index) {
                    for (int i = 0; i < isSelected.length; i++) {
                      isSelected[i] = i == index;
                    }
                  },
                  borderRadius: 8,
                  selectedColor: Colors.white,
                  fillColor: Colors.blue,
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text('A'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text('B'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text('C'),
                    ),
                  ],
                ),

                const SizedBox(height: 24),
                const SizedBox(height: 24),
                const SizedBox(height: 24),

                Text("Responsive", style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
                const SizedBox(height: 24),
                const SizedBox(height: 24),


                ResponsiveRow(
                  runSpacing: 20.0,
                  spacing: 20.0,
                  columns: [
                    ResponsiveColumn(
                      ResponsiveConstants().buttonBreakpoints,
                      child: ButtonTypeCommonComponents.defaultMaterialButton(
                        context,
                        onPressed: () {},
                        text: "MaterialButton",
                      ),
                    ),
                    ResponsiveColumn(
                      ResponsiveConstants().buttonBreakpoints,
                      child: ButtonTypeCommonComponents.defaultElevatedButton(
                        context,
                        onPressed: () {},
                        text: "ElevatedButton",
                      ),
                    ),
                    ResponsiveColumn(
                      ResponsiveConstants().buttonBreakpoints,
                      child: ButtonTypeCommonComponents.defaultTextButton(
                        context,
                        onPressed: () {},
                        text: "TextButton",
                      ),
                    ),
                    ResponsiveColumn(
                      ResponsiveConstants().buttonBreakpoints,
                      child: ButtonTypeCommonComponents.defaultOutlinedButton(
                        context,
                        onPressed: () {},
                        text: "OutlinedButton",
                      ),
                    ),
                    ResponsiveColumn(
                      ResponsiveConstants().buttonBreakpoints,
                      child:
                          ButtonTypeCommonComponents.defaultFloatingActionButton(
                            context,
                            onPressed: () {},
                            icon: Icons.add,
                            isExtended: false,
                          ),
                    ),
                    ResponsiveColumn(
                      ResponsiveConstants().buttonBreakpoints,
                      child: ButtonTypeCommonComponents.defaultIconButton(
                        context,
                        onPressed: () {},
                        icon: Icons.thumb_up,
                      ),
                    ),
                    ResponsiveColumn(
                      ResponsiveConstants().buttonBreakpoints,
                      child: ButtonTypeCommonComponents.defaultPopupMenuButton(
                        context,
                        onSelected: (value) {},
                        items: ["Item 1", "Item 2", "Item 3"],
                      ),
                    ),
                    ResponsiveColumn(
                      ResponsiveConstants().buttonBreakpoints,
                      child: ButtonTypeCommonComponents.defaultDropdownButton(
                        context,
                        onChanged: (value) {},
                        items: ["Select 1", "Select 2", "Select 3"],
                      ),
                    ),
                    ResponsiveColumn(
                      ResponsiveConstants().buttonBreakpoints,
                      child: ButtonTypeCommonComponents.defaultToggleButton(
                        context,
                        onPressed: (index) {},
                        isSelected: [true, false, false],
                        children: [Text("1"), Text("2"), Text("3")],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),
                const SizedBox(height: 24),
                const SizedBox(height: 24),
                Text("FloatingAction Buttons ", style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
                const SizedBox(height: 24),
                const SizedBox(height: 24),


                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    Column(
                      children: [
                        const Text("Basic Floating Button"),
                        ButtonTypeCommonComponents.defaultFloatingActionButton(
                          context,
                          onPressed: () {},
                          icon: Icons.add,
                          tooltip: "Basic FAB",
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text("Extended Floating Button"),
                        ButtonTypeCommonComponents.defaultFloatingActionButton(
                          context,
                          onPressed: () {},
                          icon: Icons.send,
                          isExtended: true,
                          extendedLabel: "Send",
                          tooltip: "Extended FAB",
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        const Text("Success Styled FAB"),
                        ButtonTypeCommonComponents.defaultFloatingActionButton(
                          context,
                          onPressed: () {},
                          icon: Icons.check,
                          backgroundColor: Colors.green,
                          tooltip: "Success",
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        const Text("Danger Styled FAB"),
                        ButtonTypeCommonComponents.defaultFloatingActionButton(
                          context,
                          onPressed: () {},
                          icon: Icons.delete,
                          backgroundColor: Colors.red,
                          tooltip: "Danger",
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        const Text("With Custom Tooltip"),
                        ButtonTypeCommonComponents.defaultFloatingActionButton(
                          context,
                          onPressed: () {},
                          icon: Icons.info,
                          tooltip: "Floating Button with Tooltip",
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        const Text("Rounded Square Shape"),
                        ButtonTypeCommonComponents.defaultFloatingActionButton(
                          context,
                          onPressed: () {},
                          icon: Icons.crop_square,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          tooltip: "Square FAB",
                        ),
                      ],
                    ),

                    // Column(
                    //   children: [
                    //     const Text("Ghost/Outlined-Look FAB"),
                    //     ButtonTypeCommonComponents.defaultFloatingActionButton(
                    //       context,
                    //       onPressed: () {},
                    //       icon: Icons.explore,
                    //       foregroundColor: Colors.blue,
                    //       backgroundColor: Colors.transparent,
                    //       shadowColor: Colors.transparent,
                    //       shape: RoundedRectangleBorder(
                    //         side: const BorderSide(
                    //           color: Colors.blue,
                    //           width: 1,
                    //         ),
                    //         borderRadius: BorderRadius.circular(16),
                    //       ),
                    //       tooltip: "Ghost FAB",
                    //     ),
                    //   ],
                    // ),

                    Column(
                      children: [
                        const Text("Extended + Custom Text Style"),
                        ButtonTypeCommonComponents.defaultFloatingActionButton(
                          context,
                          onPressed: () {},
                          icon: Icons.edit,
                          isExtended: true,
                          extendedLabel: "Edit",
                          extendedTextStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),
                          backgroundColor: Colors.yellow[100],
                          foregroundColor: Colors.deepPurple,
                          tooltip: "Extended with Style",
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        const Text("Loading-style FAB (disabled)"),
                        ButtonTypeCommonComponents.defaultFloatingActionButton(
                          context,
                          onPressed: () {},
                          icon: Icons.hourglass_top,
                          backgroundColor: Colors.grey.shade400,
                          foregroundColor: Colors.white,
                          tooltip: "Loading",
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonWidget: MouseRegion(
        onEnter: (_) => setState(() => isExpanded = true),
        onExit: (_) => setState(() => isExpanded = false),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isExpanded) ...[
              const SizedBox(height: 10),
              ButtonTypeCommonComponents.defaultFloatingActionButton(
                context,
                onPressed: () {},
                icon: Icons.chat,
                tooltip: "Chat",
              ),
              const SizedBox(height: 10),
              ButtonTypeCommonComponents.defaultFloatingActionButton(
                context,
                onPressed: () {},
                icon: Icons.mail,
                tooltip: "Mail",
              ),
              const SizedBox(height: 10),
              ButtonTypeCommonComponents.defaultFloatingActionButton(
                context,
                onPressed: () {},
                icon: Icons.phone,
                tooltip: "Call",
              ),
            ],
            SizedBox(height: 10.0),
            ButtonTypeCommonComponents.defaultFloatingActionButton(
              context,
              onPressed: toggleFab,
              icon: isExpanded ? Icons.close : Icons.menu,
              tooltip: "Toggle FAB Group",
            ),
          ],
        ),
      ),
    );
  }

  void launchUrl(String url) {
    // You can use `url_launcher` package for real implementation.
    debugPrint('Launching URL: $url');
  }
}

class ButtonTypeCommonComponents {
  static Column defaultMaterialButton(
    BuildContext context, {
    required VoidCallback onPressed,
    String text = "Material Button",
    FocusNode? focusNode,
    bool autofocus = false,
    Clip clipBehavior = Clip.none,
    void Function(bool)? onFocusChange,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MaterialButton(
          onPressed: onPressed,
          focusNode: focusNode,
          autofocus: autofocus,
          clipBehavior: clipBehavior,
          onHighlightChanged: (isHighlighted) {
            if (onFocusChange != null) onFocusChange(isHighlighted);
          },
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Theme.of(context).colorScheme.primary),
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: ButtonTextTheme.primary,
          splashColor: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
          mouseCursor: SystemMouseCursors.click,
          animationDuration: const Duration(milliseconds: 200),
          color: Theme.of(context).colorScheme.primaryContainer,
          minWidth: 200,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          hoverElevation: 6,
          hoverColor: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
          textColor: Theme.of(context).colorScheme.onPrimaryContainer,
          highlightElevation: 10,
          highlightColor: Theme.of(
            context,
          ).colorScheme.primary.withOpacity(0.2),
          height: 50,
          focusElevation: 8,
          focusColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          enableFeedback: true,
          elevation: 4,
          disabledTextColor: Colors.grey,
          disabledElevation: 0,
          disabledColor: Colors.grey.shade300,
          colorBrightness: Theme.of(context).brightness,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
        ),
      ],
    );
  }

  static Column defaultElevatedButton(
    BuildContext context, {
    required VoidCallback onPressed,
    String text = "ElevatedButton",
    ButtonStyle? style,
    FocusNode? focusNode,
    bool autofocus = false,
    void Function(bool)? onFocusChange,
    void Function()? onLongPress,
    void Function(bool)? onHover,
    Clip clipBehavior = Clip.none,
    WidgetStatesController? statesController,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: onPressed,
          onFocusChange: onFocusChange,
          onLongPress: onLongPress,
          onHover: onHover,
          statesController: statesController,
          focusNode: focusNode,
          autofocus: autofocus,
          clipBehavior: clipBehavior,
          style:
              style ??
              ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                elevation: 4,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
          child: Text(text),
        ),
      ],
    );
  }

  static Column defaultTextButton(
    BuildContext context, {
    required VoidCallback onPressed,
    String text = "TextButton",
    ButtonStyle? style,
    FocusNode? focusNode,
    bool autofocus = false,
    Clip clipBehavior = Clip.none,
    void Function()? onLongPress,
    void Function(bool)? onHover,
    void Function(bool)? onFocusChange,
    WidgetStatesController? statesController,
    bool? isSemanticButton = true,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
          onPressed: onPressed,
          onLongPress: onLongPress,
          onHover: onHover,
          onFocusChange: onFocusChange,
          focusNode: focusNode,
          autofocus: autofocus,
          clipBehavior: clipBehavior,
          style:
              style ??
              TextButton.styleFrom(
                foregroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
              ),
          statesController: statesController,
          child: Text(text),
        ),
      ],
    );
  }

  static Column defaultOutlinedButton(
    BuildContext context, {
    required VoidCallback onPressed,
    String text = "OutlinedButton",
    ButtonStyle? style,
    FocusNode? focusNode,
    bool autofocus = false,
    Clip clipBehavior = Clip.none,
    void Function()? onLongPress,
    void Function(bool)? onHover,
    void Function(bool)? onFocusChange,
    WidgetStatesController? statesController,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OutlinedButton(
          onPressed: onPressed,
          onLongPress: onLongPress,
          onHover: onHover,
          onFocusChange: onFocusChange,
          statesController: statesController,
          focusNode: focusNode,
          autofocus: autofocus,
          clipBehavior: clipBehavior,
          style:
              style ??
              OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.blue),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
          child: Text(text),
        ),
      ],
    );
  }

  static Column defaultFloatingActionButton(
    BuildContext context, {
    required VoidCallback onPressed,
    IconData icon = Icons.add,
    String extendedLabel = "Extended FAB",
    bool isExtended = false,
    Color? backgroundColor,
    Color? foregroundColor,
    double borderRadius = 16,
    Color? shadowColor,
    Color? splashColor = Colors.white24,
    Color? hoverColor = Colors.white10,
    Color? focusColor = Colors.white30,
    double? elevation = 6.0,
    double? hoverElevation = 8.0,
    double? focusElevation = 6.0,
    double? highlightElevation = 12.0,
    double? disabledElevation = 0.0,
    ShapeBorder? shape,
    Object? heroTag,
    String? tooltip,
    FocusNode? focusNode,
    bool autofocus = false,
    MaterialTapTargetSize materialTapTargetSize = MaterialTapTargetSize.padded,
    MouseCursor mouseCursor = SystemMouseCursors.click,
    bool enableFeedback = true,
    Clip clipBehavior = Clip.antiAlias,
    EdgeInsetsGeometry extendedPadding = const EdgeInsets.symmetric(
      horizontal: 16.0,
    ),
    double extendedIconLabelSpacing = 8.0,
    TextStyle extendedTextStyle = const TextStyle(fontWeight: FontWeight.bold),
  }) {
    final ShapeBorder defaultShape =
        shape ??
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isExtended
            ? FloatingActionButton.extended(
              onPressed: onPressed,
              label: Text(extendedLabel, style: extendedTextStyle),
              icon: Icon(icon),
              backgroundColor: backgroundColor,
              foregroundColor: foregroundColor,
              shape: defaultShape,
              heroTag: heroTag,
              tooltip: tooltip,
              focusNode: focusNode,
              autofocus: autofocus,
              elevation: elevation,
              hoverElevation: hoverElevation,
              focusElevation: focusElevation,
              highlightElevation: highlightElevation,
              disabledElevation: disabledElevation,
              materialTapTargetSize: materialTapTargetSize,
              mouseCursor: mouseCursor,
              splashColor: splashColor,
              hoverColor: hoverColor,
              focusColor: focusColor,
              enableFeedback: enableFeedback,
              clipBehavior: clipBehavior,
              extendedPadding: extendedPadding,
              extendedIconLabelSpacing: extendedIconLabelSpacing,
            )
            : FloatingActionButton(
              onPressed: onPressed,
              backgroundColor: backgroundColor,
              foregroundColor: foregroundColor,
              shape: defaultShape,
              heroTag: heroTag,
              tooltip: tooltip,
              focusNode: focusNode,
              autofocus: autofocus,
              elevation: elevation,
              hoverElevation: hoverElevation,
              focusElevation: focusElevation,
              highlightElevation: highlightElevation,
              disabledElevation: disabledElevation,
              materialTapTargetSize: materialTapTargetSize,
              mouseCursor: mouseCursor,
              splashColor: splashColor,
              hoverColor: hoverColor,
              focusColor: focusColor,
              enableFeedback: enableFeedback,
              clipBehavior: clipBehavior,
              isExtended: isExtended,
              child: Icon(icon),
            ),
      ],
    );
  }

  static Column defaultIconButton(
    BuildContext context, {
    required VoidCallback onPressed,
    IconData icon = Icons.thumb_up,
    Color? iconColor,
    double iconSize = 24.0,
    double splashRadius = 20.0,
    double borderRadius = 12.0,
    String? tooltip,
    FocusNode? focusNode,
    bool autofocus = false,
    VisualDensity visualDensity = VisualDensity.compact,
    EdgeInsetsGeometry padding = const EdgeInsets.all(8),
    AlignmentGeometry alignment = Alignment.center,
    bool? isSelected = false,
    Widget? selectedIcon,
    Color? hoverColor = Colors.blueAccent,
    Color? focusColor = Colors.blueAccent,
    Color? highlightColor = Colors.blueAccent,
    Color? splashColor = Colors.blueAccent,
    Color? disabledColor = Colors.grey,
    bool enableFeedback = true,
    MouseCursor mouseCursor = SystemMouseCursors.click,
    BoxConstraints? constraints,
    void Function()? onLongPress,
    void Function(bool)? onHover,
    ButtonStyle? style,
    ShapeBorder? shape,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          icon: Icon(icon),
          iconSize: iconSize,
          color: iconColor,
          splashRadius: splashRadius,
          tooltip: tooltip,
          padding: padding,
          alignment: alignment,
          visualDensity: visualDensity,
          focusNode: focusNode,
          autofocus: autofocus,
          isSelected: isSelected,
          selectedIcon: selectedIcon,
          hoverColor: hoverColor,
          focusColor: focusColor,
          highlightColor: highlightColor,
          splashColor: splashColor,
          disabledColor: disabledColor,
          enableFeedback: enableFeedback,
          mouseCursor: mouseCursor,
          constraints: constraints,
          onPressed: onPressed,
          onLongPress: onLongPress,
          onHover: onHover,
          style:
              style ??
              ButtonStyle(
                shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                ),
              ),
        ),
      ],
    );
  }

  static Column defaultPopupMenuButton(
    BuildContext context, {
    required void Function(String) onSelected,
    String label = "PopupMenu",
    List<String> items = const ["Option 1", "Option 2"],
    Widget? child,
    Icon? icon,
    Color? iconColor,
    double iconSize = 24.0,
    Color? color,
    ShapeBorder? shape,
    Clip clipBehavior = Clip.none,
    Color? shadowColor,
    BorderRadius? borderRadius,
    EdgeInsetsGeometry? padding,
    Offset offset = Offset.zero,
    PopupMenuPosition position = PopupMenuPosition.over,
    TextStyle? style,
    double? elevation = 8.0,
    bool enabled = true,
    bool enableFeedback = true,
    String? tooltip,
    void Function()? onCanceled,
    void Function()? onOpened,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.titleMedium),
        PopupMenuButton<String>(
          onSelected: onSelected,
          itemBuilder: (BuildContext context) {
            return items
                .map((item) => PopupMenuItem(value: item, child: Text(item)))
                .toList();
          },
          icon: icon ?? Icon(Icons.more_vert),
          iconColor: iconColor,
          iconSize: iconSize,
          color: color,
          shape: shape,
          clipBehavior: clipBehavior,
          shadowColor: shadowColor,
          borderRadius: borderRadius,
          padding: padding ?? const EdgeInsets.all(8),
          offset: offset,
          position: position,
          // style: style,
          elevation: elevation,
          enabled: enabled,
          enableFeedback: enableFeedback,
          tooltip: tooltip,
          onCanceled: onCanceled,
          onOpened: onOpened,
          child: child,
        ),
      ],
    );
  }

  static Column defaultDropdownButton(
    BuildContext context, {
    required void Function(String?) onChanged,
    String label = "Dropdown",
    List<String> items = const ["Option 1", "Option 2"],
    String? value,
    AlignmentGeometry alignment = Alignment.centerLeft,
    bool autofocus = false,
    BorderRadius? borderRadius,
    Widget? disabledHint,
    Color? dropdownColor,
    int elevation = 8,
    bool enableFeedback = true,
    Color? focusColor,
    FocusNode? focusNode,
    Widget? hint,
    Widget? icon,
    Color? iconDisabledColor,
    Color? iconEnabledColor,
    double iconSize = 24.0,
    bool isDense = false,
    bool isExpanded = true,
    double? itemHeight,
    double? menuMaxHeight,
    double? menuWidth,
    VoidCallback? onTap,
    EdgeInsetsGeometry? padding,
    DropdownButtonBuilder? selectedItemBuilder,
    TextStyle? style,
    Widget? underline,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.titleMedium),
        DropdownButton<String>(
          alignment: alignment,
          autofocus: autofocus,
          borderRadius: borderRadius,
          disabledHint: disabledHint,
          dropdownColor: dropdownColor,
          elevation: elevation,
          enableFeedback: enableFeedback,
          focusColor: focusColor,
          focusNode: focusNode,
          hint: hint,
          icon: icon,
          iconDisabledColor: iconDisabledColor,
          iconEnabledColor: iconEnabledColor,
          iconSize: iconSize,
          isDense: isDense,
          isExpanded: isExpanded,
          itemHeight: itemHeight,
          items:
              items
                  .map(
                    (item) => DropdownMenuItem(value: item, child: Text(item)),
                  )
                  .toList(),
          menuMaxHeight: menuMaxHeight,
          menuWidth: menuWidth,
          onChanged: onChanged,
          onTap: onTap,
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 12),
          selectedItemBuilder: selectedItemBuilder,
          style: style,
          underline: underline,
          value: value ?? items.first,
        ),
      ],
    );
  }

  static Column defaultToggleButton(
    BuildContext context, {
    required void Function(int) onPressed,
    List<bool> isSelected = const [true, false],
    List<Widget> children = const [Text("A"), Text("B")],

    // Customization props
    double borderRadius = 8.0,
    double borderWidth = 1.5,
    Color? borderColor,
    Color? selectedBorderColor,
    Color? fillColor,
    Color? selectedColor,
    Color? color,
    Color? splashColor,
    Color? hoverColor,
    Color? highlightColor,
    Color? focusColor,
    Color? disabledColor,
    Color? disabledBorderColor,
    List<FocusNode>? focusNodes,
    MouseCursor mouseCursor = SystemMouseCursors.click,
    BorderSide? side,
    BoxConstraints? constraints,
    TextStyle? textStyle,
    VerticalDirection verticalDirection = VerticalDirection.down,
    Axis direction = Axis.horizontal,
    EdgeInsetsGeometry? padding,
    bool renderBorder = true,
    MaterialTapTargetSize tapTargetSize = MaterialTapTargetSize.padded,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ToggleButtons(
          isSelected: isSelected,
          onPressed: onPressed,
          direction: direction,
          verticalDirection: verticalDirection,
          borderRadius: BorderRadius.circular(borderRadius),
          borderWidth: borderWidth,
          borderColor: borderColor ?? Theme.of(context).colorScheme.outline,
          selectedBorderColor:
              selectedBorderColor ?? Theme.of(context).colorScheme.primary,
          fillColor:
              fillColor ??
              Theme.of(context).colorScheme.primary.withOpacity(0.1),
          selectedColor: selectedColor ?? Theme.of(context).colorScheme.primary,
          color: color ?? Theme.of(context).textTheme.bodyMedium?.color,
          splashColor: splashColor ?? Theme.of(context).splashColor,
          hoverColor: hoverColor ?? Theme.of(context).hoverColor,
          highlightColor: highlightColor ?? Theme.of(context).highlightColor,
          focusColor: focusColor ?? Theme.of(context).focusColor,
          disabledColor: disabledColor ?? Theme.of(context).disabledColor,
          disabledBorderColor:
              disabledBorderColor ?? Theme.of(context).disabledColor,
          renderBorder: renderBorder,
          textStyle: textStyle ?? const TextStyle(fontWeight: FontWeight.w600),
          focusNodes: focusNodes,
          constraints:
              constraints ?? const BoxConstraints(minHeight: 40, minWidth: 64),
          tapTargetSize: tapTargetSize,
          mouseCursor: mouseCursor,
          children: children,
        ),
      ],
    );
  }
}
