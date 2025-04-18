import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gowri_seva_sangam/BreakPoints/breakpoints.dart';
import 'package:gowri_seva_sangam/Screen/Scaffold%20Custom%20Appbar/custom_appbar.dart';
import 'package:responsive_toolkit/responsive_toolkit.dart';

class UploadDocumentUiExamples extends StatelessWidget {
  const UploadDocumentUiExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffoldWithAppBar(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.defaultDialog(
                  content: Container(
                    height: 100,
                    width: 200,
                    color: Colors.white,
                  ),
                );
              },
              child: CustomPaint(
                painter: DottedBorderPainter(borderRadius: BorderRadius.circular(15.0)),
                child: Container(
                  constraints: const BoxConstraints(
                    maxHeight: 200,
                    minWidth: 300,
                    maxWidth: 600,
                  ),
                  decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(15.0)
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.save_sharp, color: Colors.blue),
                      SizedBox(height: 10),
                      Text(
                        "Click or drag file to this area to upload",
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Support for a single or bulk upload. Strictly prohibited from uploading company data or other banned files.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 20.0),


            // GestureDetector(
            //           onTap: () {
            //             Get.defaultDialog(
            //               content: Container(
            //                 height: 100,
            //                 width: 200,
            //                 color: Colors.white,
            //               ),
            //             );
            //           },
            //           child: Container(
            //             height: 100,
            //             width: 100,
            //             decoration: BoxDecoration(
            //               shape: BoxShape.circle,
            //               border: Border.all(color: Colors.grey)
            //             ),
            //             child: Center(child: Text("auiasgyfugdsuyfgdsuyfgdsuyf")),
            //           )
            //         ),

            SizedBox(height: 20.0),

            SizedBox(
              width: double.infinity,
              child: ResponsiveRow(
                alignment: ResponsiveAlignment.spaceEvenly,
                columns: [
                ResponsiveColumn(ResponsiveConstants().twoBreakPoint, child: GestureDetector(
                  onTap: () {
                    Get.defaultDialog(
                      content: Container(
                        height: 100,
                        width: 200,
                        color: Colors.white,
                      ),
                    );
                  },
                  child: CustomPaint(
                  painter: DottedBorderPainter(borderRadius: BorderRadius.circular(10.0), color: Colors.red),
                  child: Container(
                    // decoration: BoxDecoration(),
                    width: 200,
                    height: 45,
                    child: MaterialButton(
                      // height: 45,
                      // minWidth: 200,
                      padding: EdgeInsets.all(10.0),
                      onPressed: () {},
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.upload_rounded, color: Colors.blue),
                        Text("Click to Upload"),
                      ],
                    ),),
                  ),
                                ),
                )),
              
              ResponsiveColumn(ResponsiveConstants().twoBreakPoint, child: GestureDetector(
                onTap: () {
                  Get.defaultDialog(
                    content: Container(
                      height: 100,
                      width: 200,
                      color: Colors.white,
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  width: 200,
                  height: 45,
                  child: MaterialButton(
                    // height: 45,
                    // minWidth: 200,
                    padding: EdgeInsets.all(10.0),
                    onPressed: () {},
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.upload_rounded, color: Colors.blue),
                      Text("Click to Upload"),
                    ],
                  ),),
                ),
              )),
              ]),
            ),


            SizedBox(height: 20.0),

            // SizedBox(
            //   width: double.infinity,
            //   child: ResponsiveRow(
            //     alignment: ResponsiveAlignment.spaceEvenly,
            //     columns: [
            //       /// Circular Avatar with Dotted Border
            //       ResponsiveColumn(
            //         ResponsiveConstants().twoBreakPoint,
            //         child: GestureDetector(
            //           onTap: () {
            //             Get.defaultDialog(
            //               content: Container(
            //                 height: 100,
            //                 width: 200,
            //                 color: Colors.white,
            //               ),
            //             );
            //           },
            //           child: CustomPaint(
            //             // painter: DottedBorderPainter(),
            //             child: Container(
            //               height: 100,
            //               width: 100,
            //               decoration: BoxDecoration(
            //                 shape: BoxShape.circle,
            //                 border: Border.all(color: Colors.grey)
            //               ),
            //               child: Center(child: Icon(Icons.add)),
            //             ),
            //           )
            //         ),
            //       ),

            //       /// Upload Button with Square Border
            //       ResponsiveColumn(
            //         ResponsiveConstants().twoBreakPoint,
            //         child: GestureDetector(
            //           onTap: () {
            //             Get.defaultDialog(
            //               content: Container(
            //                 height: 100,
            //                 width: 200,
            //                 color: Colors.white,
            //               ),
            //             );
            //           },
            //           child: CustomPaint(
            //             painter: DottedBorderPainter(borderRadius: BorderRadius.circular(10.0), color: Colors.red),
            //             child: Container(
            //               decoration: BoxDecoration(
            //                 border: Border.all(color: Colors.blue),
            //                 borderRadius: BorderRadius.circular(10.0),
            //               ),
            //               width: 100,
            //               height: 100,
            //               child: MaterialButton(
            //                 padding: const EdgeInsets.all(10.0),
            //                 onPressed: () {},
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.center,
            //                   children: const [
            //                     Icon(Icons.upload_rounded, color: Colors.blue),
            //                     SizedBox(width: 8),
            //                     Text("Click to Upload"),
            //                   ],
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // )

            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CommonDottedBorder(
                      shape: DottedBorderShape.circle,
                      child: Container(
                        height: 100,
                        width: 100,
                        padding: const EdgeInsets.all(2),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage('assets/svg_icons/dummy_image.jpeg'),
                          foregroundImage: AssetImage('assets/svg_icons/dummy_image.jpeg'),
                          // child: Icon(Icons.add),
                        ),
                      ),
                    ),

                    CommonDottedBorder(
                      shape: DottedBorderShape.circle,
                      child: Container(
                        height: 100,
                        width: 100,
                        padding: const EdgeInsets.all(2),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.add),
                              Text("Upload")
                            ],
                          ),
                        ),
                      ),
                    ),

                    CommonDottedBorder(
                      shape: DottedBorderShape.circle,
                      child: Container(
                        height: 100,
                        width: 100,
                        padding: const EdgeInsets.all(2),
                        child: CircleAvatar(
                          foregroundColor: Colors.grey[500],
                          backgroundColor: Colors.white,
                          child: Icon(Icons.delete),
                          // child: Icon(Icons.add),
                        ),
                      ),
                    ),

                    CommonDottedBorder(
                      shape: DottedBorderShape.circle,
                      child: Container(
                        height: 100,
                        width: 100,
                        padding: const EdgeInsets.all(2),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: CircularProgressIndicator(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CommonDottedBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      shape: DottedBorderShape.rectangle,
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0)
                        ),
                        alignment: Alignment.center,
                        child:  ClipRect(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/svg_icons/dummy_image.jpeg'),
                          ),
                        ),
                      ),
                    ),
                    
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(15.0)
                      ),
                        height: 200,
                        width: 200,
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.add),
                            Text("Square Upload")
                          ],
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 20),

                CommonDottedBorder(
                  shape: DottedBorderShape.roundedRectangle,
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    child: const Text("Rounded Rectangle"),
                  ),
                ),
              ],
            ),

