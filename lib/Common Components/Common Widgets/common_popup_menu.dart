import 'package:flutter/material.dart';

class CustomPopupMenuItem<T> {
  final T value;
  final String label;
  final IconData? icon;
  final bool enabled;
  final bool isSelected;

  CustomPopupMenuItem({
    required this.value,
    required this.label,
    this.icon,
    this.enabled = true,
    this.isSelected = false,
  });
}

class CommonPopupMenu<T> extends StatelessWidget {
  final List<CustomPopupMenuItem<T>> items;
  final Function(T) onSelected;
  final Widget? child;
  final String? tooltip;
  final IconData? icon;
  final Color? iconColor;
  final double? iconSize;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final Color? textColor;

  const CommonPopupMenu({
    super.key,
    required this.items,
    required this.onSelected,
    this.child,
    this.tooltip,
    this.icon = Icons.more_vert,
    this.iconColor,
    this.iconSize = 24.0,
    this.padding,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PopupMenuButton<T>(
      offset: Offset(-30, 50),
      tooltip: tooltip,
      icon: icon != null
          ? Icon(
              icon,
              color: iconColor ?? theme.iconTheme.color,
              size: iconSize,
            )
          : null,
      padding: padding ?? EdgeInsets.zero,
      onSelected: onSelected,
      itemBuilder: (context) => items.map((item) {
        return PopupMenuItem<T>(
          value: item.value,
          enabled: item.enabled,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                if (item.icon != null) ...[
                  Icon(
                    item.icon,
                    color: item.enabled
                        ? (textColor ?? theme.textTheme.bodyLarge?.color)
                        : theme.disabledColor,
                    size: 20,
                  ),
                  const SizedBox(width: 12),
                ],
                Expanded(
                  child: Text(
                    item.label,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: item.enabled
                          ? (textColor ?? theme.textTheme.bodyLarge?.color)
                          : theme.disabledColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: theme.dividerColor),
        borderRadius: BorderRadius.circular(8),
      ),
      color: backgroundColor ?? theme.popupMenuTheme.color,
      elevation: 3,
      child: child,
    );
  }
}
