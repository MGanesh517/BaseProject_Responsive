import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:gowri_seva_sangam/Screen/Scaffold%20Custom%20Appbar/custom_appbar.dart';

class CheckboxExamples extends StatefulWidget {
  const CheckboxExamples({super.key});

  @override
  _CheckboxExamplesState createState() => _CheckboxExamplesState();
}

class _CheckboxExamplesState extends State<CheckboxExamples> {
  bool controlledCheckbox = true;
  bool basicCheckBox = false;
  bool disabledCheckbox = true;
  List<String> fruits = ['Apple', 'Pear', 'Orange'];
  List<String> selectedFruits = ['Apple', 'Orange'];

  bool checkAll = true;

  List<String> letters = ['A', 'B', 'C', 'D', 'E'];
  List<String> selectedLetters = ['A', 'B', 'C'];

    Color pickedColor = Colors.blue; ///// default color

  @override
  Widget build(BuildContext context) {
    return CommonScaffoldWithAppBar(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
      
            // Basic
            Text("Basic Checkbox", style: TextStyle(fontWeight: FontWeight.bold)),
            CommonComponentForCheckBox.defaultCheckbox(
              context,
              value: basicCheckBox,
              onChanged: (_) {
                setState(() {
                  basicCheckBox = true;
                });
              },
              label: "Checkbox",
            ),
      
            SizedBox(height: 20),
      
            // Disabled
            Text("Disabled Checkbox", style: TextStyle(fontWeight: FontWeight.bold)),
            CommonComponentForCheckBox.defaultCheckbox(
              context,
              value: disabledCheckbox,
              onChanged: (bool? _) {},
              label: "Disabled",
            ),
      
            SizedBox(height: 20),
      
            // Controlled
            Text("Controlled Checkbox", style: TextStyle(fontWeight: FontWeight.bold)),
            CommonComponentForCheckBox.defaultCheckbox(
              context,
              value: controlledCheckbox,
              onChanged: (val) => setState(() => controlledCheckbox = val ?? false),
              label: controlledCheckbox ? "Checked – Enabled" : "Unchecked",
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => setState(() => controlledCheckbox = false),
                  child: Text("Uncheck"),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => setState(() => controlledCheckbox = true),
                  child: Text("Check"),
                ),
              ],
            ),
      
            SizedBox(height: 20),
      
            // Checkbox Group
            Text("Checkbox Group", style: TextStyle(fontWeight: FontWeight.bold)),
            Wrap(
              spacing: 10,
              children: fruits.map((fruit) {
                return CommonComponentForCheckBox.defaultCheckbox(
                  context,
                  value: selectedFruits.contains(fruit),
                  onChanged: (val) {
                    setState(() {
                      if (val == true) {
                        selectedFruits.add(fruit);
                      } else {
                        selectedFruits.remove(fruit);
                      }
                    });
                  },
                  label: fruit,
                );
              }).toList(),
            ),
      
            SizedBox(height: 20),
      
            // Check All
            Text("Check All", style: TextStyle(fontWeight: FontWeight.bold)),
            CommonComponentForCheckBox.defaultCheckbox(
              context,
              value: checkAll,
              onChanged: (val) {
                setState(() {
                  checkAll = val ?? false;
                  selectedFruits = checkAll ? List.from(fruits) : [];
                });
              },
              label: "Check all",
            ),
            Wrap(
              spacing: 0,
              children: fruits.map((fruit) {
                return CommonComponentForCheckBox.defaultCheckbox(
                  context,
                  value: selectedFruits.contains(fruit),
                  onChanged: (val) {
                    setState(() {
                      if (val == true) {
                        selectedFruits.add(fruit);
                      } else {
                        selectedFruits.remove(fruit);
                      }
                      checkAll = selectedFruits.length == fruits.length;
                    });
                  },
                  label: fruit,
                );
              }).toList(),
            ),
      
            SizedBox(height: 20),
      
            // Grid Layout with Checkbox Group
            Text("Grid Layout with Group", style: TextStyle(fontWeight: FontWeight.bold)),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 5,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              physics: NeverScrollableScrollPhysics(),
              children: letters.map((letter) {
                return CommonComponentForCheckBox.defaultCheckbox(
                  context,
                  value: selectedLetters.contains(letter),
                  onChanged: (val) {
                    setState(() {
                      if (val == true) {
                        selectedLetters.add(letter);
                      } else {
                        selectedLetters.remove(letter);
                      }
                    });
                  },
                  label: letter,
                );
              }).toList(),
            ),
                
            SizedBox(height: 24),
            SizedBox(height: 24),

            Text("Color Picker Types", style: TextStyle(fontWeight: FontWeight.bold)),
            
            SizedBox(height: 24),
            SizedBox(height: 24),
        
          CommonColorPicker(
            initialColor: pickedColor,
            onColorChanged: (color) {
              setState(() => pickedColor = color);
            },
          ),
        
            SizedBox(height: 24),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}


class CommonColorPicker extends StatefulWidget {
  final Color initialColor;
  final void Function(Color) onColorChanged;
  final bool showLabel;

  const CommonColorPicker({
    super.key,
    required this.initialColor,
    required this.onColorChanged,
    this.showLabel = true,
  });

  @override
  State<CommonColorPicker> createState() => _CommonColorPickerState();
}

class _CommonColorPickerState extends State<CommonColorPicker> {
  late Color currentColor;

  @override
  void initState() {
    super.initState();
    currentColor = widget.initialColor;
  }

  void onColorChange(Color color) {
    setState(() => currentColor = color);
    widget.onColorChanged(color);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ColorPicker(
          pickerColor: currentColor,
          onColorChanged: onColorChange,
          colorPickerWidth: 300.0,
          enableAlpha: false,
          displayThumbColor: true,
          paletteType: PaletteType.hsvWithHue,
          labelTypes: const [
            ColorLabelType.rgb,
            ColorLabelType.hsv,
            ColorLabelType.hex,
          ],
        ),
        if (widget.showLabel)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              'Color: HEX #${currentColor.value.toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()} | '
              'RGB(${currentColor.red}, ${currentColor.green}, ${currentColor.blue})',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
      ],
    );
  }
}




class CommonComponentForCheckBox {
  static Widget defaultCheckbox(
    BuildContext context, {
    required bool value,
    required Function(bool?) onChanged,
    String label = "Checkbox",
    bool autofocus = false,
    bool isError = false,
    bool tristate = false,
    double splashRadius = 20,
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(4)),
    MouseCursor mouseCursor = MouseCursor.defer,
    FocusNode? focusNode,
    MaterialTapTargetSize materialTapTargetSize = MaterialTapTargetSize.padded,
    VisualDensity? visualDensity ,
    String? semanticLabel = "Checkbox",
  }) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: Theme.of(context).colorScheme.primary,
          checkColor: Theme.of(context).colorScheme.secondary,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          autofocus: autofocus,
          focusColor: Theme.of(context).colorScheme.primary,
          hoverColor: Theme.of(context).colorScheme.secondaryContainer,
          materialTapTargetSize: materialTapTargetSize,
          mouseCursor: mouseCursor,
          focusNode: focusNode ?? FocusNode(),
          fillColor: WidgetStatePropertyAll(
              Theme.of(context).colorScheme.primaryContainer),
          isError: isError,
          overlayColor: WidgetStatePropertyAll(
              Theme.of(context).colorScheme.outline),
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
            width: 1,
          ),
          semanticLabel: semanticLabel,
          splashRadius: splashRadius,
          tristate: tristate,
          visualDensity: visualDensity,
        ),
        Text(label),
      ],
    );
  }
}
