import 'package:flutter/material.dart';
import 'package:get/get.dart';

showSnackBar({required String title, required String message, Widget? icon, Widget? messageText}) {
  Get.snackbar(
    title,
    message,
    messageText: messageText,
    borderRadius: (10),
    boxShadows: [
      BoxShadow(
        color: Get.theme.colorScheme.primaryContainer,
      ),
    ],
    margin: const EdgeInsets.all(15),
    duration: const Duration(seconds: 4),
    isDismissible: true,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}
