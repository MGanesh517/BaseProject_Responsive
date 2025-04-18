import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(height != null ? height! : 56.0);
  final GlobalKey<ScaffoldState>? drawerKey;

  final Color? appBarBGColor;
  final VoidCallback? leadingLink;
  final Widget? leadingChild;
  final Widget? titleChild;
  final double? height;
  final List<Widget>? actionsWidget;
  final bool? centerTitle;
  const CustomAppBar(
      {super.key,
      this.appBarBGColor,
      this.leadingLink,
      this.leadingChild,
      this.titleChild,
      this.actionsWidget,
      this.drawerKey,
      this.centerTitle,
      this.height});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0.0,
      backgroundColor: appBarBGColor == null ? Theme.of(context).colorScheme.secondaryContainer : Colors.white,
      leading: leadingChild != null
          ? Align(
              alignment: Alignment.center,
              child: InkWell(
                highlightColor: Colors.transparent,
                onTap: leadingLink,
                child: leadingChild,
              ),
            )
          : null,
      title: titleChild,
      actions: actionsWidget,
      centerTitle: centerTitle,
    );
  }
}
