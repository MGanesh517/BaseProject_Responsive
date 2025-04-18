import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:gowri_seva_sangam/App%20Constants/app_constants.dart';
import 'package:gowri_seva_sangam/BreakPoints/breakpoints.dart';
import 'package:gowri_seva_sangam/Common%20Components/common_input_fields.dart';
import 'package:gowri_seva_sangam/Screen/Community_Members/Controller/community_controller.dart';
import 'package:gowri_seva_sangam/Screen/Community_Members/Masters/mini_controller.dart';
import 'package:gowri_seva_sangam/Screen/Community_Members/Masters/models/mini_commonModel.dart';
import 'package:gowri_seva_sangam/Screen/Profile%20Screen/Controller/profile_controller.dart';
import 'package:gowri_seva_sangam/Screen/Scaffold%20Custom%20Appbar/custom_appbar.dart';
import 'package:responsive_toolkit/responsive_grid.dart';
import 'package:toastification/toastification.dart';

class OtherDialogWidgets extends StatefulWidget {
  const OtherDialogWidgets({super.key});

  @override
  State<OtherDialogWidgets> createState() => _OtherDialogWidgetsState();
}

class _OtherDialogWidgetsState extends State<OtherDialogWidgets> {
  final controller = Get.put(CommunityMembersController());
  final profileController = Get.put(ProfileController());
  final miniController = Get.put(MiniController());
  bool checkboxValue = false;
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return CommonScaffoldWithAppBar(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            ResponsiveRow(
              spacing: 20,
              runSpacing: 20,
              columns: [
                ResponsiveColumn(ResponsiveConstants().textFormField, child: ElevatedButton(
                  onPressed: () => CommonComponentsDialogWidgets.showGetDialog(context,
                  title: "Are you sure you want to logout?",
                  actionsWidget: [Row(
                children: [
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Theme.of(context).colorScheme.outline)
                      ),
                      child: MaterialButton(
                        height: Get.height * 45 / 896,
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        // color: Colors.red,
                        onPressed: () {},
                        child: Center(
                            child: Text(
                          "Log me out",overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: Get.height * AppConstants.themeConstants.fontsize_14,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.primary,overflow: TextOverflow.ellipsis
                          ),
                        )),
                      ),
                    )),
                  Container(
                    width: Get.width * 20 / 414,
                  ),
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: MaterialButton(
                        height: Get.height * 45 / 896,
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        // color: Colors.red,
                        onPressed: () {
                          Get.back();
                        },
                        child: Center(
                            child: Text("Stay logged in",overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: Get.height * AppConstants.themeConstants.fontsize_14,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context).colorScheme.primaryContainer,overflow: TextOverflow.ellipsis
                                ))),
                      ),
                    ),
                  ),
                ],
              ),]
                  ),
                  child: const Text("Show Get.dialog"),
                )),
                ResponsiveColumn(ResponsiveConstants().textFormField, child: ElevatedButton(
                  onPressed: () => CommonComponentsDialogWidgets.showGeneralDialog(context,
                  content: Expanded(
                    child: Column(
                      children: [
                        Row(
                                      children: [
                                        Expanded(
                                          child: CommonComponents.defaultTextFormField(
                                            context,
                                            controller: controller.firstNameController,
                                            textInputAction: TextInputAction.next,
                                            keyboardType: TextInputType.text,
                                            title: 'First Name',
                                            hintText: 'Enter First Name',
                                            validator: (value) => value!.isEmpty ? 'Name is required' : null,
                                            inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9A-Za-z ,./?@&()!%*]'))],
                                          ),
                                        ),
                                        SizedBox(width: Get.width * 18 / 896),
                                        Expanded(
                                          child: CommonComponents.defaultTextFormField(
                                            context,
                                            controller: controller.lastNameController,
                                            textInputAction: TextInputAction.next,
                                            keyboardType: TextInputType.text,
                                            hintText: 'Enter Surname',
                                            title: 'Surname',
                                            validator: (value) => value!.isEmpty ? 'Surname is required' : null,
                                            inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9A-Za-z ,./?@&()!%*]'))],
                                          ),
                                        ),
                                      ],
                                    ),
                                    
                                    SizedBox(height: Get.height * 10 / 896),
                                CommonComponents.defaultTextFormField(
                                      context,
                                      readOnly: true,
                                      keyboardType: TextInputType.text,
                                      title: 'Community Name',
                                      controller: TextEditingController(text: "${profileController.userDetails.community?.name}"),
                                    ),
                                    SizedBox(height: Get.height * 10 / 896),
                                    Row(
                                    children: [
                                      Expanded(child: Obx(() => CommonComponents.defaultNewDropdownSearch<MiniCommonModel>(
                                      context,
                                      title: "Gender",
                                      hintText: 'Select Gender',
                                      items: (filter, infiniteScrollProps) async {
                                        miniController.getCommunityIsRefresh = true;
                                
                                        return controller.genderList;
                                      },
                                      itemBuilder: (context, MiniCommonModel? item, isSelected, isTrue) {
                                        return Container(
                                          margin: const EdgeInsets.symmetric(horizontal: 8),
                                          decoration: !isSelected
                                              ? null
                                              : BoxDecoration(
                                                  borderRadius: BorderRadius.circular(5),
                                                  color: Theme.of(context).colorScheme.secondaryContainer,
                                                ),
                                          child: ListTile(
                                            selected: isSelected,
                                            title: Text(
                                              item?.name ?? '',
                                              style: TextStyle(color: Theme.of(context).colorScheme.surface),
                                            ),
                                          ),
                                        );
                                      },
                                      selectedItem: controller.genderList.firstWhereOrNull(
                                        (item) => item.id == controller.postMembersData.gender,
                                      ),
                                      validator: (MiniCommonModel? value) {
                                        if (value == null || value.name == null || value.name!.isEmpty) {
                                          return 'Gender is required';
                                        }
                                        return null;
                                      },
                                      compareFn: (i, MiniCommonModel? s) => i.name == s?.name,
                                      itemAsString: (MiniCommonModel u) => u.name ?? '',
                                      onChanged: (MiniCommonModel? data) {
                                        if (data != null) {
                                        print("Print the gender :::: ===>>> ${data.id}");
                                        controller.postMembersData.gender = data.id;
                                        controller.update();
                                        }
                                      },
                                    ))),
                                    SizedBox(width: Get.width * 18 / 896),
                                    Expanded(child: Obx(() =>  CommonComponents.defaultNewDropdownSearch<MiniCommonModel>(
                                      context,
                                      title: 'Marital Status',
                                      hintText: "Select Marital Status",
                                      items: (filter, infiniteScrollProps) async {
                                        miniController.getCommunityIsRefresh = true;
                                        return controller.maritalChoices;
                                      },
                                      itemBuilder: (context, MiniCommonModel? item, isSelected, isTrue) {
                                        return Container(
                                          margin: const EdgeInsets.symmetric(horizontal: 8),
                                          decoration: isSelected
                                              ? BoxDecoration(
                                                  borderRadius: BorderRadius.circular(5),
                                                  color: Theme.of(context).colorScheme.secondaryContainer,
                                                )
                                              : null,
                                          child: ListTile(
                                            selected: isSelected,
                                            title: Text(
                                              item?.name ?? '',
                                              style: TextStyle(color: Theme.of(context).colorScheme.surface),
                                            ),
                                          ),
                                        );
                                      },
                                      selectedItem: controller.maritalChoices.firstWhereOrNull(
                                        (item) => item.id == controller.postMembersData.maritalStatus,
                                      ),
                                      compareFn: (i, MiniCommonModel? s) => i.name == s?.name,
                                      itemAsString: (MiniCommonModel u) => u.name ?? '',
                                      onChanged: (MiniCommonModel? data) {
                                    
                                        if (data != null) {
                                          print("Selected Marital Status: ${data.id}");
                                          controller.postMembersData.maritalStatus = data.id;
                                              if (data.id != null) {
                                                controller.updateMaritalStatus(data.id!);
                                                controller.update();
                                              }
                                              controller.update();
                                        }
                                      },
                                    )))
                                    ],
                                  ),
                      ],
                    ),
                  )
                  ),
                  child: const Text("Show General Dialog"),
                )),
                ResponsiveColumn(ResponsiveConstants().textFormField, child: ElevatedButton(
                  onPressed: () => CommonComponentsDialogWidgets.showToast(
                    "User added successfully!",
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 14,
                    webBgGradient: LinearGradient(
                      colors: [Colors.green, Colors.blue],
                    ),
                    fontAsset: 'Roboto',
                  ),
                  child: const Text("Toast Bottom"),
                )),
                ResponsiveColumn(ResponsiveConstants().textFormField, child: ElevatedButton(
                  onPressed: () => CommonComponentsDialogWidgets.showToast(
                    "Congratulations!",
                    backgroundColor: Colors.green,
                    gravity: ToastGravity.TOP,
                    webPosition: 'top',
                    textColor: Colors.white,
                    fontSize: 14,
                    webBgGradient: LinearGradient(
                      colors: [Colors.green, Colors.blue],
                    ),
                    fontAsset: 'Roboto',
                  ),
                  child: const Text("Toast Top"),
                )),
                ResponsiveColumn(ResponsiveConstants().textFormField, child: Builder(builder: (context) {
                  return ElevatedButton(
                    onPressed: () {
                      final RenderBox button = context.findRenderObject() as RenderBox;
                      final Offset offset = button.localToGlobal(Offset.zero);
                      CommonComponentsDialogWidgets.showPopupMenu(context, offset);
                    },
                    child: const Text("Show Popup Menu"),
                  );
                })),
                // ResponsiveColumn(ResponsiveConstants().textFormField, child: CommonComponentsDialogWidgets.buildCheckbox(context,
                //   value: checkboxValue,
                //   onChanged: (val) => setState(() => checkboxValue = val ?? false),
                // )),
                ResponsiveColumn(ResponsiveConstants().textFormField, child: CommonComponentsDialogWidgets.buildSwitch(context,
                  value: switchValue,
                  onChanged: (val) => setState(() => switchValue = val),
                )),
            
                ResponsiveColumn(ResponsiveConstants().textFormField, child: CommonComponentsDialogWidgets.buildRadio(context,
                selected: true,
                  onChanged: (val) => setState(() => switchValue = val),
                )),
            
                ResponsiveColumn(ResponsiveConstants().textFormField, child: CommonComponentsDialogWidgets.buildCupertinoRadio(context,
                selected: true,
                  onChanged: (val) => setState(() => checkboxValue = val ?? false),
                )),
            
                ResponsiveColumn(ResponsiveConstants().textFormField, child: CommonComponentsDialogWidgets.buildCupertinoSwitch(context,
                  value: switchValue,
                  onChanged: (val) => setState(() => switchValue = val),
                )),
            
                ResponsiveColumn(ResponsiveConstants().textFormField, child: CommonComponentsDialogWidgets.defaultChoiceChip(
                  label: controller.genderList.isNotEmpty ? controller.genderList.first.name ?? '' : 'No Gender',
                  selected: controller.communityMemberDetails.fatherName == "Father",
                  onSelected: (val) => controller.communityMemberDetails.fatherName = val ? "Father" : "",
                  selectedColor: Colors.blue,
                  backgroundColor: Colors.grey[200],
                  labelStyle: const TextStyle(color: Colors.white),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                )),
                  
                ResponsiveColumn(ResponsiveConstants().textFormField, child: GestureDetector(
                  onTap: () {
                    toastification.show(
                      context: context,
                      title: Text('Congratulations!',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                                              type: ToastificationType.success,
                                              closeButtonShowType: CloseButtonShowType.always,
                                              showIcon: true,
                                              style: ToastificationStyle.minimal,
                                              progressBarTheme: ProgressIndicatorThemeData(linearMinHeight: 1),
                                              autoCloseDuration: const Duration(seconds: 5),
                                            );
                  },
                  child: Text("Show Toastification"),
                )),
              ],
            ),
        
        
            // Text("Color Picker Types", style: TextStyle(fontWeight: FontWeight.bold)),
            // SizedBox(height: 24),
            // SizedBox(height: 24),
        
            // ColorPickerExamples(),
        
            // SizedBox(height: 24),
            // SizedBox(height: 24),
        
          ],
        ),
      ),
    );
  }
}



