import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:gowri_seva_sangam/BreakPoints/breakpoints.dart';
import 'package:gowri_seva_sangam/Common%20Components/common_input_fields.dart';
import 'package:gowri_seva_sangam/Screen/Scaffold%20Custom%20Appbar/custom_appbar.dart';
import 'package:responsive_toolkit/responsive_toolkit.dart';


class DefaultDropdownStyles extends StatefulWidget {
  const DefaultDropdownStyles({super.key});

  @override
  State<DefaultDropdownStyles> createState() => _DefaultDropdownStylesState();
}

class _DefaultDropdownStylesState extends State<DefaultDropdownStyles> {
  List<String> fruits = ['Apple', 'Banana', 'Mango', 'Orange', 'Grapes'];

    bool _showPopover = false;
  final List<String> sizeOptions = [
    '30 × 20(mm)',
    '40 × 30(mm)',
    '40 × 60(mm)',
    '40 × 80(mm)',
    '60 × 40(mm)',
  ];

    List<Field> dummyFields = [
      Field(
        "1",
        [],
        "value_1",
        true,
        false,
        title: "Name",
        name: "name",
        verboseName: "Full Name",
        dataType: "String",
      ),
      Field(
        "2",
        [],
        "value_2",
        true,
        false,
        title: "Email",
        name: "email",
        verboseName: "Email Address",
        dataType: "String",
      ),
      Field(
        "3",
        [],
        "value_3",
        true,
        false,
        title: "Tags",
        name: "tags",
        verboseName: "Tags",
        dataType: "ManyToManyRel",
        relatedModel: Field(
          "3.1",
          [],
          null,
          true,
          false,
          title: "Tag Model",
          verboseName: "Related Tag",
        ),
      ),
    ];



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
                  ResponsiveColumn(
                    ResponsiveConstants().twoBreakPoint,
                    child: ResponsiveDropDownWithMultiSelect(
                      title: "Multi Select Dropdown ( Customize )",
                      items: ["Banana", "Apple", "Mango"],
      
                      // isMultiSelect: true,
                    ),
                  ),
                  ResponsiveColumn(
                    ResponsiveConstants().twoBreakPoint,
                    child: CommonComponents.defaultDropdownSearch(
                      context,
                      title: "defaultDropdownSearch",
                      hintText: '',
                      showBottomSheet: false,
                      items: (p0, p1) async => fruits,
                    ),
                  ),
                  ResponsiveColumn(
                    ResponsiveConstants().twoBreakPoint,
                    child: CommonComponents.defaultNewDropdownSearch(
                      context,
                      title: "defaultNewDropdownSearch",
                      hintText: '',
                      showBottomSheet: false,
                      items: (p0, p1) async => fruits,
                    ),
                  ),
                  ResponsiveColumn(
                    ResponsiveConstants().twoBreakPoint,
                    child:
                        CommonComponents.defaultDropdownSearchMultipleSelection(
                          context,
                          title: "defaultDropdownSearchMultipleSelection",
                          hintText: '',
                          showBottomSheet: false,
                          items: (p0, p1) async => fruits,
                        ),
                  ),
      
