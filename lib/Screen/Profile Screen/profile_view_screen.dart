import 'package:flutter/material.dart';
import 'package:gowri_seva_sangam/BreakPoints/breakpoints.dart';
import 'package:gowri_seva_sangam/Screen/Scaffold%20Custom%20Appbar/custom_appbar.dart';
import 'package:responsive_toolkit/responsive_grid.dart';

class ProfileScreenV2 extends StatefulWidget {
  const ProfileScreenV2({super.key});

  @override
  State<ProfileScreenV2> createState() => _ProfileScreenV2State();
}

class _ProfileScreenV2State extends State<ProfileScreenV2> {
  int selectedTab = 0;

  final List<String> menuItems = [
    'Personal Information',
    'Login Activity',
    'Devices',
    'Password Change',
  ];

  Widget buildTabMenu() {
    return Container(
      width: 220,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(12),
          topLeft: Radius.circular(12),
        ),
      ),
      child: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: menuItems.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          bool isSelected = selectedTab == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedTab = index;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: isSelected ? Colors.blue.shade50 : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                border: isSelected ? const Border(left: BorderSide(width: 3, color: Colors.blue)) : null,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Row(
                children: [
                  Icon(
                    Icons.circle,
                    size: 12,
                    color: isSelected ? Colors.blue : Colors.grey,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      menuItems[index],
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: isSelected ? Colors.blue : Colors.grey[700],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildPersonalInfoSection() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Personal Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 60,
              runSpacing: 24,
              children: const [
                InfoTile(title: 'Profile Name', value: '----'),
                InfoTile(title: 'Full Name', value: '----'),
                InfoTile(title: 'Email', value: '----'),
                InfoTile(title: 'Phone', value: '----'),
                InfoTile(title: 'Date of Birth', value: '----'),
                InfoTile(title: 'State', value: '----'),
                InfoTile(title: 'District', value: '----'),
                InfoTile(title: 'City', value: '----'),
                InfoTile(title: 'Area', value: '----'),
                InfoTile(title: 'Pincode', value: '----'),
                InfoTile(title: 'Address', value: '----'),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 180,
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            image: DecorationImage(
              image: NetworkImage('assets/developer.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: -40,
          left: 32,
          child: CircleAvatar(
            radius: 40,
            backgroundColor: Colors.white,
            child: const CircleAvatar(
              radius: 36,
              backgroundImage: NetworkImage('assets/svg_icons/dummy_image.jpeg'),
            ),
          ),
        ),
        Positioned(
          bottom: -80,
          right: 32,
          left: 120,
          child: ResponsiveRow(
            alignment: ResponsiveAlignment.spaceEvenly,
            columns: [
            ResponsiveColumn(ResponsiveConstants().buttonBreakpoints, child: HeaderInfo(icon: Icons.person, label: "Name", value: "----")),
            ResponsiveColumn(ResponsiveConstants().buttonBreakpoints, child: HeaderInfo(icon: Icons.email, label: "Email", value: "----")),
            ResponsiveColumn(ResponsiveConstants().buttonBreakpoints, child: HeaderInfo(icon: Icons.phone, label: "Mobile", value: "----")),
          ]),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffoldWithAppBar(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              buildHeader(context),
              const SizedBox(height: 60),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      buildTabMenu(),
                      buildPersonalInfoSection(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderInfo extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const HeaderInfo({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
        Text(value, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}

class InfoTile extends StatelessWidget {
  final String title;
  final String value;

  const InfoTile({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
