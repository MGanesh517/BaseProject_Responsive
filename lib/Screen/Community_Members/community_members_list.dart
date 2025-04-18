import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gowri_seva_sangam/BreakPoints/breakpoints.dart';
import 'package:gowri_seva_sangam/Common%20Components/common_input_fields.dart';
import 'package:gowri_seva_sangam/Screen/Community_Members/CommonCards/common_list_card.dart';
import 'package:gowri_seva_sangam/Screen/Community_Members/Controller/community_controller.dart';
import 'package:gowri_seva_sangam/Screen/Community_Members/Controller/data_table_controller.dart';
import 'package:gowri_seva_sangam/Screen/Scaffold%20Custom%20Appbar/custom_appbar.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:responsive_toolkit/responsive_grid.dart';

class MembersList extends StatefulWidget {
  const MembersList({super.key});

  @override
  State<MembersList> createState() => _MembersListState();
}

class _MembersListState extends State<MembersList> {
  final controller = Get.put(CommunityMembersController());
  final dataTableController = Get.put(DataTableController());
    RefreshController refreshController = RefreshController(initialRefresh: false);



  @override
  Widget build(BuildContext context) {

    final isLargeScreen = MediaQuery.of(context).size.width > 800;

    print("Get.width :::::::::: ${Get.width}");
    return CommonScaffoldWithAppBar(
      
      body: GetBuilder<CommunityMembersController>(
        initState: (_) => CommunityMembersController.to.initState(),
        builder: (va) => SafeArea(
          child: Column(
            children: [
              /// 🔹 **Search & Filter Row**
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 9.0, horizontal: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ResponsiveRow(columns: [
                        ResponsiveColumn(
                          ResponsiveConstants().searchBreakPoint,
                          child: CommonComponents.defaultSearchTextFormField(
                            context,
                            controller: controller.searchController,
                            hintText: 'Search',
                            prefixIcon: Icon(Icons.search),
                            onChange: (value) {
                              controller.communityMembersIsRefresh = true;
                              controller.getCommunityMembersList(search: value.isNotEmpty ? value : null);
                            },
                            onFieldSubmitted: (val) {
                              controller.communityMembersIsRefresh = true;
                              controller.getCommunityMembersList(search: val.isNotEmpty ? val : null);
                            },
                          ),
                        ),

                        /// 🔹 **Filter Button**
                        // ResponsiveColumn(
                        //   ResponsiveConstants().buttonBreakpoints,
                        //   child: IconButton(
                        //     onPressed: () => Get.dialog(FiltersAlertDialog()),
                        //     icon: Icon(Icons.filter_alt),
                        //   ),
                        // ),

                        /// 🔹 **Grid View Toggle**
                        if (isLargeScreen)
                        ResponsiveColumn(
                          ResponsiveConstants().buttonBreakpoints,
                          child: Obx(
                            () => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    controller.isGridView.value = true;
                                    controller.isTableView.value = false;
                                  },
                                  icon: Icon(
                                    Icons.grid_4x4_rounded,
                                    color: controller.isGridView.value ? Colors.blue : Colors.grey,
                                  ),
                                ),
                                IconButton(
                              onPressed: () {
                                controller.isGridView.value = false;
                                controller.isTableView.value = true;
                              },
                              icon: Icon(
                                Icons.table_chart_rounded,
                                color: controller.isTableView.value ? Colors.blue : Colors.grey,
                              ),
                            ),
                              ],
                            ),
                          ),
                        ),

                        /// 🔹 **Table View Toggle**
                        // if (isLargeScreen)
                        // ResponsiveColumn(
                        //   ResponsiveConstants().buttonBreakpoints,
                        //   child: Obx(
                        //     () => IconButton(
                        //       onPressed: () {
                        //         controller.isGridView.value = false;
                        //         controller.isTableView.value = true;
                        //       },
                        //       icon: Icon(
                        //         Icons.table_chart_rounded,
                        //         color: controller.isTableView.value ? Colors.blue : Colors.grey,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ]),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),

              /// 🔹 **Grid View**
              Obx(
                () => Visibility(
                  visible: controller.isGridView.value,
                  child: Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Obx(
                        () => SmartRefresher(
                          controller: refreshController,
                          enablePullUp: true,
                          onRefresh: () async {
                            controller.communityMembersIsRefresh = true;
                            controller.communityMembersCurrentPage = 1;
                            final result = await controller.getCommunityMembersList();
                            result
                                ? refreshController.refreshCompleted()
                                : refreshController.refreshFailed();
                          },
                          onLoading: () async {
                            if (controller.communityMembersTotalPages > 1) {
                              final result = await controller.getCommunityMembersList();
                              if (result) {
                                controller.communityMembersCurrentPage > controller.communityMembersTotalPages
                                    ? refreshController.loadNoData()
                                    : refreshController.loadComplete();
                              } else {
                                refreshController.loadNoData();
                              }
                            } else {
                              refreshController.loadNoData();
                            }
                          },
                          child: controller.communityMembersList.isNotEmpty
                              ? GridView.builder(
                                  itemCount: controller.communityMembersList.length,
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
                                    // crossAxisSpacing: Get.width <= 400 ? 10 : 30,
                                    mainAxisExtent: MediaQuery.of(context).size.width <= 1300 ? 125 : 100,
                                  ),
                                  itemBuilder: (context, index) {
                                    return CommonListMemberCard(
                                      image: controller.communityMembersList[index].profilePicture ?? '',
                                      name: controller.communityMembersList[index].fullname ?? 'N/A',
                                      emailId: controller.communityMembersList[index].email ?? 'N/A',
                                      email: controller.communityMembersList[index].phone ?? "N/A",
                                      onTap: () => controller.getCommunityMemberDetailView(controller.communityMembersList[index].id),
                                    );
                                  },
                                )
                              : Center(child: Text('No Data Available')),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              /// 🔹 **Table View**
              
              // Obx(
              //   () => Visibility(
              //     visible: controller.isTableView.value,
              //     child: Expanded(
              //       child: Padding(
              //         padding: const EdgeInsets.only(left: 16.0),
              //         child: HorizontalDataTable(
              //           leftHandSideColumnWidth: 120,
              //           rightHandSideColumnWidth: Get.width - 120,
              //           isFixedHeader: true,
              //           headerWidgets: _getTitleWidgets(),
              //           leftSideItemBuilder: (context, index) => _generateFirstColumnRow(index),
              //           rightSideItemBuilder: (context, index) => _generateRightHandSideColumnRow(index),
              //           itemCount: controller.communityMembersList.length,
              //           onRefresh: () async {
              //                 controller.communityMembersIsRefresh = true;
              //                 controller.communityMembersCurrentPage = 1;
              //                 final result = await controller.getCommunityMembersList();
              //                 result
              //                     ? refreshController.refreshCompleted()
              //                     : refreshController.refreshFailed();
              //               },
              //               onLoad: () async {
              //                 if (controller.communityMembersTotalPages > 1) {
              //                   final result = await controller.getCommunityMembersList();
              //                   if (result) {
              //                     controller.communityMembersCurrentPage > controller.communityMembersTotalPages
              //                         ? refreshController.loadNoData()
              //                         : refreshController.loadComplete();
              //                   } else {
              //                     refreshController.loadNoData();
              //                   }
              //                 } else {
              //                   refreshController.loadNoData();
              //                 }
              //               },
              //           rowSeparatorWidget: Divider(height: 1, color: Colors.grey),
              //           leftHandSideColBackgroundColor: Colors.white,
              //           rightHandSideColBackgroundColor: Colors.white,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),

              // Obx(
              //   () => Visibility(
              //     visible: controller.isTableView.value,
              //     child: Expanded(
              //       child: Padding(
              //         padding: const EdgeInsets.only(left: 16.0),
              //         child: SingleChildScrollView(
              //           scrollDirection: Axis.horizontal,
              //           child: SizedBox(
              //             width: MediaQuery.of(context).size.width,
              //             child: DataTable2(
              //               columnSpacing: 12,
              //               horizontalMargin: 12,
              //               // minWidth: 100,
              //               columns: [
              //                 DataColumn2(label: Text('S.NO'), size: ColumnSize.S),
              //                 DataColumn(label: Text('Profile Picture')),
              //                 DataColumn(label: Text('Name')),
              //                 DataColumn(label: Text('Mobile Number')),
              //                 DataColumn(label: Text('Email ID')),
              //                 DataColumn(label: Text('Email ID')),
              //                 DataColumn(label: Text('Email ID')),
              //                 DataColumn(label: Text('Email ID')),
              //                 DataColumn(label: Text('Email ID')),
              //                 DataColumn(label: Text('Email ID')),
              //               ],
              //               rows: List.generate(controller.communityMembersList.length, (index) {
              //                 final member = controller.communityMembersList[index];
              //                 return DataRow2(
              //                   cells: [
              //                     DataCell(Text((index + 1).toString())), // S.No
              //                     DataCell(CircleAvatar(
              //                       backgroundImage: NetworkImage(member.profilePicture ?? ''),
              //                       radius: 15,
              //                     )), // Profile Picture
              //                     DataCell(Text(member.fullname ?? 'N/A')), // Name
              //                     DataCell(Text(member.phone ?? 'N/A')), // Mobile Number
              //                     DataCell(Text(member.email ?? 'N/A')), // Email
              //                     DataCell(Text(member.email ?? 'N/A')), // Email
              //                     DataCell(Text(member.email ?? 'N/A')), // Email
              //                     DataCell(Text(member.email ?? 'N/A')), // Email
              //                     DataCell(Text(member.email ?? 'N/A')), // Email
              //                   ],
              //                 );
              //               }),
              //             ),
              //           ),
              //         ),
              //       ),a
              //     ),
              //   ),
              // ),

///////////////////       Paginated Datatbale   /////////////////////////

      //   Obx(() => Visibility(
      //     visible: controller.isTableView.value,
      //     child: Flexible(
      //       child: Padding(
      //         padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 10.0),
      //         child: SingleChildScrollView(
      //           scrollDirection: Axis.horizontal,
      //           child: Container(
      //             padding: EdgeInsets.all(16.0),
      //             decoration: BoxDecoration(
      //               color: Colors.white,
      //               borderRadius: BorderRadius.circular(10),
      //               boxShadow: [
      //                 BoxShadow(
      //                   color: Colors.black12,
      //                   blurRadius: 8,
      //                   spreadRadius: 2,
      //                   offset: Offset(0, 3),
      //                 ),
      //               ],
      //             ),
      //             /////// Custom Drawer Width is 250 so
      //             width: MediaQuery.of(context).size.width - 250,
      //             child: PaginatedDataTable2(
      //               actions: [

      //               ],
      //               source: CommunityMembersDataSource(controller),
      //               border: TableBorder.all(color: Colors.grey.shade300),
      //               showFirstLastButtons: true,
      //               sortArrowAlwaysVisible: true,
      //               sortArrowAnimationDuration: Duration(milliseconds: 300),
      //               isHorizontalScrollBarVisible: true,
      //               isVerticalScrollBarVisible: true,
      //               headingTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      //               headingRowDecoration: BoxDecoration(
      //                 color: Colors.blue.shade100,
      //                 borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
      //               ),
      //               columnSpacing: 12,
      //               horizontalMargin: 12,
      //               rowsPerPage: 10,
      //               availableRowsPerPage: [10, 20, 50],
      //               minWidth: 900,
      //               checkboxHorizontalMargin: 10,
      //               dataTextStyle: TextStyle(fontSize: 13, color: Colors.black87),
      //               dividerThickness: 0.8,
      //               sortColumnIndex: 0,
      //               columns: [
      //                 DataColumn2(label: Text('S.No'), size: ColumnSize.S),
      //                 DataColumn(label: Text('Name')),
      //                 DataColumn(label: Text('Mobile Number')),
      //                 DataColumn(label: Text('Email')),
      //                 DataColumn(label: Text('Gender')),
      //                 DataColumn(label: Text('Marital Status')),
      //                 DataColumn(label: Text('Actions')),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),

      Obx(() =>  Visibility(
        visible: controller.isTableView.value,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 24.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey.shade200,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Paginated Data Table", style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600)),
                  SizedBox(height: 10),
                  PaginatedDataTable(
                    columnSpacing: 120,
                    headingRowColor: WidgetStatePropertyAll(Color(0xfff7fafc)),
                    source: CommunityMembersDataSource(controller),
                    columns: [
                                  DataColumn(label: Text('S.No', style: TextStyle(color: Color(0xff2d3436)))),
                                  DataColumn(label: Text('Name', style: TextStyle(color: Color(0xff2d3436)))),
                                  DataColumn(label: Text('Mobile Number', style: TextStyle(color: Color(0xff2d3436)))),
                                  DataColumn(label: Text('Email', style: TextStyle(color: Color(0xff2d3436)))),
                                  DataColumn(label: Text('Gender', style: TextStyle(color: Color(0xff2d3436)))),
                                  DataColumn(label: Text('Marital Status', style: TextStyle(color: Color(0xff2d3436)))),
                                  DataColumn(label: Text('Actions', style: TextStyle(color: Color(0xff2d3436)))),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ))





            ],
          ),
        ),
      ),
    );
  }

  /// **🔹 Table Headers**
  List<Widget> _getTitleWidgets() {
    return [
      _headerCell("S.No", 120),
      _headerCell("Profile Picture", 150),
      _headerCell("Name", 200),
      _headerCell("Email", 200),
      _headerCell("Mobile Number", 150),
      
    ];
  }

  /// **🔹 Table Header Cell**
  Widget _headerCell(String label, double width) {
    return Container(
      width: width,
      height: 50,
      alignment: Alignment.center,
      color: Colors.blueGrey,
      child: Text(label, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
    );
  }

  /// **🔹 Left Column - ID**
  Widget _generateFirstColumnRow(int index) {
    return Container(
      width: 120,
      height: 50,
      alignment: Alignment.center,
      child: Text("$index"),
    );
  }

  /// **🔹 Right Side Columns**
  Widget _generateRightHandSideColumnRow(int index) {
    var member = controller.communityMembersList[index];
    return Row(
      children: [
        _dataCell(member.profilePicture ?? '', 150),
        _dataCell(member.fullname ?? 'N/A', 200),
        _dataCell(member.email ?? 'N/A', 200),
        _dataCell(member.phone ?? 'N/A', 150),
        
      ],
    );
  }

  /// **🔹 Data Cell**
  Widget _dataCell(String value, double width) {
    return Container(
      width: width,
      height: 50,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Text(value),
    );
  }
}




class Member {
  // final List<Member> members;
  final String? fullname;
  final String? phone;
  final String? email;
  final String? profilePicture;

  Member({ this.fullname, this.phone, this.email, this.profilePicture, });
}
class CommunityMembersDataSource extends DataTableSource {
  final CommunityMembersController controller;

  CommunityMembersDataSource(this.controller);

  @override
  DataRow getRow(int index) {
    if (index >= controller.communityMembersList.length) return DataRow(cells: []);

    final row = controller.communityMembersList[index];

    return DataRow(
      // color: WidgetStatePropertyAll(Colors.grey),
      cells: [
        DataCell(Text("${index + 1}")),
        DataCell(Text(row.fullname ?? '')),
        DataCell(Text(row.phone ?? "")),
        DataCell(Text(row.email ?? "")),
        DataCell(Text("${row.genderName}")),
        DataCell(Text(row.maritalName ?? '')),
        DataCell(Row(
          children: [
            IconButton(icon: Icon(Icons.edit, color: Colors.blue), onPressed: () {
              final id = int.tryParse(controller.communityMembersList[index].id ?? '');
              if (id != null) {
               controller.getCommunityMemberDetailView(id);
              } else {
                print("Invalid ID: ${controller.communityMembersList[index].id}");
              }
            }),
            // IconButton(onPressed: () {
            //   Get.toNamed(
            //                             Routes.addMembers,
            //                             arguments: {'id': controller.communityMemberDetails.id, 'isEdit': true}
            //                           );
            // }, icon: Icon(Icons.access_alarm_outlined)),
            IconButton(icon: Icon(Icons.remove_red_eye, color: Colors.green), onPressed: () => controller.getCommunityMemberDetailView(controller.communityMembersList[index].id)),
            IconButton(icon: Icon(Icons.delete, color: Colors.red), onPressed: () {}),
          ],
        )),
      ],
    );
  }

  void _deleteRow(int index) {
    controller.communityMembersList.removeAt(index);
  }

  @override
  int get rowCount => controller.communityMembersList.length;
  @override
  bool get isRowCountApproximate => false;
  @override
  int get selectedRowCount => 0;
}