PopupMenuDivider(),

PopupMenuButton(
  position: PopupMenuPosition.under,
  child: Icon(Icons.abc_outlined),
  itemBuilder: (context) {
  return [
    PopupMenuItem(child: Text("Data")),
    PopupMenuItem(child: Text("dgdf")),
    PopupMenuItem(child: Text("Dawerwersfsfsta")),
    PopupMenuItem(child: Text("Datdfgsa")),
    PopupMenuItem(child: Text("Dsdfata")),
    PopupMenuItem(child: Text("fsdfsdfsdfs")),
  ];
}),

        
        
        
        
        
        
        
        
            // CommonUpload(
            //   type: UploadType.picturesWall,
            //   files: ["https://via.placeholder.com/150"],
            //   isLoading: false,
            //   onUploadTap: () {
            //     print("Upload tapped");
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}





enum DottedBorderShape {
  circle,
  rectangle,
  roundedRectangle,
}

class CommonDottedBorder extends StatelessWidget {
  final Widget child;
  final DottedBorderShape shape;
  final BorderRadius? borderRadius;
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;

  const CommonDottedBorder({
    super.key,
    required this.child,
    this.shape = DottedBorderShape.rectangle,
    this.borderRadius,
    this.color = Colors.blue,
    this.strokeWidth = 2,
    this.dashWidth = 5,
    this.dashSpace = 3,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DottedPainter(
        shape: shape,
        borderRadius: borderRadius,
        color: color,
        strokeWidth: strokeWidth,
        dashWidth: dashWidth,
        dashSpace: dashSpace,
      ),
      child: child,
    );
  }
}

class _DottedPainter extends CustomPainter {
  final DottedBorderShape shape;
  final BorderRadius? borderRadius;
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;

