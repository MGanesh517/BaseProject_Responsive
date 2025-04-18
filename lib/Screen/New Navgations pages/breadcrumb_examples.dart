import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gowri_seva_sangam/Screen/Scaffold%20Custom%20Appbar/custom_appbar.dart';
import 'package:gowri_seva_sangam/Utils/breadcrumb_fucntion.dart';

class BreadcrumbFucntion extends StatelessWidget {
  const BreadcrumbFucntion({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffoldWithAppBar(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Breadcrumb(
              items: [
                BreadcrumbItem(
                  label: 'Home',
                  icon: Icon(Icons.home),
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/seconsdPageScreen');
              },
              child: const Text("Go to Second Page"),
            ),
            const Text("This is First page ", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

class SeconsdPageScreen extends StatelessWidget {
  const SeconsdPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffoldWithAppBar(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Breadcrumb(
              items: [
                BreadcrumbItem(
                  label: 'Home',
                  icon: const Icon(Icons.home),
                  onTap: () {
                    Get.toNamed('/breadcrumbFucntion');
                  },
                ),
                BreadcrumbItem(
                  label: 'Second',
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/thirdPageScreen');
              },
              child: const Text("Go to Third Page"),
            ),
            const Text("This is Second page ", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

class ThirdPageScreen extends StatelessWidget {
  const ThirdPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffoldWithAppBar(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Breadcrumb(
              items: [
                BreadcrumbItem(
                  label: 'Home',
                  icon: const Icon(Icons.home),
                  onTap: () {
                    Get.toNamed('/breadcrumbFucntion');
                  },
                ),
                BreadcrumbItem(
                  label: 'Second',
                  onTap: () {
                    Get.toNamed('/seconsdPageScreen');
                  },
                ),
                BreadcrumbItem(label: 'Third', onTap: () {}),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text("This is Third Page"),
            ),
            const Text("This is Third page ", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
