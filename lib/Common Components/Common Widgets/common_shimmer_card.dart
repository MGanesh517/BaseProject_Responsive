import 'package:gowri_seva_sangam/Common%20Components/Common%20Widgets/common_shadowed_container_widget.dart';
import 'package:gowri_seva_sangam/Common%20Components/Common%20Widgets/common_shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonShimmerCard extends StatelessWidget {
  const CommonShimmerCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShadowContainer(
      defaultRadius: false,
      radius: 8,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Flexible(
                  child: ShimmerWidget.rectangular(
                    height: Get.height * 10 / 896,
                  ),
                ),
                Container(width: Get.width * 10 / 414),
                Flexible(
                  child: ShimmerWidget.rectangular(
                    height: Get.height * 10 / 896,
                  ),
                ),
              ],
            ),
            Container(height: Get.height * 10 / 896),
            Row(
              children: [
                Flexible(
                  child: ShimmerWidget.rectangular(
                    height: Get.height * 10 / 896,
                  ),
                ),
                Container(width: Get.width * 10 / 414),
                Flexible(
                  child: ShimmerWidget.rectangular(
                    height: Get.height * 10 / 896,
                  ),
                ),
              ],
            ),
            Container(height: Get.height * 10 / 896),
            Row(
              children: [
                Flexible(
                  child: ShimmerWidget.rectangular(
                    height: Get.height * 10 / 896,
                  ),
                ),
                Container(width: Get.width * 10 / 414),
                Spacer()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