                  // ResponsiveColumn(
                  //   ResponsiveConstants().twoBreakPoint,
                  //   child: CommonComponents.defaultDropdownSearch<String>(
                  //     context,
                  //     title: "Basic",
                  //     hintText: "Select an item",
                  //     items:
                  //         (filter, _) async => [
                  //           '1st menu item',
                  //           '2nd menu item',
                  //           '3rd menu item',
                  //         ],
                  //     itemAsString: (String item) => item,
                  //     selectedItem: '1st menu item',
                  //     showBottomSheet: false,
                  //     onChanged: (val) => print("Selected: $val"),
                  //   ),
                  // ),
                  // ResponsiveColumn(
                  //   ResponsiveConstants().twoBreakPoint,
                  //   child: CommonComponents.defaultDropdownSearch<String>(
                  //     context,
                  //     title: "Extra node",
                  //     hintText: "With shortcut",
                  //     items: (filter, _) async => ['Copy', 'Edit', 'Delete'],
                  //     itemAsString: (item) => "$item  ⌘⌫",
                  //     selectedItem: 'Copy',
                  //     showBottomSheet: false,
                  //     onChanged: (val) => print("Selected: $val"),
                  //   ),
                  // ),
                  // ResponsiveColumn(
                  //   ResponsiveConstants().twoBreakPoint,
                  //   child: CommonComponents.defaultDropdownSearch<String>(
                  //     context,
                  //     showBottomSheet: false,
                  //     title: "Placement: bottomLeft",
                  //     hintText: "Choose",
                  //     items:
                  //         (filter, _) async => [
                  //           'bottomLeft',
                  //           'bottom',
                  //           'bottomRight',
                  //           'topLeft',
                  //           'top',
                  //           'topRight',
                  //         ],
                  //     selectedItem: 'bottomLeft',
                  //     onChanged: (val) => print("Placement: $val"),
                  //   ),
                  // ),
                  // ResponsiveColumn(
                  //   ResponsiveConstants().twoBreakPoint,
                  //   child: CommonComponents.defaultDropdownSearch<String>(
                  //     context,
                  //     title: "Arrow",
                  //     showBottomSheet: false,
                  //     hintText: "Dropdown with arrow",
                  //     items:
                  //         (filter, _) async => [
                  //           'With arrow',
                  //           'Without arrow',
                  //         ],
                  //     selectedItem: 'With arrow',
                  //     onChanged: (val) => print("Arrow: $val"),
                  //   ),
                  // ),
                  // ResponsiveColumn(
                  //   ResponsiveConstants().twoBreakPoint,
                  //   child: CommonComponents.defaultDropdownSearch<String>(
                  //     context,
                  //     showBottomSheet: false,
                  //     title: "Other elements",
                  //     hintText: "Disabled options",
                  //     items:
                  //         (filter, _) async => [
                  //           'Active item',
                  //           'Disabled item',
                  //         ],
                  //     disableItemFn: (item) => item == 'Disabled item',
                  //     selectedItem: 'Active item',
                  //     onChanged: (val) => print("Other: $val"),
                  //   ),
                  // ),
                  // ResponsiveColumn(
                  //   ResponsiveConstants().twoBreakPoint,
                  //   child: CommonComponents.defaultDropdownSearch<String>(
                  //     context,
                  //     title: "Trigger: click",
                  //     hintText: "Click to open",
                  //     showBottomSheet: false,
                  //     items:
                  //         (filter, _) async => [
                  //           'Click item 1',
                  //           'Click item 2',
                  //         ],
                  //     selectedItem: 'Click item 1',
                  //     onChanged: (val) => print("Click trigger: $val"),
                  //   ),
                  // ),
                  // ResponsiveColumn(
                  //   ResponsiveConstants().twoBreakPoint,
                  //   child: CommonComponents.defaultDropdownSearch<String>(
                  //     context,
                  //     title: "Trigger: click",
                  //     hintText: "Click to open",
                  //     showBottomSheet: false,
                  //     items:
                  //         (filter, _) async => [
                  //           'Click item 1',
                  //           'Click item 2',
                  //         ],
                  //     selectedItem: 'Click item 1',
                  //     onChanged: (val) => print("Click trigger: $val"),
                  //   ),
                  // ),
                  // ResponsiveColumn(
                  //   ResponsiveConstants().twoBreakPoint,
                  //   child: CommonComponents.defaultDropdownSearch<String>(
                  //     context,
                  //     title: "Click Event",
                  //     hintText: "Item click handler",
                  //     showBottomSheet: false,
                  //     items:
                  //         (filter, _) async => [
                  //           'Action A',
                  //           'Action B',
                  //           'Action C',
                  //         ],
                  //     onChanged: (val) => print("Clicked item: $val"),
                  //   ),
                  // ),
      
      
                  // ResponsiveColumn(
                  //   ResponsiveConstants().twoBreakPoint,
                  //   // child: MultiLevelDropdown(
                  //   //   fieldsList: dummyFields,
                  //   //   onSelected: (value) {
                  //   //     print("Selected value: $value");
                  //   //   },
                  //   // ),
                  //   child: MultiLevelDropdownSubItem()
                  // ),
                ],
              ),
            ),
            MultiLevelDropdownSubItem()
          ],
        ),
      ),
    );
  }
}

class ResponsiveDropDownWithMultiSelect extends StatefulWidget {
  final List<String> items;
  final String? title;
  final String? hint;
  final bool isMultiSelect;
  final bool isSearchable;
  final bool isGrouped;