class CommonComponentsDialogWidgets {
  static void showGetDialog(
    BuildContext context, {
    String? name,
    Duration transitionDuration = const Duration(milliseconds: 300),
    Curve transitionCurve = Curves.easeInOut,
    GlobalKey<NavigatorState>? navigatorKey,
    RouteSettings? routeSettings,
    bool barrierDismissible = true,
    bool useSafeArea = true,
    Color? barrierColor = Colors.black54,

    // AlertDialog customizations
    EdgeInsets? insetPadding,
    String? title = "Dialog Title",
    Widget? content ,
    List<Widget>? actionsWidget,
    Color? shadowColor,
    ShapeBorder? shape,
    EdgeInsetsGeometry? titlePadding,
    Color? surfaceTintColor,
    TextStyle? contentTextStyle,
    String? semanticLabel,
    Widget? icon,
    EdgeInsetsGeometry? iconPadding,
    double? elevation,
    Color? iconColor,
    bool scrollable = false,
    EdgeInsetsGeometry? actionsPadding,
    AlignmentGeometry? alignment,
    Color? backgroundColor,
    EdgeInsetsGeometry? buttonPadding,
    Clip clipBehavior = Clip.none,
    EdgeInsetsGeometry? contentPadding,
    TextStyle? titleTextStyle,
    MainAxisAlignment? actionsAlignment,
    double? actionsOverflowButtonSpacing,
    VerticalDirection? actionsOverflowDirection,
    OverflowBarAlignment? actionsOverflowAlignment,
  }) {
    Get.dialog(
      AlertDialog(
        title: title != null
            ? Text(
                title,
                style: titleTextStyle,
              )
            : null,
        content:  content,
        actions: [
          if (actionsWidget != null)
            ...actionsWidget
          else
            TextButton(
              onPressed: () => Get.back(),
              child: const Text("Close"),
            ),
        ],
        insetPadding: insetPadding,
        shadowColor: shadowColor,
        shape: shape,
        contentTextStyle: contentTextStyle,
        titlePadding: titlePadding,
        surfaceTintColor: surfaceTintColor,
        semanticLabel: semanticLabel,
        icon: icon,
        iconPadding: iconPadding,
        elevation: elevation,
        iconColor: iconColor,
        scrollable: scrollable,
        actionsPadding: actionsPadding,
        alignment: alignment,
        backgroundColor: backgroundColor,
        buttonPadding: buttonPadding,
        clipBehavior: clipBehavior,
        contentPadding: contentPadding,
        titleTextStyle: titleTextStyle,
        actionsAlignment: actionsAlignment,
        actionsOverflowButtonSpacing: actionsOverflowButtonSpacing,
        actionsOverflowDirection: actionsOverflowDirection,
        actionsOverflowAlignment: actionsOverflowAlignment,
      ),
      name: name,
      transitionDuration: transitionDuration,
      transitionCurve: transitionCurve,
      navigatorKey: navigatorKey,
      routeSettings: routeSettings,
      barrierDismissible: barrierDismissible,
      useSafeArea: useSafeArea,
      barrierColor: barrierColor,
    );
  }

