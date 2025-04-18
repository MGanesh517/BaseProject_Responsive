import 'package:flutter/material.dart';
import 'package:gowri_seva_sangam/Screen/Scaffold%20Custom%20Appbar/custom_appbar.dart';


class AntDesignStepperExampleScreen extends StatefulWidget {
  const AntDesignStepperExampleScreen({super.key});

  @override
  State<AntDesignStepperExampleScreen> createState() => _AntDesignStepperExampleScreenState();
}

class _AntDesignStepperExampleScreenState extends State<AntDesignStepperExampleScreen> {
  int currentStep = 0;

  final List<StepItem> _steps = [
    StepItem(title: "Details", description: "Fill your details"),
    StepItem(title: "Personal", description: "Enter personal info"),
    StepItem(title: "Contact", description: "Provide contact"),
  ];

  void nextStep() {
    if (currentStep < _steps.length - 1) {
      setState(() => currentStep++);
    }
  }

  void prevStep() {
    if (currentStep > 0) {
      setState(() => currentStep--);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffoldWithAppBar(
      // appBar: AppBar(title: const Text("Ant Design Stepper")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Basic Horizontal Stepper",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 400,
              child: AntDesignStepper(
                steps: _steps,
                currentStep: currentStep,
                onStepTapped: (index) => setState(() => currentStep = index),
                onStepContinue: nextStep,
                onStepCancel: prevStep,
                type: StepperType.horizontal,
                activeColor: Colors.blue,
              ),
            ),
            
            const Divider(),
            
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Vertical Stepper",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 400,
              child: AntDesignStepper(
                steps: _steps,
                currentStep: currentStep,
                onStepTapped: (index) => setState(() => currentStep = index),
                onStepContinue: nextStep,
                onStepCancel: prevStep,
                type: StepperType.vertical,
                activeColor: Colors.blue,
              ),
            ),
            
            const Divider(),
            
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Dot Style Stepper",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 400,
              child: AntDesignStepper(
                steps: _steps,
                currentStep: currentStep,
                onStepTapped: (index) => setState(() => currentStep = index),
                onStepContinue: nextStep,
                onStepCancel: prevStep,
                useDotStyle: true,
                activeColor: Colors.green,
              ),
            ),
            
            const Divider(),
            
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Error State Stepper",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 400,
              child: AntDesignStepper(
                steps: [
                  StepItem(title: "Completed", description: "This step is completed", state: StepState.complete),
                  StepItem(title: "Error", description: "This step has an error", state: StepState.error),
                  StepItem(title: "Pending", description: "This step is pending"),
                ],
                currentStep: currentStep,
                onStepTapped: (index) => setState(() => currentStep = index),
                onStepContinue: nextStep,
                onStepCancel: prevStep,
                type: StepperType.horizontal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}




class AntDesignStepper extends StatefulWidget {
  final List<StepItem> steps;
  final int currentStep;
  final Function(int) onStepTapped;
  final VoidCallback? onStepContinue;
  final VoidCallback? onStepCancel;
  final StepperType type;
  final bool showControls;
  final Color activeColor;
  final Color inactiveColor;
  final double iconSize;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;
  final bool showStepDescription;
  final bool useDotStyle;
  final EdgeInsetsGeometry padding;
  
  const AntDesignStepper({
    super.key,
    required this.steps,
    required this.currentStep,
    required this.onStepTapped,
    this.onStepContinue,
    this.onStepCancel,
    this.type = StepperType.horizontal,
    this.showControls = true,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    this.iconSize = 24.0,
    this.titleStyle,
    this.descriptionStyle,
    this.showStepDescription = true,
    this.useDotStyle = false,
    this.padding = const EdgeInsets.all(16.0),
  });

  @override
  State<AntDesignStepper> createState() => _AntDesignStepperState();
}

class _AntDesignStepperState extends State<AntDesignStepper> {
  @override
  Widget build(BuildContext context) {
    return widget.type == StepperType.horizontal
        ? buildHorizontalStepper()
        : buildVerticalStepper();
  }

