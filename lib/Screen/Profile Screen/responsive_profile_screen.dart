import 'package:flutter/material.dart';
import 'package:gowri_seva_sangam/BreakPoints/breakpoints.dart';
import 'package:gowri_seva_sangam/Common%20Components/common_input_fields.dart';
import 'package:gowri_seva_sangam/Screen/Scaffold%20Custom%20Appbar/custom_appbar.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_toolkit/responsive_grid.dart';

class ResponsiveProfileScreen extends StatefulWidget {
  const ResponsiveProfileScreen({super.key});

  @override
  State<ResponsiveProfileScreen> createState() => _ResponsiveProfileScreenState();
}

class _ResponsiveProfileScreenState extends State<ResponsiveProfileScreen> {
  int selectedTabIndex = 0;
  
  final List<TabData> tabs = [
    TabData(
      icon: Icons.person,
      label: "Personal Information",
    ),
    TabData(
      icon: Icons.login,
      label: "Login Activity",
    ),
    TabData(
      icon: Icons.devices,
      label: "Devices",
    ),
    TabData(
      icon: Icons.lock,
      label: "Password Change",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final isTablet = MediaQuery.of(context).size.width <= 900;
    final isDesktop = MediaQuery.of(context).size.width > 900;

    return CommonScaffoldWithAppBar(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: isMobile ? const EdgeInsets.all(12.0) : const EdgeInsets.all(24.0),
            child: Column(
              children: [
                // Profile card with background image and avatar
                Visibility(
                  visible: isMobile || isTablet,
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      // Container combining background image and info card
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 4,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            // Background Image
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              ),
                              child: Image.asset(
                                'assets/developer.png',
                                width: double.infinity,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                            
                            // Info Card - Directly below background with no gap
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12),
                                ),
                              ),
                              padding: const EdgeInsets.only(
                                left: 16,
                                right: 16,
                                bottom: 20,
                                top: 50,
                              ),
                              child: ResponsiveRowColumn(
                                layout: isMobile
                                    ? ResponsiveRowColumnType.COLUMN
                                    : ResponsiveRowColumnType.ROW,
                                rowCrossAxisAlignment: CrossAxisAlignment.center,
                                rowMainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                columnSpacing: 16,
                                rowSpacing: 32,
                                children: [
                                  ResponsiveRowColumnItem(
                                    child: infoTile(Icons.person, "Name", "Christina"),
                                  ),
                                  ResponsiveRowColumnItem(
                                    child: infoTile(Icons.mail, "Email", "Christina.love@gmail.com"),
                                  ),
                                  ResponsiveRowColumnItem(
                                    child: infoTile(Icons.phone, "Mobile", "9143143143"),
                                  ),
                                ],
                              ),
                              // child: ResponsiveRow(
                              //   columns: [
                              //   ResponsiveColumn(ResponsiveConstants().buttonBreakpoints, child: ResponsiveRowColumnItem(
                              //       child: infoTile(Icons.person, "Name", "Christina"),
                              //     ),),
                              //     ResponsiveColumn(ResponsiveConstants().buttonBreakpoints, child: ResponsiveRowColumnItem(
                              //       child: infoTile(Icons.mail, "Email", "Christina.love@gmail.com"),
                              //     ),),
                              //     ResponsiveColumn(ResponsiveConstants().buttonBreakpoints, child: ResponsiveRowColumnItem(
                              //       child: infoTile(Icons.phone, "Mobile", "9143143143"),
                              //     ),),
                              // ]),
                            ),
                          ],
                        ),
                      ),
                      
                      // Avatar positioned to overlap both background and info card
                      Positioned(
                        left: 20,
                        top: 110,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 4),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 4,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.grey.shade200,
                            backgroundImage: const AssetImage('assets/svg_icons/dummy_image.jpeg'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // Responsive Tabs Card
                Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: ResponsiveRowColumn(
                    layout: isTablet
                        ? ResponsiveRowColumnType.COLUMN
                        : ResponsiveRowColumnType.ROW,
                    columnSpacing: 0,
                    rowSpacing: 0,
                    rowMainAxisAlignment: MainAxisAlignment.start,
                    rowCrossAxisAlignment: CrossAxisAlignment.start,
                    columnMainAxisAlignment: MainAxisAlignment.start,
                    columnCrossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Sidebar Menu
                      ResponsiveRowColumnItem(
                        rowFlex: 2,
                        child: Container(
                          width: isTablet ? double.infinity : 250,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: isTablet
                                ? const BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12),
                                  )
                                : const BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    bottomLeft: Radius.circular(12),
                                  ),
                          ),
                          child: Column(
                            children: List.generate(tabs.length, (index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedTabIndex = index;
                                  });
                                },
                                child: tabItem(
                                  tabs[index].icon,
                                  tabs[index].label,
                                  index == selectedTabIndex,
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                      
    //////// Content Area - Changes based on selected tab
                      ResponsiveRowColumnItem(
                        rowFlex: 5,
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: isTablet
                                ? const BorderRadius.only(
                                    bottomLeft: Radius.circular(12),
                                    bottomRight: Radius.circular(12),
                                  )
                                : const BorderRadius.only(
                                    topRight: Radius.circular(12),
                                    bottomRight: Radius.circular(12),
                                  ),
                          ),
                          padding: const EdgeInsets.all(20),
                          child: buildTabContent(selectedTabIndex),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Build content based on selected tab
  Widget buildTabContent(int index) {
    switch (index) {
      case 0:
        return buildPersonalInfoContent();
      case 1:
        return buildLoginActivityContent();
      case 2:
        return buildDevicesContent();
      case 3:
        return buildPasswordChangeContent();
      default:
        return buildPersonalInfoContent();
    }
  }

  //// Personal Information Tab Content
  Widget buildPersonalInfoContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Personal Information",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600
          )
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 32,
          runSpacing: 16,
          children: [
            dataField("Profile Name", "Lexi "),
            dataField("Full Name", "Lexi Christina"),
            dataField("Email", "Christina.love@gmail.com"),
            dataField("Phone", "9143143143"),
            dataField("Date of Birth", "01-01-2000"),
            dataField("State", "Andhra Pradesh"),
            dataField("District", "Visakhapatnam"),
            dataField("City", "Anakapalle"),
            dataField("Area", "Ganaparthi"),
            dataField("Pincode", "531055"),
            dataField("Address", "Ganaparthi, Anakapalle"),
          ],
        )
      ],
    );
  }

  // Login Activity Tab Content
  Widget buildLoginActivityContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Login Activity",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600
          )
        ),
        const SizedBox(height: 20),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue.shade50,
                child: Icon(
                  index % 2 == 0 ? Icons.phone_android : Icons.computer,
                  color: Colors.blue,
                ),
              ),
              title: Text("Login from ${index % 2 == 0 ? 'Mobile Device' : 'Desktop'}"),
              subtitle: Text("IP: 192.168.1.${index + 1} • ${DateTime.now().subtract(Duration(days: index)).toString().substring(0, 16)}"),
              trailing: Icon(
                Icons.circle,
                size: 12,
                color: index == 0 ? Colors.green : Colors.grey,
              ),
            );
          },
        ),
      ],
    );
  }

  // Devices Tab Content
  Widget buildDevicesContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Devices",
          style: TextStyle(
            fontSize: 20, 
            fontWeight: FontWeight.w600
          )
        ),
        const SizedBox(height: 20),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            final deviceNames = ["iPhone 15", "MacBook Pro", "iPad Air"];
            final deviceIcons = [Icons.phone_iphone, Icons.laptop_mac, Icons.tablet_mac];
            
            return Card(
              margin: const EdgeInsets.only(bottom: 16),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.blue.shade50,
                      child: Icon(deviceIcons[index], color: Colors.blue),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            deviceNames[index],
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Last login: ${DateTime.now().subtract(Duration(hours: index * 5)).toString().substring(0, 16)}",
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                        ],
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.logout, size: 18),
                      label: const Text("Logout"),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  // Password Change Tab Content
  Widget buildPasswordChangeContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Change Password",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600
          )
        ),
        const SizedBox(height: 10),
        const Text(
          "Set a unique password to protect your account.",
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey
          )
        ),
        const SizedBox(height: 20),
        ResponsiveRow(
          spacing: 16,
          runSpacing: 20.0,
          columns: [
            ResponsiveColumn(ResponsiveConstants().textFormField, child:  CommonComponents.defaultTextFormField(context,
        prefixIcon: Icon(Icons.lock),
            hintText: "Current Password"),)
        //   ResponsiveColumn(ResponsiveConstants().buttonTextFields, child:  CommonComponents.defaultTextFormField(context,
        // prefixIcon: Icon(Icons.verified_user),
        //     hintText: "Current Password"),)
        ]),
        const SizedBox(height: 16),
        ResponsiveRow(
          spacing: 16,
          runSpacing: 20.0,
          columns: [
          ResponsiveColumn(ResponsiveConstants().textFormField, child:  CommonComponents.defaultTextFormField(context,
        prefixIcon: Icon(Icons.lock),
            hintText: "New Password"),),
        ]),
        const SizedBox(height: 16),
        ResponsiveRow(
          spacing: 16,
          runSpacing: 20.0,
          columns: [
          ResponsiveColumn(ResponsiveConstants().textFormField, child:   CommonComponents.defaultTextFormField(context,
        prefixIcon: Icon(Icons.lock),
            hintText: "Confirm New Password"),),
        ]),
        const SizedBox(height: 24),
        ResponsiveRow(columns: [
          ResponsiveColumn(ResponsiveConstants().buttonBreakpoints, child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text("Update Password", overflow: TextOverflow.ellipsis,style: TextStyle(overflow: TextOverflow.ellipsis),)
              ),
            ),
          ],
        ),)
        ])
      ],
    );
  }

  Widget infoTile(IconData icon, String label, String value) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.blue.shade50,
          child: Icon(icon, color: Colors.blue),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14)
            ),
            const SizedBox(height: 2),
            Text(value, style: const TextStyle(color: Colors.grey)),
          ],
        )
      ],
    );
  }

  Widget tabItem(IconData icon, String label, bool selected) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: selected ? Colors.blue.shade50 : Colors.transparent,
        border: selected
            ? const Border(left: BorderSide(color: Colors.blue, width: 3))
            : null,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          Icon(icon, size: 20, color: selected ? Colors.blue : Colors.grey.shade700),
          const SizedBox(width: 10),
          Text(
            label,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: selected ? Colors.blue : Colors.grey.shade800,
              fontWeight: selected ? FontWeight.w500 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget dataField(String label, String value) {
    return SizedBox(
      width: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}

class TabData {
  final IconData icon;
  final String label;
  
  TabData({
    required this.icon,
    required this.label,
  });
}