  static Widget defaultChoiceChip({
    required String label,
    required bool selected,
    required ValueChanged<bool> onSelected,
    EdgeInsets? padding,
    Color? selectedColor,
    Color? backgroundColor,
    TextStyle? labelStyle,
    double? elevation,
    Icon? avatar,
    Color? shadowColor,
    Color? selectedShadowColor,
    double? pressElevation,
    BorderSide? side,
    OutlinedBorder? shape,
    MouseCursor? mouseCursor,
    MaterialTapTargetSize? materialTapTargetSize,
    bool? showCheckmark,
    Color? checkmarkColor,
    FocusNode? focusNode,
    Color? disabledColor,
    Clip? clipBehavior,
    VisualDensity? visualDensity,
    Color? surfaceTintColor,
    ChipAnimationStyle? chipAnimationStyle,
    bool autofocus = false,
    BoxConstraints? avatarBoxConstraints,
    OutlinedBorder? avatarBorder,
    String? tooltip,
    EdgeInsets? labelPadding,
    IconThemeData? iconTheme,
  }) {
    return Row(
      children: [
        ChoiceChip(
          label: Text(label, style: labelStyle),
          selected: selected,
          onSelected: onSelected,
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          selectedColor: selectedColor,
          backgroundColor: backgroundColor,
          elevation: elevation ?? 0,
          avatar: avatar,
          shadowColor: shadowColor,
          selectedShadowColor: selectedShadowColor,
          pressElevation: pressElevation ?? 0,
          side: side,
          shape: shape,
          mouseCursor: mouseCursor,
          materialTapTargetSize: materialTapTargetSize,
          showCheckmark: showCheckmark,
          checkmarkColor: checkmarkColor,
          focusNode: focusNode,
          disabledColor: disabledColor,
          clipBehavior: clipBehavior ?? Clip.none,
          visualDensity: visualDensity,
          surfaceTintColor: surfaceTintColor,
          chipAnimationStyle: chipAnimationStyle,
          autofocus: autofocus,
          avatarBorder: avatarBorder ?? const CircleBorder(),
          avatarBoxConstraints: avatarBoxConstraints,
          tooltip: tooltip,
          labelPadding: labelPadding,
          iconTheme: iconTheme,
        ),
      ],
    );
  }

