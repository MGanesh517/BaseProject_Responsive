import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gowri_seva_sangam/BreakPoints/breakpoints.dart';
import 'package:gowri_seva_sangam/Screen/Community_Members/CommonCards/common_list_card.dart';
import 'package:gowri_seva_sangam/Screen/New%20Navgations%20pages/button_types.dart';
import 'package:gowri_seva_sangam/Screen/Scaffold%20Custom%20Appbar/custom_appbar.dart';
import 'package:responsive_toolkit/responsive_toolkit.dart';

class PopUpMultiSelect extends StatefulWidget {
  const PopUpMultiSelect({super.key});

  @override
  State<PopUpMultiSelect> createState() => _PopUpMultiSelectState();
}

class _PopUpMultiSelectState extends State<PopUpMultiSelect> {
  final List<String> allMembers = [
    "Sri. Gowri",
    "Sri. Srinivas",
    "Sri. Suresh",
    "Sri. Lakshmi",
    "Sri. Ramesh",
    "Sri. Priya",
  ];

  List<String> selectedMembers = [];

  void _showAddDialog() {
    showDialog(
      context: context,
      builder: (context) {
        List<String> unselected = allMembers
            .where((member) => !selectedMembers.contains(member))
            .toList();

        return AlertDialog(
          title: Text("Select Members"),
          content: SizedBox(
            width: Get.width *0.5,
            height: 400,
            child: ListView.builder(
              itemCount: unselected.length,
              itemBuilder: (context, index) {
                final member = unselected[index];
                return Card(
                  child: ListTile(
                    title: Text(member),
                    trailing: IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          selectedMembers.add(member);
                        });
                        Navigator.pop(context);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Close"),
            )
          ],
        );
      },
    );
  }

  void _showMultiSelectDialog() {
    final List<String> unselected = allMembers
        .where((member) => !selectedMembers.contains(member))
        .toList();

    Set<String> tempSelected = {};

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Select Members"),
          content: SizedBox(
            width: Get.width * 0.5,
            height: 400,
            child: StatefulBuilder(
              builder: (context, setState) {
                return ListView.builder(
                  itemCount: unselected.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(unselected[index]),
                        trailing: Checkbox(
                          value: tempSelected.contains(unselected[index]),
                          onChanged: (bool? checked) {
                            setState(() {
                              if (checked == true) {
                                tempSelected.add(unselected[index]);
                              } else {
                                tempSelected.remove(unselected[index]);
                              }
                            });
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedMembers.addAll(tempSelected);
                });
                Navigator.pop(context);
              },
              child: const Text("Add Selected"),
            ),
          ],  
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return CommonScaffoldWithAppBar(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: ResponsiveRow(
                alignment: ResponsiveAlignment.spaceEvenly,
                columns: [
                ResponsiveColumn(ResponsiveConstants().threeGridRes, child: ButtonTypeCommonComponents.defaultFloatingActionButton(
                context,
                onPressed: _showAddDialog,
                icon: Icons.send,
                isExtended: true,
                extendedLabel: "Add",
                tooltip: "ADD BUTTON",
              ),),
              
              ResponsiveColumn(ResponsiveConstants().threeGridRes, child: ButtonTypeCommonComponents.defaultFloatingActionButton(
                context,
                onPressed: _showMultiSelectDialog,
                icon: Icons.send,
                isExtended: true,
                extendedLabel: "Multi Select",
                tooltip: "ADD BUTTON",
              ),),
              ]),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                itemCount: selectedMembers.length,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).size.width <= 800
                      ? 1
                      : MediaQuery.of(context).size.width <= 1300
                          ? 2
                          : MediaQuery.of(context).size.width <= 1700
                              ? 3
                              : 4,
                  childAspectRatio: 1,
                  crossAxisSpacing: MediaQuery.of(context).size.width <= 400 ? 10 : 30,
                  mainAxisExtent: MediaQuery.of(context).size.width <= 1300 ? 125 : 100,
                ),
                itemBuilder: (context, index) {
                  final name = selectedMembers[index];
                  return CommonListMemberCard(
                    image: '',
                    name: name,
                    emailId: 'N/A',
                    email: "N/A",
                    onTap: () {},
                  );
                },
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