  _DottedPainter({
    required this.shape,
    this.borderRadius,
    required this.color,
    required this.strokeWidth,
    required this.dashWidth,
    required this.dashSpace,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    Path path;
    switch (shape) {
      case DottedBorderShape.circle:
        path = Path()..addOval(Rect.fromLTWH(0, 0, size.width, size.height));
        break;
      case DottedBorderShape.roundedRectangle:
        final radius = borderRadius ?? BorderRadius.circular(10);
        final rrect = RRect.fromRectAndCorners(
          Offset.zero & size,
          topLeft: radius.topLeft,
          topRight: radius.topRight,
          bottomLeft: radius.bottomLeft,
          bottomRight: radius.bottomRight,
        );
        path = Path()..addRRect(rrect);
        break;
      case DottedBorderShape.rectangle:
      default:
        path = Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height));
    }

    final dashedPath = Path();
    for (PathMetric pathMetric in path.computeMetrics()) {
      double distance = 0.0;
      while (distance < pathMetric.length) {
        dashedPath.addPath(
          pathMetric.extractPath(distance, distance + dashWidth),
          Offset.zero,
        );
        distance += dashWidth + dashSpace;
      }
    }

    canvas.drawPath(dashedPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}






class DottedBorderPainter extends CustomPainter {
  final BorderRadius? borderRadius;
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;

  DottedBorderPainter({
    this.borderRadius,
    this.color = Colors.blue,
    this.strokeWidth = 2,
    this.dashWidth = 5,
    this.dashSpace = 3,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final rrect = RRect.fromRectAndCorners(
      Offset.zero & size,
      topLeft: borderRadius!.topLeft,
      topRight: borderRadius!.topRight,
      bottomLeft: borderRadius!.bottomLeft,
      bottomRight: borderRadius!.bottomRight,
    );

    final borderPath = Path()..addRRect(rrect);
    final dashPath = Path();

    for (PathMetric pathMetric in borderPath.computeMetrics()) {
      double distance = 0.0;
      while (distance < pathMetric.length) {
        dashPath.addPath(
          pathMetric.extractPath(distance, distance + dashWidth),
          Offset.zero,
        );
        distance += dashWidth + dashSpace;
      }
    }

    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}













enum UploadType {
  classic,
  defaultList,
  avatar,
  pictureCard,
  pictureCircle,
  picturesWall,
}

class CommonUpload extends StatelessWidget {
  final UploadType type;
  final List<String> files;
  final bool isLoading;
  final Function()? onUploadTap;

  const CommonUpload({
    super.key,
    required this.type,
    required this.files,
    this.onUploadTap,
    this.isLoading = false,
  });

  Widget _buildFile(
    String file, {
    double size = 50,
    BoxShape shape = BoxShape.rectangle,
  }) {
    return Container(
      margin: const EdgeInsets.all(4),
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: shape,
        border: Border.all(color: Colors.grey),
        image: DecorationImage(image: NetworkImage(file), fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildUploadButton({
    double size = 50,
    BoxShape shape = BoxShape.rectangle,
  }) {
    return InkWell(
      onTap: onUploadTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: shape,
          border: Border.all(color: Colors.grey),
        ),
        child:
            isLoading
                ? const Center(child: CircularProgressIndicator(strokeWidth: 2))
                : const Icon(Icons.upload_file),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case UploadType.classic:
        return ElevatedButton.icon(
          onPressed: onUploadTap,
          icon: const Icon(Icons.upload),
          label: const Text("Click to Upload"),
        );

      case UploadType.defaultList:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton.icon(
              onPressed: onUploadTap,
              icon: const Icon(Icons.upload),
              label: const Text("Upload"),
            ),
            const SizedBox(height: 8),
            ...files.map(
              (file) => Row(
                children: [
                  const Icon(Icons.attach_file, size: 16),
                  Expanded(child: Text(file)),
                  IconButton(icon: const Icon(Icons.delete), onPressed: () {}),
                ],
              ),
            ),
          ],
        );

      case UploadType.avatar:
        return GestureDetector(
          onTap: onUploadTap,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage:
                    files.isNotEmpty ? NetworkImage(files.first) : null,
                child: files.isEmpty ? const Icon(Icons.person) : null,
              ),
              if (isLoading)
                const Positioned.fill(
                  child: Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
            ],
          ),
        );

      case UploadType.pictureCard:
        return Row(
          children: [
            ...files.map((f) => _buildFile(f, size: 70)),
            _buildUploadButton(size: 70),
          ],
        );

      case UploadType.pictureCircle:
        return Row(
          children: [
            ...files.map(
              (f) => _buildFile(f, size: 70, shape: BoxShape.circle),
            ),
            _buildUploadButton(size: 70, shape: BoxShape.circle),
          ],
        );

      case UploadType.picturesWall:
        return Wrap(
          children: [
            ...files.map((f) => _buildFile(f, size: 100)),
            if (!isLoading) _buildUploadButton(size: 100),
            if (isLoading)
              const Padding(
                padding: EdgeInsets.all(8),
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Center(child: CircularProgressIndicator()),
                ),
              ),
          ],
        );
    }
  }
}