  static void showGeneralDialog(
    BuildContext context, {
    bool barrierDismissible = true,
    Color? barrierColor = Colors.black54,
    String? barrierLabel,
    bool useSafeArea = true,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
    TraversalEdgeBehavior? traversalEdgeBehavior,
    Offset? anchorPoint,

    String? title = "General Dialog Title",
    Widget? content ,
    List<Widget>? actionsWidget,
    // AlertDialog customization
    EdgeInsets? insetPadding,
    Color? shadowColor,
    ShapeBorder? shape,
    EdgeInsetsGeometry? titlePadding,
    Color? surfaceTintColor,
    TextStyle? contentTextStyle,
    String? semanticLabel,
    Widget? icon,
    EdgeInsetsGeometry? iconPadding,
    double? elevation,
    Color? iconColor,
    bool scrollable = false,
    EdgeInsetsGeometry? actionsPadding,
    AlignmentGeometry? alignment,
    Color? backgroundColor,
    EdgeInsetsGeometry? buttonPadding,
    Clip clipBehavior = Clip.none,
    EdgeInsetsGeometry? contentPadding,
    TextStyle? titleTextStyle,
    MainAxisAlignment? actionsAlignment,
    double? actionsOverflowButtonSpacing,
    VerticalDirection? actionsOverflowDirection,
    OverflowBarAlignment? actionsOverflowAlignment,
  }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      barrierLabel: barrierLabel,
      useSafeArea: useSafeArea,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
      traversalEdgeBehavior: traversalEdgeBehavior,
      anchorPoint: anchorPoint,
      builder: (_) => AlertDialog(
        title: title != null
            ? Text(
                title,
                style: titleTextStyle,
              )
            : null,
        content:  content,
        actions: [
          if (actionsWidget != null)
            ...actionsWidget
          else
            TextButton(
              onPressed: () => Get.back(),
              child: const Text("Close"),
            ),
        ],
        insetPadding: insetPadding,
        shadowColor: shadowColor,
        shape: shape,
        titlePadding: titlePadding,
        surfaceTintColor: surfaceTintColor,
        contentTextStyle: contentTextStyle,
        semanticLabel: semanticLabel,
        icon: icon,
        iconPadding: iconPadding,
        elevation: elevation,
        iconColor: iconColor,
        scrollable: scrollable,
        actionsPadding: actionsPadding,
        alignment: alignment,
        backgroundColor: backgroundColor,
        buttonPadding: buttonPadding,
        clipBehavior: clipBehavior,
        contentPadding: contentPadding,
        titleTextStyle: titleTextStyle,
        actionsAlignment: actionsAlignment,
        actionsOverflowButtonSpacing: actionsOverflowButtonSpacing,
        actionsOverflowDirection: actionsOverflowDirection,
        actionsOverflowAlignment: actionsOverflowAlignment,
      ),
    );
  }


  static void showToast(
    String message, {
    Toast? toastLength = Toast.LENGTH_SHORT,
    ToastGravity? gravity = ToastGravity.TOP_RIGHT,
    double? fontSize = 16.0,
    Color backgroundColor = Colors.red,
    Color textColor = Colors.white,
    int timeInSecForIosWeb = 2,
    bool webShowClose = true,
    String webPosition = "right",
    Gradient? webBgGradient,
    String? fontAsset,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: toastLength,
      gravity: gravity,
      fontSize: fontSize,
      backgroundColor: backgroundColor,
      textColor: textColor,
      timeInSecForIosWeb: timeInSecForIosWeb,
      webShowClose: webShowClose,
      webPosition: webPosition,
      webBgColor: webBgGradient != null
          ? _gradientToCssString(webBgGradient)
          : "linear-gradient(to right, #f44336, #e91e63)",
      fontAsset : fontAsset,
    );
  }

  static String _gradientToCssString(Gradient gradient) {
    if (gradient is LinearGradient) {
      final stops = gradient.colors
          .map((c) => '#${c.value.toRadixString(16).substring(2)}')
          .join(', ');
      return 'linear-gradient(to right, $stops)';
    }
    return "linear-gradient(to right, #f44336, #e91e63)";
  }


  static Future<void> showPopupMenu(
    BuildContext context,
    Offset offset, {
    List<PopupMenuEntry>? items,
    Color? color,
    double elevation = 8.0,
    double maxHeight = 200,
    double minWidth = 100,
    ShapeBorder? shape,
    EdgeInsetsGeometry menuPadding = EdgeInsets.zero,
    String? semanticLabel,
    RouteSettings? routeSettings,
    bool useRootNavigator = true,
    bool requestFocus = true,
    Clip clipBehavior = Clip.hardEdge,
    AnimationStyle? popUpAnimationStyle,
    Color? shadowColor,
    Color? surfaceTintColor,
  }) async {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;

    await showMenu(
      context: context,
      position: RelativeRect.fromRect(
        offset & const Size(40, 40),
        Offset.zero & overlay.size,
      ),
      items: items ??
          const [
            PopupMenuItem(child: Text("Option 1")),
            PopupMenuItem(child: Text("Option 2")),
          ],
      color: color ?? Theme.of(context).colorScheme.primaryContainer,
      elevation: elevation,
      constraints: BoxConstraints(
        maxHeight: maxHeight,
        minWidth: minWidth,
      ),
      clipBehavior: clipBehavior,
      shape: shape ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: Theme.of(context).colorScheme.outline,
              width: 1,
            ),
          ),
      menuPadding: menuPadding,
      semanticLabel: semanticLabel,
      routeSettings: routeSettings ?? const RouteSettings(name: "PopupMenu"),
      useRootNavigator: useRootNavigator,
      requestFocus: requestFocus,
      shadowColor: shadowColor ?? Theme.of(context).colorScheme.outline,
      surfaceTintColor:
          surfaceTintColor ?? Theme.of(context).colorScheme.primaryContainer,
      popUpAnimationStyle: popUpAnimationStyle,
    );
  }

  static Widget buildRadio(
    BuildContext context, {
    required bool selected,
    required Function(bool) onChanged,
    String label = "Radio",
    Color? activeColor,
    Color? fillColor,
    MaterialTapTargetSize materialTapTargetSize = MaterialTapTargetSize.padded,
    VisualDensity? visualDensity,
    MouseCursor? mouseCursor,
    FocusNode? focusNode,
    bool autofocus = false,
    Color? focusColor,
    Color? hoverColor,
    Color? overlayColor,
    double? splashRadius,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Radio<bool>(
          value: true,
          groupValue: selected ? true : null,
          onChanged: (value) => onChanged(value ?? false),
          activeColor: activeColor ?? Theme.of(context).colorScheme.secondary,
          fillColor: fillColor != null ? MaterialStateProperty.all(fillColor) : null,
          materialTapTargetSize: materialTapTargetSize,
          visualDensity: visualDensity,
          mouseCursor: mouseCursor,
          focusNode: focusNode,
          autofocus: autofocus,
          focusColor: focusColor,
          hoverColor: hoverColor,
          overlayColor: overlayColor != null ? MaterialStateProperty.all(overlayColor) : null,
          splashRadius: splashRadius,
        ),
      ],
    );
  }


  static Widget defaultCheckbox(
    BuildContext context, {
    required bool value,
    required Function(bool?) onChanged,
    String label = "Checkbox",
    bool autofocus = false,
    bool isError = false,
    bool tristate = false,
    double splashRadius = 20,
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(4)),
    MouseCursor mouseCursor = MouseCursor.defer,
    FocusNode? focusNode,
    MaterialTapTargetSize materialTapTargetSize = MaterialTapTargetSize.padded,
    // VisualDensity visualDensity = VisualDensity.adaptivePlatformDensity,
    String? semanticLabel = "Checkbox",
  }) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: Theme.of(context).colorScheme.primary,
          checkColor: Theme.of(context).colorScheme.secondary,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          autofocus: autofocus,
          focusColor: Theme.of(context).colorScheme.primary,
          hoverColor: Theme.of(context).colorScheme.secondaryContainer,
          materialTapTargetSize: materialTapTargetSize,
          mouseCursor: mouseCursor,
          focusNode: focusNode ?? FocusNode(),
          fillColor: WidgetStatePropertyAll(
              Theme.of(context).colorScheme.primaryContainer),
          isError: isError,
          overlayColor: WidgetStatePropertyAll(
              Theme.of(context).colorScheme.outline),
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
            width: 1,
          ),
          semanticLabel: semanticLabel,
          splashRadius: splashRadius,
          tristate: tristate,
          // visualDensity: visualDensity,
        ),
        Text(label),
      ],
    );
  }



  static Widget buildSwitch(
    BuildContext context, {
    required bool value,
    required Function(bool) onChanged,
    String label = "Switch",
    Color? activeColor,
    Color? activeTrackColor,
    Color? inactiveThumbColor,
    Color? inactiveTrackColor,
    MaterialTapTargetSize? materialTapTargetSize = MaterialTapTargetSize.padded,
    MouseCursor? mouseCursor,
    FocusNode? focusNode,
    bool autofocus = false,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    Color? focusColor,
    Color? hoverColor,
    Color? overlayColor,
    double? splashRadius,
    EdgeInsetsGeometry? padding,
    WidgetStatePropertyAll<Color?>? trackOutlineColor,
    WidgetStatePropertyAll<double?>? trackOutlineWidth,
    WidgetStatePropertyAll<Color?>? trackColor,
    WidgetStatePropertyAll<Color?>? thumbColor,
    WidgetStatePropertyAll<Icon?>? thumbIcon,
    ImageProvider? activeThumbImage,
    ImageProvider? inactiveThumbImage,
    void Function(bool)? onFocusChange,
    void Function(Object, StackTrace?)? onActiveThumbImageError,
    void Function(Object, StackTrace?)? onInactiveThumbImageError,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: Theme.of(context).colorScheme.secondary,
          activeTrackColor: activeTrackColor,
          inactiveThumbColor: inactiveThumbColor,
          inactiveTrackColor: inactiveTrackColor,
          materialTapTargetSize: materialTapTargetSize,
          mouseCursor: mouseCursor,
          focusNode: focusNode,
          autofocus: autofocus,
          dragStartBehavior: dragStartBehavior,
          focusColor: focusColor,
          hoverColor: hoverColor,
          overlayColor: overlayColor != null
              ? WidgetStatePropertyAll(overlayColor)
              : null,
          splashRadius: splashRadius,
          thumbIcon: thumbIcon,
          thumbColor: thumbColor,
          trackColor: trackColor,
          trackOutlineColor: trackOutlineColor,
          trackOutlineWidth: trackOutlineWidth,
          padding: padding,
          activeThumbImage: activeThumbImage,
          inactiveThumbImage: inactiveThumbImage,
          onFocusChange: onFocusChange,
          onActiveThumbImageError: onActiveThumbImageError,
          onInactiveThumbImageError: onInactiveThumbImageError,
        ),
      ],
    );
  }

  static Widget buildCupertinoRadio(
    BuildContext context, {
    required bool selected,
    required Function(bool) onChanged,
    String label = "Radio",
    Color? activeColor,
    Color? inactiveColor,
    EdgeInsetsGeometry? padding,
  }) {
    return GestureDetector(
      onTap: () => onChanged(!selected),
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: CupertinoTheme.of(context).textTheme.textStyle,
            ),
            Container(
              width: 22.0,
              height: 22.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: selected 
                    ? activeColor ?? CupertinoTheme.of(context).primaryColor 
                    : inactiveColor ?? CupertinoColors.inactiveGray,
                  width: 2.0,
                ),
              ),
              child: selected
                  ? Center(
                      child: Container(
                        width: 12.0,
                        height: 12.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: activeColor ?? CupertinoTheme.of(context).primaryColor,
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  static Widget buildCupertinoSwitch(
    BuildContext context, {
    required bool value,
    required Function(bool) onChanged,
    String label = "Switch",
    Color? activeColor,
    Color? thumbColor,
    EdgeInsetsGeometry? padding,
    FocusNode? focusNode,
    bool autofocus = false,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: CupertinoTheme.of(context).textTheme.textStyle,
        ),
        CupertinoSwitch(
          value: value,
          onChanged: onChanged,
          activeColor: activeColor ?? CupertinoTheme.of(context).primaryColor,
          thumbColor: thumbColor ?? CupertinoColors.white,
          trackColor: CupertinoColors.inactiveGray,
          dragStartBehavior: dragStartBehavior,
        ),
      ],
    );
  }