  const ResponsiveDropDownWithMultiSelect({
    super.key,
    required this.items,
    this.title,
    this.hint,
    this.isMultiSelect = false,
    this.isSearchable = false,
    this.isGrouped = false,
  });

  @override
  State<ResponsiveDropDownWithMultiSelect> createState() => _ResponsiveDropDownWithMultiSelectState();
}

class _ResponsiveDropDownWithMultiSelectState extends State<ResponsiveDropDownWithMultiSelect> {
  // Dropdown state management
  final DropdownOverlayController overlayController = DropdownOverlayController();
  final TextEditingController searchController = TextEditingController();

  // Selection management
  List<String> selectedItems = [];
  String? selectedSingleItem;
  List<String> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = widget.items;
  }

  @override
  void dispose() {
    overlayController.dispose();
    searchController.dispose();
    super.dispose();
  }

  // Search filtering method
  void filterItems(String query) {
    setState(() {
      filteredItems =
          widget.items
              .where((item) => item.toLowerCase().contains(query.toLowerCase()))
              .toList();
    });
  }

  // Item selection handler
  void onItemSelected(String item) {
    if (widget.isMultiSelect) {
      setState(() {
        selectedItems = MultiSelectManager.toggleItem(
          selectedItems,
          item,
          addMode: !selectedItems.contains(item),
        );
      });
    } else {
      setState(() {
        selectedSingleItem = item;
      });
      overlayController.removeOverlay();
    }
  }

  // Build method for dropdown trigger
  Widget buildDropdownTrigger() {
    if (widget.isMultiSelect) {
      return Container(
        padding: const EdgeInsets.all(8),
        decoration: DropdownStyles.containerDecoration(),
        child: Row(
          children: [
            Expanded(
              child:
                  selectedItems.isEmpty
                      ? Text(
                        widget.hint ?? 'Select items',
                        style: TextStyle(color: Colors.grey.shade600),
                      )
                      : Wrap(
                        spacing: 8,
                        runSpacing: 4,
                        children: MultiSelectManager.createItemChips(
                          selectedItems,
                          onDelete: (item) {
                            setState(() {
                              selectedItems.remove(item);
                            });
                          },
                        ),
                      ),
            ),
            Icon(
              overlayController.isOpen
                  ? Icons.arrow_drop_up
                  : Icons.arrow_drop_down,
            ),
          ],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      decoration: DropdownStyles.containerDecoration(),
      child: Row(
        children: [
          Expanded(
            child: Text(
              selectedSingleItem ?? (widget.hint ?? 'Select an item'),
              style: TextStyle(
                color:
                    selectedSingleItem != null
                        ? Colors.black
                        : Colors.grey.shade600,
              ),
            ),
          ),
          Icon(
            overlayController.isOpen
                ? Icons.arrow_drop_up
                : Icons.arrow_drop_down,
          ),
        ],
      ),
    );
  }

  // Build method for dropdown overlay
  Widget buildDropdownOverlay() {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        constraints: const BoxConstraints(maxHeight: 250),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Optional search field
            if (widget.isSearchable)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: searchController,
                  decoration: const InputDecoration(
                    hintText: 'Search...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: filterItems,
                ),
              ),

            // Items list
            Flexible(
              child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  // Multi-select with checkboxes
                  if (widget.isMultiSelect) {
                    return CheckboxListTile(
                      title: Text(filteredItems[index]),
                      value: selectedItems.contains(filteredItems[index]),
                      onChanged: (bool? selected) {
                        onItemSelected(filteredItems[index]);
                      },
                    );
                  }

                  // Single select list tile
                  return ListTile(
                    title: Text(filteredItems[index]),
                    selected: filteredItems[index] == selectedSingleItem,
                    onTap: () => onItemSelected(filteredItems[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: overlayController.layerLink,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Optional title
          if (widget.title != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                widget.title!,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
            ),

          // Dropdown trigger
          GestureDetector(
            onTap: () {
              overlayController.toggleOverlay(
                context: context,
                overlayBuilder: (context) => buildDropdownOverlay(),
              );
            },
            child: buildDropdownTrigger(),
          ),
        ],
      ),
    );
  }
}

/// Provides common overlay functionality for dropdown widgets
class DropdownOverlayController extends GetxController {
  DropdownOverlayController({this.overlayEntry});

  final LayerLink layerLink = LayerLink();
  OverlayEntry? overlayEntry;
  bool isOpen = false;

  /// Shows an overlay with a given builder function
  void showOverlay({
    required BuildContext context,
    required WidgetBuilder overlayBuilder,
    double offsetY = 5.0,
  }) {
    // Remove any existing overlay
    removeOverlay();

    // Find the render box of the current context
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    // Create and insert the new overlay
    overlayEntry = OverlayEntry(
      builder:
          (context) => Positioned(
            width: size.width,
            child: CompositedTransformFollower(
              link: layerLink,
              showWhenUnlinked: false,
              offset: Offset(0.0, size.height + offsetY),
              child: overlayBuilder(context),
            ),
          ),
    );

    Overlay.of(context).insert(overlayEntry!);
    isOpen = true;
  }

  /// Removes the current overlay
  void removeOverlay() {
    overlayEntry?.remove();
    overlayEntry = null;
    isOpen = false;
  }

  /// Toggles the overlay's visibility
  void toggleOverlay({
    required BuildContext context,
    required WidgetBuilder overlayBuilder,
  }) {
    if (isOpen) {
      removeOverlay();
    } else {
      showOverlay(context: context, overlayBuilder: overlayBuilder);
    }
  }

  /// Dispose method to clean up resources
  void dispose() {
    removeOverlay();
  }
}

/// A reusable configuration class for dropdown styling
class DropdownStyles {
  /// Standard container decoration for dropdown
  static BoxDecoration containerDecoration({
    Color backgroundColor = Colors.white,
    double borderRadius = 8.0,
  }) {
    return BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(borderRadius),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }

  /// Standard input decoration for dropdown
  static InputDecoration inputDecoration({
    String? hintText,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.black),
      suffixIcon: suffixIcon,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    );
  }
}