  Widget buildHorizontalStepper() {
    return Padding(
      padding: widget.padding,
      child: Column(
        children: [
          Row(
            children: List.generate(widget.steps.length * 2 - 1, (index) {
              // Even indices are steps, odd indices are connectors
              if (index.isEven) {
                final stepIndex = index ~/ 2;
                return Expanded(
                  child: _buildStepIcon(stepIndex),
                );
              } else {
                // Connector line
                final beforeIndex = index ~/ 2;
                return Expanded(
                  flex: 2,
                  child: Container(
                    height: 2,
                    color: beforeIndex < widget.currentStep
                        ? widget.activeColor
                        : widget.inactiveColor.withOpacity(0.3),
                  ),
                );
              }
            }),
          ),
          const SizedBox(height: 8),
          
          // Step titles
          Row(
            children: List.generate(widget.steps.length, (index) {
              return Expanded(
                child: GestureDetector(
                  onTap: () => widget.onStepTapped(index),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Text(
                      widget.steps[index].title,
                      textAlign: TextAlign.center,
                      style: widget.titleStyle?.copyWith(
                        color: index == widget.currentStep
                            ? widget.activeColor
                            : widget.inactiveColor,
                        fontWeight: index == widget.currentStep
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ) ??
                      TextStyle(
                        color: index == widget.currentStep
                            ? widget.activeColor
                            : widget.inactiveColor,
                        fontWeight: index == widget.currentStep
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
          
          // Current step content
          if (widget.showStepDescription) ...[
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                widget.steps[widget.currentStep].description,
                style: widget.descriptionStyle,
              ),
            ),
          ],
          
          // Controls
          if (widget.showControls) ...[
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (widget.currentStep > 0)
                  TextButton(
                    onPressed: widget.onStepCancel,
                    child: const Text('Previous'),
                  ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: widget.onStepContinue,
                  child: Text(
                    widget.currentStep >= widget.steps.length - 1
                        ? 'Finish'
                        : 'Next'
                  ),
                ),
              ],
            ),
          ]
        ],
      ),
    );
  }

  Widget buildVerticalStepper() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.steps.length,
      padding: widget.padding,
      itemBuilder: (context, index) {
        // Step item
        final isLast = index == widget.steps.length - 1;
        return Column(
          children: [
            // Step row
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Step icon and connector
                Column(
                  children: [
                    _buildStepIcon(index, showCircle: false),
                    if (!isLast)
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        width: 2,
                        height: 50,
                        color: index < widget.currentStep
                            ? widget.activeColor
                            : widget.inactiveColor.withOpacity(0.3),
                      ),
                  ],
                ),
                const SizedBox(width: 16),
                
                // Step content
                Expanded(
                  child: GestureDetector(
                    onTap: () => widget.onStepTapped(index),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.steps[index].title,
                          style: widget.titleStyle?.copyWith(
                            color: index == widget.currentStep
                                ? widget.activeColor
                                : index < widget.currentStep
                                    ? Colors.black
                                    : widget.inactiveColor,
                            fontWeight: index == widget.currentStep
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ) ??
                          TextStyle(
                            color: index == widget.currentStep
                                ? widget.activeColor
                                : index < widget.currentStep
                                    ? Colors.black
                                    : widget.inactiveColor,
                            fontWeight: index == widget.currentStep
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                        if (widget.showStepDescription && index == widget.currentStep) ...[
                          const SizedBox(height: 8),
                          Text(
                            widget.steps[index].description,
                            style: widget.descriptionStyle,
                          ),
                          if (widget.showControls && index == widget.currentStep) ...[
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                if (widget.currentStep > 0)
                                  TextButton(
                                    onPressed: widget.onStepCancel,
                                    child: const Text('Previous'),
                                  ),
                                const SizedBox(width: 8),
                                ElevatedButton(
                                  onPressed: widget.onStepContinue,
                                  child: Text(
                                    widget.currentStep >= widget.steps.length - 1
                                        ? 'Finish'
                                        : 'Next'
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
        );
      },
    );
  }

  Widget _buildStepIcon(int index, {bool showCircle = true}) {
    final StepState state = index < widget.currentStep
        ? StepState.complete
        : index == widget.currentStep
            ? StepState.indexed
            : widget.steps[index].state == StepState.error
                ? StepState.error
                : StepState.disabled;

    return GestureDetector(
      onTap: () => widget.onStepTapped(index),
      child: Column(
        children: [
          if (widget.useDotStyle)
            Container(
              width: widget.iconSize,
              height: widget.iconSize,
              decoration: BoxDecoration(
                color: state == StepState.complete || state == StepState.indexed
                    ? widget.activeColor
                    : state == StepState.error
                        ? Colors.red
                        : widget.inactiveColor.withOpacity(0.4),
                shape: BoxShape.circle,
              ),
              child: state == StepState.complete
                  ? Icon(
                      Icons.check,
                      color: Colors.white,
                      size: widget.iconSize * 0.6,
                    )
                  : state == StepState.error
                      ? Icon(
                          Icons.close,
                          color: Colors.white,
                          size: widget.iconSize * 0.6,
                        )
                      : state == StepState.indexed
                          ? Center(
                              child: Text(
                                '${index + 1}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: widget.iconSize * 0.5,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          : null,
            )
          else
            state == StepState.complete
                ? Icon(
                    Icons.check_circle,
                    color: widget.activeColor,
                    size: widget.iconSize,
                  )
                : state == StepState.error
                    ? Icon(
                        Icons.error,
                        color: Colors.red,
                        size: widget.iconSize,
                      )
                    : Container(
                        width: widget.iconSize,
                        height: widget.iconSize,
                        decoration: BoxDecoration(
                          color: state == StepState.indexed
                              ? widget.activeColor
                              : Colors.transparent,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: state == StepState.indexed
                                ? widget.activeColor
                                : widget.inactiveColor,
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '${index + 1}',
                            style: TextStyle(
                              color: state == StepState.indexed
                                  ? Colors.white
                                  : widget.inactiveColor,
                              fontSize: widget.iconSize * 0.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
        ],
      ),
    );
  }
}

class StepItem {
  final String title;
  final String description;
  final StepState state;

  const StepItem({
    required this.title,
    required this.description,
    this.state = StepState.indexed,
  });
}