/// Shows a Cupertino-style date picker dialog and returns the selected date
  Future<DateTime?> showCupertinoDatePicker({
    required BuildContext context,
    DateTime? initialDate,
    DateTime? minimumDate,
    DateTime? maximumDate,
    CupertinoDatePickerMode mode = CupertinoDatePickerMode.date,
    String? confirmText,
    String? cancelText,
    Color? backgroundColor,
    double? height,
    bool use24hFormat = false,
    int? minuteInterval,
    double itemExtent = 32.0,
    ValueChanged<DateTime>? onDateTimeChanged,
    bool useShortMonthNames = false,
    bool useShortDayNames = true,
  }) {
    final initialDateTime = initialDate ?? DateTime.now();
    final completer = Completer<DateTime?>();
    DateTime? selectedDate = initialDateTime;

    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: height ?? 300,
          color: backgroundColor ?? CupertinoTheme.of(context).scaffoldBackgroundColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    child: Text(cancelText ?? 'Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                      completer.complete(null);
                    },
                  ),
                  CupertinoButton(
                    child: Text(confirmText ?? 'Confirm'),
                    onPressed: () {
                      Navigator.of(context).pop();
                      completer.complete(selectedDate);
                    },
                  ),
                ],
              ),
              Expanded(
                child: CupertinoDatePicker(
                  mode: mode,
                  initialDateTime: initialDateTime,
                  minimumDate: minimumDate,
                  maximumDate: maximumDate,
                  use24hFormat: use24hFormat,
                  minuteInterval: minuteInterval ?? 1,
                  itemExtent: itemExtent,
                  onDateTimeChanged: (DateTime newDate) {
                    selectedDate = newDate;
                    if (onDateTimeChanged != null) {
                      onDateTimeChanged(newDate);
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
    return completer.future;
  }

  /// Helper function to pick a date with sensible defaults
  Future<DateTime?> pickCupertinoDate(
    BuildContext context, {
    DateTime? initialDate,
    DateTime? minimumDate,
    DateTime? maximumDate,
  }) async {
    return await showCupertinoDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      minimumDate: minimumDate ??
          DateTime(
            DateTime.now().year - 6,
            DateTime.now().month,
            DateTime.now().day,
          ),
      maximumDate: maximumDate ??
          DateTime(
            DateTime.now().year,
            DateTime.now().month + 3,
            DateTime.now().day,
          ),
    );
  }
}