/// A utility class for managing item selection in multi-select scenarios
class MultiSelectManager {
  /// Adds or removes an item from a list
  static List<String> toggleItem(
    List<String> currentItems,
    String item, {
    bool addMode = true,
  }) {
    final newSelectedItems = List<String>.from(currentItems);

    if (addMode) {
      if (!newSelectedItems.contains(item)) {
        newSelectedItems.add(item);
      }
    } else {
      newSelectedItems.remove(item);
    }

    return newSelectedItems;
  }

  /// Creates chips for selected items with optional deletion
  static List<Widget> createItemChips(
    List<String> selectedItems, {
    void Function(String)? onDelete,
  }) {
    return selectedItems.map((item) {
      return Chip(
        label: Text(item),
        onDeleted: onDelete != null ? () => onDelete(item) : null,
      );
    }).toList();
  }

  /// Generates choice chips with selection state
  static List<Widget> createChoiceChips(
    List<String> allItems,
    List<String> selectedItems, {
    void Function(String, bool)? onSelectionChanged,
  }) {
    return allItems.map((item) {
      final isSelected = selectedItems.contains(item);
      return ChoiceChip(
        label: Text(item),
        selected: isSelected,
        onSelected: (selected) {
          onSelectionChanged?.call(item, selected);
        },
      );
    }).toList();
  }
}



class MultiLevelDropdown extends StatefulWidget {
  final List<Field> fieldsList;
  final ValueChanged<String?> onSelected;

  const MultiLevelDropdown({
    super.key,
    required this.fieldsList,
    required this.onSelected,
  });

  @override
  _MultiLevelDropdownState createState() => _MultiLevelDropdownState();
}

class _MultiLevelDropdownState extends State<MultiLevelDropdown> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: PopupMenuButton<String>(
        constraints: const BoxConstraints(minWidth: 180),
        color: Theme.of(context).colorScheme.primaryContainer,
        offset: const Offset(-10, 38),
        onSelected: (value) {
          setState(() {
            selectedValue = value;
          });
          widget.onSelected(value);
        },
        itemBuilder: (context) => widget.fieldsList.map((field) {
          return PopupMenuItem<String>(
            value: field.dataType == 'ManyToManyRel' ? field.relatedModel?.verboseName : field.verboseName,
            child: Text(
              field.verboseName ?? field.name ?? "",
              style: const TextStyle(fontSize: 14),
            ),
          );
        }).toList(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                selectedValue ?? "Select Field",
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 14),
              ),
            ),
            const Icon(Icons.arrow_drop_down, color: Colors.blue),
          ],
        ),
      ),
    );
  }
}


