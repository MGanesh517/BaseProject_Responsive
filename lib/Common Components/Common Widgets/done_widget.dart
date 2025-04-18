import 'package:gowri_seva_sangam/App%20Constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoneWidget extends StatefulWidget {
  const DoneWidget({super.key});

  @override
  State<DoneWidget> createState() => _DoneWidgetState();
}

class _DoneWidgetState extends State<DoneWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Done',
          // gradientType: GradientType.radial,
          // colors: [Theme.of(context).colorScheme.secondary, Theme.of(context).colorScheme.secondaryContainer],
          style: TextStyle(
            fontSize: Get.height * AppConstants.themeConstants.fontsize_16,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
