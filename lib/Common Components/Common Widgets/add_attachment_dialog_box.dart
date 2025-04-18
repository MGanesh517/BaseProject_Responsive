import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gowri_seva_sangam/App%20Constants/app_constants.dart';
import 'package:gowri_seva_sangam/Common%20Components/Common%20Widgets/priamaryGradientCOntainer.dart';

class AddAttachmentsAlertDialog extends StatefulWidget {
  final void Function() onTapCamera;
  final void Function() onTapGAllery;
  final void Function() onTapDocuments;
  // final bool? isGalleryAvailable;
  // final bool? isDocumentAvailable;
  const AddAttachmentsAlertDialog(
      {super.key,
      required this.onTapCamera,
      required this.onTapDocuments,
      // this.isGalleryAvailable,
      // this.isDocumentAvailable,
      required this.onTapGAllery});
  @override
  State<AddAttachmentsAlertDialog> createState() => _AddAttachmentsAlertDialog();
}

class _AddAttachmentsAlertDialog extends State<AddAttachmentsAlertDialog> {
  @override
  void initState() {
    super.initState();
    // getPermissionSheet();
  }

  // void getPermissionSheet() async {
  //   Map<Permission, PermissionStatus> statuses = await [
  //     Permission.photos,
  //     Permission.camera,
  //   ].request();

  //   if (statuses[Permission.camera] == PermissionStatus.permanentlyDenied) {
  //     Get.dialog(CameraPermissionDialogWidget());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
      title: Text(
        "Upload Files",
        style: TextStyle(
          fontSize: Get.height * AppConstants.themeConstants.fontsize_16,
          fontWeight: FontWeight.w600,
          color: Theme.of(context).colorScheme.surface,
        ),
        textAlign: TextAlign.center,
      ),
      content: Wrap(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: widget.onTapCamera,
            child: GradientButtonContainer(
              width: Get.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(
                    Icons.camera_alt_outlined,
                    size: 18,
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                  Container(
                    width: Get.width * 10 / 414,
                  ),
                  Text(
                    "Take a picture",
                    style: TextStyle(
                      fontSize: Get.height * AppConstants.themeConstants.fontsize_14,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                  ),
                ]),
              ),
            ),
          ),
          Container(height: Get.height * 20 / 896),
          GestureDetector(
            onTap: widget.onTapGAllery,
            child: GradientButtonContainer(
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Icon(
                      Icons.photo_library_outlined,
                      size: 18,
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                    Container(
                      width: Get.width * 10 / 414,
                    ),
                    Text(
                      "Select from photos",
                      style: TextStyle(
                        fontSize: Get.height * AppConstants.themeConstants.fontsize_14,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.primaryContainer,
                      ),
                    ),
                  ]),
                )),
          ),
          Container(height: Get.height * 20 / 896),
          GestureDetector(
              onTap: widget.onTapGAllery,
              child: GradientButtonContainer(
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Icon(
                        Icons.attach_file_outlined,
                        size: 18,
                        color: Theme.of(context).colorScheme.primaryContainer,
                      ),
                      Container(
                        width: Get.width * 10 / 414,
                      ),
                      Text(
                        "Select a document",
                        style: TextStyle(
                          fontSize: Get.height * AppConstants.themeConstants.fontsize_14,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.primaryContainer,
                        ),
                      ),
                    ]),
                  ))),
        ],
      ),
    );
  }
}