class Field {
  final String title;
  final String? key;
  final List<Field> children;
  final String? value;
  final bool isLeaf;
  final bool isExpanded;
  final String? name;
  final String? verboseName;
  final String? dataType;
  final Field? relatedModel;

  Field(
    this.key,
    this.children,
    this.value,
    this.isLeaf,
    this.isExpanded, {
    required this.title,
    this.name,
    this.verboseName,
    this.dataType,
    this.relatedModel,
  });
}








class MultiLevelDropdownSubItem extends StatefulWidget {
  const MultiLevelDropdownSubItem({super.key});

  @override
  _MultiLevelDropdownSubItemState createState() => _MultiLevelDropdownSubItemState();
}

class _MultiLevelDropdownSubItemState extends State<MultiLevelDropdownSubItem> {
  String? selectedValue;

  final Map<String, Map<String, Set<String>>> dropdownData = {
    "California": {
      "Los Angeles": {"Beverly Hills", "Hollywood", "Santa Monica"},
      "San Francisco": {"Mission District", "Fisherman's Wharf", "Chinatown"}
    },
    "Texas": {
      "Houston": {"Downtown", "Midtown", "Uptown"},
      "Dallas": {"Deep Ellum", "Bishop Arts District", "Oak Lawn"}
    },
    "New York": {
      "New York City": {"Brooklyn", "Manhattan", "Queens"},
      "Buffalo": {"Allentown", "Elmwood Village", "North Buffalo"}
    },
    "Florida": {
      "Miami": {"Little Havana", "Wynwood", "Coconut Grove"},
      "Orlando": {"Lake Nona", "Winter Park", "Downtown Orlando"}
    }
  };

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: PopupMenuButton<String>(
        constraints: const BoxConstraints(minWidth: 110, maxWidth: 110),
        color: Theme.of(context).colorScheme.primaryContainer,
        offset: const Offset(0, 48),
        onSelected: (value) {
          setState(() {
            selectedValue = value;
          });
        },
        itemBuilder: (context) => dropdownData.entries.map((province) {
          return PopupMenuItem<String>(
            child: SubMenu(
              title: province.key,
              subItems: province.value.map((key, value) => MapEntry(key, value.toList())),
              onSelected: (value) {
                setState(() {
                  selectedValue = value;
                });
              },
            ),
          );
        }).toList(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(selectedValue ?? "Please select",
                    overflow: TextOverflow.ellipsis),
              ),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
    );
  }
}
class SubMenu extends StatelessWidget {
  final String title;
  final Map<String, List<String>> subItems;
  final ValueChanged<String> onSelected;
  const SubMenu({
    super.key,
    required this.title,
    required this.subItems,
    required this.onSelected,
  });
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      constraints: BoxConstraints(minWidth: 110, maxWidth: 110),
      offset: Offset(100, 0),
      color: Theme.of(context).colorScheme.primaryContainer,
      onSelected: onSelected,
      itemBuilder: (context) => subItems.entries.expand((city) {
        return [
          PopupMenuItem<String>(
            child: SizedBox(
              width: 100,
              child: PopupMenuButton<String>(
                constraints: BoxConstraints(minWidth: 110, maxWidth: 110),
                color: Theme.of(context).colorScheme.primaryContainer,
                offset: Offset(100, 0),
                onSelected: (area) {
                  onSelected("$area");
                  debugPrint("printing the area ::::: ==>    $area");
                  debugPrint("printing the title / city.key / area ::::: =====>    $title / ${city.key} / $area");
                },
                itemBuilder: (context) => city.value
                    .map((area) => PopupMenuItem<String>(
                          value: "$title/${city.key}/$area",
                          child: SizedBox(
                            width: 100,
                            child: Text(area, overflow: TextOverflow.ellipsis),
                          ),
                        ))
                    .toList(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        child: Text(city.key, overflow: TextOverflow.ellipsis)),
                    const Icon(Icons.arrow_right),
                  ],
                ),
              ),
            ),
          ),
        ];
      }).toList(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(child: Text(title, overflow: TextOverflow.ellipsis)),
          const Icon(Icons.arrow_right),
        ],
      ),
    );
  }
}