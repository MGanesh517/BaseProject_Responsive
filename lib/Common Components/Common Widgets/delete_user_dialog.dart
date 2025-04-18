import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gowri_seva_sangam/App%20Constants/app_constants.dart';

// class DeleteUserDialog extends StatelessWidget {
//   final Color? color;
//   DeleteUserDialog({super.key, this.color})
//   final loginController = Get.put(LoginController());

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//         contentPadding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
//         title: const Text(
//           "Are you sure you want to delete?",
//           textAlign: TextAlign.center,
//         ),
//         actions: [
//           Row(
//             children: [
//               Flexible(
//                 child: Container(
//                   // onlyBottomRadius: false, radius: 8,
//                   // decoration: BoxDecoration(
//                   //     gradient: LinearGradient(colors: [Color.fromRGBO(242, 83, 112, 1), Color.fromRGBO(140, 48, 65, 1)]),
//                   //     borderRadius: BorderRadius.circular(10)),
//                   decoration: BoxDecoration(
//                     color: Theme.of(context).colorScheme.primaryContainer,
//                     borderRadius: BorderRadius.circular(8),
//                     border: Border.all(color: Theme.of(context).colorScheme.outline)
//                   ),
//                   child: MaterialButton(
//                     height: Get.height * 45 / 896,
//                     elevation: 0.0,
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//                     // color: Colors.red,
//                     onPressed: () {
//                     // Future.delayed(Duration.zero, () {
//                     //   loginController.logoutServiceCall(title: 'logout').then((val) {
//                     //     // homeController.onchangeIndex(0);
//                     //   });
//                     // });
//                   },
//                     child: Center(
//                         child: Text(
//                       "Yes",overflow: TextOverflow.ellipsis,
//                       style: TextStyle(
//                         fontSize: Get.height * AppConstants.themeConstants.fontsize_14,
//                         fontWeight: FontWeight.w600,
//                         color: Theme.of(context).colorScheme.primary,overflow: TextOverflow.ellipsis
//                       ),
//                     )),
//                   ),
//                 )),
//               Container(
//                 width: Get.width * 20 / 414,
//               ),
//               Flexible(
//                 child: Container(
//                   // onlyBottomRadius: false, radius: 8,
//                   // decoration: BoxDecoration(
//                   //     gradient: LinearGradient(colors: [Color.fromRGBO(242, 83, 112, 1), Color.fromRGBO(140, 48, 65, 1)]),
//                   //     borderRadius: BorderRadius.circular(10)),
//                   decoration: BoxDecoration(
//                     color: Theme.of(context).colorScheme.secondary,
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: MaterialButton(
//                     height: Get.height * 45 / 896,
//                     elevation: 0.0,
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//                     // color: Colors.red,
//                     onPressed: () {
//                       Get.back();
//                     },
//                     child: Center(
//                         child: Text("No",overflow: TextOverflow.ellipsis,
//                             style: TextStyle(
//                               fontSize: Get.height * AppConstants.themeConstants.fontsize_14,
//                               fontWeight: FontWeight.w600,
//                               color: Theme.of(context).colorScheme.primaryContainer,overflow: TextOverflow.ellipsis
//                             ))),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ]);
//   }
// }

class DeleteUserDialog extends StatelessWidget {
  final String userId;
  final VoidCallback onDeleteConfirmed;
  
  const DeleteUserDialog({
    super.key,
    required this.userId,
    required this.onDeleteConfirmed,
  });

  @override
  Widget build(BuildContext context) {
    print("Printing The UserID ::::::: $userId   , $onDeleteConfirmed");
    return AlertDialog(
      contentPadding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
      title: const Text(
        "Are you sure you want to delete?",
        textAlign: TextAlign.center,
      ),
      actions: [
        Row(
          children: [
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Theme.of(context).colorScheme.outline)
                ),
                child: MaterialButton(
                  height: Get.height * 45 / 896,
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  onPressed: () {
                    Get.back();
                    onDeleteConfirmed();
                  },
                  child: Center(
                    child: Text(
                      "Yes",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: Get.height * AppConstants.themeConstants.fontsize_14,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    )
                  ),
                ),
              )
            ),
            Container(width: Get.width * 20 / 414),
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: MaterialButton(
                  height: Get.height * 45 / 896,
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  onPressed: () {
                    Get.back();
                  },
                  child: Center(
                    child: Text(
                      "No",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: Get.height * AppConstants.themeConstants.fontsize_14,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.primaryContainer,
                      )
                    )
                  ),
                ),
              ),
            ),
          ],
        ),
      ]
    );
  }
}