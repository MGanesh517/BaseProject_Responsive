// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';

// class ProfileCard extends StatelessWidget {
//   final String? imageUrl;
//   final String name;
//   final String relationType;
//   final String phoneNumber;
//   final VoidCallback? onTap;

//   const ProfileCard({
//     super.key,
//     required this.name,
//     required this.phoneNumber,
//     this.imageUrl,
//     this.onTap,
//     required this.relationType,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // height: 150,
//       // width: 100,
//       child: GestureDetector(
//         onTap: onTap,
//         child: Card(
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//           elevation: 3,
//           child: Padding(
//             padding: const EdgeInsets.all(4.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // Container(
//                 //   height: 70,
//                 //   decoration: BoxDecoration(
//                 //     borderRadius: BorderRadius.circular(10.0),
//                 //     border: Border.all(color: Colors.grey)
//                 //   ),
//                 //   child: ClipOval(
//                 //     child: imageUrl != null && imageUrl!.isNotEmpty
//                 //         ? Image.network(
//                 //             imageUrl!,
//                 //             height: 60,
//                 //             width: 60,
//                 //             fit: BoxFit.cover,
//                 //             loadingBuilder: (context, child, loadingProgress) {
//                 //               if (loadingProgress == null) return child;
//                 //               return const Center(child: CircularProgressIndicator());
//                 //             },
//                 //             errorBuilder: (context, error, stackTrace) =>
//                 //                 const Icon(Icons.broken_image, size: 40),
//                 //           )
//                 //         : const Icon(Icons.image_not_supported, size: 40),
//                 //   ),
//                 // ),
//                 Container(
//                 padding: EdgeInsets.all(5.0),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(100),
//                 ),
//                 width: 90,
//                 height: 80,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   child: Image.network(
//                     imageUrl!,
//                     height: double.infinity,
//                     width: double.infinity,
//                     alignment: Alignment.center,
//                     fit: BoxFit.cover,
//                     loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
//                       if (loadingProgress == null) {
//                         return child;
//                       }
//                       return Center(
//                         child: CircularProgressIndicator(
//                           value: loadingProgress.expectedTotalBytes != null
//                               ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
//                               : null,
//                         ),
//                       );
//                     },
//                     errorBuilder: (BuildContext context, Object? exception, StackTrace? stackTrace) {
//                       return SizedBox(
//                         width: Get.width * 95 / 414,
//                         height: Get.height * 125 / 896,
//                         child: SvgPicture.asset(
//                           'assets/icons/no_image.svg',
//                           fit: BoxFit.fill,
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//                 const SizedBox(height: 8),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 4.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           SvgPicture.asset('assets/icons/user_outline.svg'),
//                           SizedBox(width: 2.0),
//                           Text(
//                             name,
//                             style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, overflow: TextOverflow.ellipsis),
//                             // textAlign: TextAlign.center,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 4),
//                       Row(
//                         children: [
//                           // SvgPicture.asset('assets/icons/user_outline.svg'),
//                           Icon(Icons.account_circle_rounded, size: 15.0),
//                           SizedBox(width: 2.0),
//                           Text(
//                             relationType,
//                             style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400, overflow: TextOverflow.ellipsis),
//                             // textAlign: TextAlign.center,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 4),
//                       Row(
//                         children: [
//                         SvgPicture.asset('assets/icons/phone.svg'),
//                         SizedBox(width: 2.0),
//                           Text(
//                             phoneNumber,
//                             style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400, overflow: TextOverflow.ellipsis),
//                             // textAlign: TextAlign.center,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProfileCard extends StatelessWidget {
  final String? imageUrl;
  final String name;
  final String relationType;
  final String phoneNumber;
  final VoidCallback? onTap;

  const ProfileCard({
    super.key,
    required this.name,
    required this.phoneNumber,
    this.imageUrl,
    this.onTap,
    required this.relationType,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image Container
              Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                width: Get.width * 0.22, // Responsive width
                height: Get.width * 0.22, // Keep aspect ratio
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: imageUrl != null && imageUrl!.isNotEmpty
                      ? Image.network(
                          imageUrl!,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes != null
                                    ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                                    : null,
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) =>
                              // SvgPicture.asset('assets/icons/no_image.svg', fit: BoxFit.fill),
                              SvgPicture.asset('assets/User.svg', fit: BoxFit.fill),
                        )
                      // : SvgPicture.asset('assets/icons/no_image.svg', fit: BoxFit.fill),
                            :  SvgPicture.asset('assets/User.svg', fit: BoxFit.fill),
                      
                ),
              ),
              const SizedBox(height: 8),

              // Text Information
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/user_outline.svg', width: 16),
                      const SizedBox(width: 4.0),
                      Expanded(
                        child: Text(
                          name,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),

                  Row(
                    children: [
                      Icon(Icons.account_circle_rounded, size: 16),
                      const SizedBox(width: 4.0),
                      Expanded(
                        child: Text(
                          relationType,
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),

                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/phone.svg', width: 16),
                      const SizedBox(width: 4.0),
                      Expanded(
                        child: Text(
                          phoneNumber,
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
