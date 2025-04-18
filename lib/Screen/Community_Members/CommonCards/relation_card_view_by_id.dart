
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gowri_seva_sangam/App%20Constants/app_constants.dart';
import 'package:gowri_seva_sangam/Common%20Components/Common%20Widgets/delete_user_dialog.dart';
import 'package:gowri_seva_sangam/Screen/Community_Members/Controller/community_controller.dart';

class RelationListCard extends StatefulWidget {
  final String userId;
  final String image;
  final String name;
  final String mobileNumber;
  final String relationship;
  final void Function() onTap;
  final void Function()? onDelete;

  const RelationListCard({
    super.key,
    required this.userId,
    required this.onTap,
    required this.image,
    required this.name,
    required this.mobileNumber,
    required this.relationship,
    this.onDelete,
  });

  @override
  State<RelationListCard> createState() => _RelationListCardState();
}

class _RelationListCardState extends State<RelationListCard> {
  final communityController = Get.find<CommunityMembersController>();

  void _showDeleteConfirmationDialog() {
    Get.dialog(
      DeleteUserDialog(
        userId: widget.userId,
        onDeleteConfirmed: () {
          communityController.deleteUser(widget.userId , navigation: true);
          widget.onDelete?.call();
        },
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 3.0),
        elevation: 0.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildProfileImage(widget.image, widget.name),
              SizedBox(width: Get.width * 10 / 414),
              _buildUserInfo(context),
              const Spacer(),
              GestureDetector(
                onTap: _showDeleteConfirmationDialog,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    'assets/svg_icons/Bin.svg',
                    height: 18,
                    width: 18
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildProfileImage(String imageUrl, String name) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        // border: Border.all(color: Colors.grey),
      ),
      child: ClipOval(
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, _, __) => _fallbackProfileIcon(name),
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
        ),
      ),
    );
  }

  /// Generates a fallback profile icon with a random light background color.
  Widget _fallbackProfileIcon(String? fullname) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _generateLightColor(),
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

  /// Generates a random light color.
  Color _generateLightColor() {
    final Random random = Random();
    return Color.fromARGB(
      255,
      200 + random.nextInt(56),
      200 + random.nextInt(56),
      200 + random.nextInt(56),
    );
  }

  Widget _buildUserInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.name,overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: Get.height * AppConstants.themeConstants.fontsize_14,
            color: Theme.of(context).colorScheme.surface,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 3),
        _buildInfoRow('Relationship : ', widget.relationship, context),
        const SizedBox(height: 3),
        _buildInfoRow('Mobile Number : ', widget.mobileNumber, context),
      ],
    );
  }

  /// Helper to build info rows.
  Widget _buildInfoRow(String label, String value, BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: Get.height * AppConstants.themeConstants.fontsize_13,
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          value,overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: Get.height * AppConstants.themeConstants.fontsize_13,
            color: Theme.of(context).colorScheme.surface,overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
