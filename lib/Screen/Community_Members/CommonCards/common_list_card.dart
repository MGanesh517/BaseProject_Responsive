import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gowri_seva_sangam/App%20Constants/app_constants.dart';

class CommonListMemberCard extends StatefulWidget {
  final String image;
  final String name;
  final String email;
  final String emailId;
  final void Function() onTap;

  const CommonListMemberCard({
    super.key,
    required this.onTap,
    required this.image,
    required this.name,
    required this.email,
    required this.emailId,
  });

  @override
  State<CommonListMemberCard> createState() => _CommonListMemberCardState();
}

class _CommonListMemberCardState extends State<CommonListMemberCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Card(
        elevation: 0.0,
        margin: EdgeInsets.symmetric(vertical: 3.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildProfileImage(widget.image, widget.name),
              SizedBox(width: Get.width * 10 / 414),
              Flexible(child: buildUserInfo(context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProfileImage(String imageUrl, String name) {
    return Container(
      width: 60,
      height: Get.height * 60 / 896,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: ClipOval(
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, _, __) => fallbackProfileIcon(name),
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Widget fallbackProfileIcon(String? fullname) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: generateLightColor(),
      ),
      child: Center(
        child: Text(
          (fullname != null && fullname.isNotEmpty) ? fullname[0].toUpperCase() : '?',
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Color generateLightColor() {
    final Random random = Random();
    return Color.fromARGB(
      255,
      200 + random.nextInt(56),
      200 + random.nextInt(56),
      200 + random.nextInt(56),
    );
  }

  Widget buildUserInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.name,overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: Get.height * AppConstants.themeConstants.fontsize_14,
            color: Theme.of(context).colorScheme.surface,overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 3),
        buildInfoRow('Email Id : ', widget.emailId, context),
        const SizedBox(height: 3),
        buildInfoRow('Mobile Number : ', widget.email, context),
      ],
    );
  }

  Widget buildInfoRow(String label, String value, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: Get.height * AppConstants.themeConstants.fontsize_13,
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.w500,
          ),
        ),
        Flexible(
          child: Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: Get.height * AppConstants.themeConstants.fontsize_13,
              color: Theme.of(context).colorScheme.surface,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
