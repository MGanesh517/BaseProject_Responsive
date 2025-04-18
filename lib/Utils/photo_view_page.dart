import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewPage extends StatelessWidget {
  final String photo;
  final String type;
  PhotoViewPage({Key? key, required this.photo, required this.type}) : super(key: key);
  final controller = Get.put(PhotoController());
  // final controller = Get.put(PurchaseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
              onTap: () {
                controller.zoomImage();
              },
              child: const Icon(Icons.zoom_in)),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
              onTap: () {
                controller.zoomOutImage();
              },
              child: const Icon(Icons.zoom_out)),
          const SizedBox(
            width: 10,
          ),
          const SizedBox(
            width: 15,
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: SizedBox(
        child: RepaintBoundary(
          // key: controller.previewinvoice,
          child: Obx(() => type == 'local'
              ? PhotoView(
                  // enableRotation: true,
                  customSize: Size.fromHeight(double.parse(controller.zoomIn.value.toString())),
                  controller: PhotoViewController(),
                  disableGestures: true,
                  enablePanAlways: false,
                  imageProvider: FileImage(File(photo)),
                )
              : PhotoView(
                  // enableRotation: true,
                  customSize: Size.fromHeight(double.parse(controller.zoomIn.value.toString())),
                  controller: PhotoViewController(),
                  disableGestures: true,
                  enablePanAlways: false,
                  imageProvider: NetworkImage(photo),
                )),
        ),
      ),
    );
  }
}


class PhotoController extends GetxController {
  static PhotoController get to => Get.find();

  RxInt zoomIn = 400.obs;
  zoomImage() {
    if (zoomIn.value == 400) {
      zoomIn.value = 500;
    } else if (zoomIn.value == 500) {
      zoomIn.value = 600;
    }
  }

  zoomOutImage() {
    if (zoomIn.value == 600) {
      zoomIn.value = 500;
    } else if (zoomIn.value == 500) {
      zoomIn.value = 400;
    }
  }
}



// var data = {
//   "transferstatus": 2
// };
