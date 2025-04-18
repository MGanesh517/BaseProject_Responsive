
import 'package:flutter/material.dart';

class Breadcrumb extends StatelessWidget {
  final List<BreadcrumbItem> items;

  const Breadcrumb({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: List.generate(items.length * 2 - 1, (index) {
        if (index.isEven) {
          final item = items[index ~/ 2];
          return GestureDetector(
            onTap: item.onTap,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (item.icon != null) ...[
                  item.icon!,
                  const SizedBox(width: 4),
                ],
                Text(
                  item.label,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          );
        } else {

////////  Seperator ::::   Chevron Right Icon ( Greater Than >)

          // return const Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 4),
          //   child: Icon(Icons.chevron_right, size: 20),
          // );

////////  Seperator ::::   Slash ( / )
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: Text("/"),
          );
        }
      }),
    );
  }
}


class BreadcrumbItem {
  final String label;
  final VoidCallback onTap;
  final Icon? icon;

  BreadcrumbItem({required this.label, required this.onTap, this.icon});
}
