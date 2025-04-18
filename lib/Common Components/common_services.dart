import 'dart:io';

import 'package:gowri_seva_sangam/Common%20Components/Common%20Widgets/common_loading_widget.dart';
import 'package:gowri_seva_sangam/Common%20Components/Common%20Widgets/common_snackbar.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';


class CommonService {
  static final CommonService _singleton = CommonService._internal();
  CommonService._internal();
  static CommonService get instance => _singleton;

  RegExp passwordPattern = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');

  RegExp gstinPattern = RegExp(r'^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$');

  RegExp ifscCode = RegExp(r'^[A-Z]{4}[0-9]{7}$');

  TextEditingController availableStock = TextEditingController();

  int pageSize = 15;
  String deviceId = "";
  String deviceName = "";
  String deviceType = "";
  int counter = 0;
  String fullname = "";
  String accessToken = "";
  String refreshToken = "";
  String username = "";
  // String retailerName = "";
  // String retailerId = "";
  String userProfile = "";
  String userId = "";
  String userMobile = "";
  String userEmail = "";
  List<String> permissions = [];
  String? pushToken;
  String? apnsToken;
  bool isFirstTime = false;
  bool rememberMe = false;

  PackageInfo packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );


  Future<XFile?> compressImage(XFile imageFile) async {
    try {
      final Directory tempDir = await getTemporaryDirectory();
      final String targetPath = '${tempDir.path}/compressed_${DateTime.now().millisecondsSinceEpoch}.jpg';

      var result = await FlutterImageCompress.compressAndGetFile(
        imageFile.path, // Make sure this is a valid file path
        targetPath,
        quality: 70, // Reduce quality (0-100)
      );

      if (result == null) {
        throw Exception("Compression failed, result is null.");
      }

      return XFile(result.path);
    } catch (e) {
      print("Error during image compression: $e");
      return null;
    }
  }

  static Future<FilePickerResult?> documentPicker() async {
    // showLoadingDialog();
    FilePickerResult? file;
    showLoadingDialog();
    file = await FilePicker.platform.pickFiles(allowMultiple: false);
    // controller.uploadImage(File(file.path));
    closeLoadingDialog();
    return file;
  }

  static Future<XFile?> camerImagePicker() async {
// showLoadingDialog();
    final ImagePicker picker = ImagePicker();
    XFile file;
    showLoadingDialog();
    file = (await picker.pickImage(source: ImageSource.camera))!;
    // controller.uploadImage(File(file.path));
    closeLoadingDialog();
    return file;
  }

  static Future<FilePickerResult?> galleryImagePicker() async {
    // showLoadingDialog();
    // final ImagePicker picker = ImagePicker();
    FilePickerResult? file;
    showLoadingDialog();
    file = (await FilePicker.platform.pickFiles(type: FileType.image))!;
    // controller.uploadImage(File(file.path));
    closeLoadingDialog();
    return file;
  }

  String reformatDateString(String dateString) {
    // Split the original date string into components
    List<String> components = dateString.split(' ');

    // Extract date and time components
    String date = components[0];
    String time = components[1];

    // Split the date component into day, month, and year
    List<String> dateComponents = date.split('/');
    int month = int.parse(dateComponents[0]);
    int day = int.parse(dateComponents[1]);
    int year = int.parse(dateComponents[2]);

    // Convert 12-hour time format to 24-hour time format
    if (time.endsWith('AM')) {
      time = time.replaceAll(' AM', '');
    } else {
      time = time.replaceAll(' PM', '');
      List<String> timeComponents = time.split(':');
      int hour = int.parse(timeComponents[0]);
      hour = (hour % 12) + 12; // Convert to 24-hour format
      time = '$hour:${timeComponents[1]}:${timeComponents[2]}';
    }

    // Return the reformatted date string
    return '$year-${_addLeadingZero(month)}-${_addLeadingZero(day)}T$time';
  }

  String _addLeadingZero(int value) {
    return value.toString().padLeft(2, '0');
  }

  Future<void> openFile(String path) async {
    final result = await OpenFile.open(path);
    if (result.type != ResultType.done) {
      print('Failed to open $path: ${result.message}');
    }
  }
  Future openFile1({required String url, String? fileName}) async {
    final name = fileName ?? url.split('/').last;
    final file = await download(url, name);
    if (file == null) return;
    OpenFile.open(file.path);
  }
  Future download(String url, String filename) async {
    String dir = Platform.isIOS ? (await getApplicationDocumentsDirectory()).path : '/storage/emulated/0/Download';

    // var savePath = '/storage/emulated/0/Download/$filename';
    var dio = Dio();
    dio.interceptors.add(LogInterceptor());
    try {
      var response = await dio.get(
        url,
        // onReceiveProgress: showDo,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          receiveTimeout: const Duration(seconds: 100),
        ),
      );
      File file = File('$dir/$filename');
      var raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();
      showSnackBar(
        title: "Success...!",
        message: 'Download completed',
        icon: const Icon(Icons.check_circle_outline, color: Colors.green),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<DateTime?> pickDate(BuildContext context, {DateTime? initialDate, DateTime? lastDate, DateTime? firstDate}) async {
    return await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      lastDate: lastDate ??
          DateTime(
            DateTime.now().year,
            DateTime.now().month + 3,
            DateTime.now().day,
          ),
      firstDate: firstDate ??
          DateTime(
            DateTime.now().year - 6,
            DateTime.now().month,
            DateTime.now().day,
          ),
    );
  }
}
