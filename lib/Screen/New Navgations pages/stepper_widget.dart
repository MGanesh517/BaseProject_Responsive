import 'package:flutter/material.dart';
import 'package:gowri_seva_sangam/Screen/Scaffold%20Custom%20Appbar/custom_appbar.dart';


class StepperWidgetExamples extends StatefulWidget {
  const StepperWidgetExamples({super.key});

  @override
  State<StepperWidgetExamples> createState() => _StepperWidgetExamplesState();
}

class _StepperWidgetExamplesState extends State<StepperWidgetExamples> {
  int stepIndex = 0;

  final List<Step> steps = [
    Step(title: const Text("Details"), content: const Text("Fill your details")),
    Step(title: const Text("Personal"), content: const Text("Enter personal info")),
    Step(title: const Text("Contact"), content: const Text("Provide contact")),
  ];

  void nextStep() {
    setState(() {
      if (stepIndex < steps.length - 1) stepIndex++;
    });
  }

  void prevStep() {
    setState(() {
      if (stepIndex > 0) stepIndex--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffoldWithAppBar(
      // appBar: AppBar(title: const Text("Flutter Stepper Examples")),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("1. Horizontal Stepper", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 400,
              child: CommonStepper(
                currentStep: stepIndex,
                steps: steps,
                type: StepperType.horizontal,
                onStepContinue: nextStep,
                onStepCancel: prevStep,
                onStepTapped: (index) => setState(() => stepIndex = index),
              ),
            ),
            const Divider(),
        
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("2. Vertical Stepper", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 400,
              child: CommonStepper(
                currentStep: stepIndex,
                steps: steps,
                type: StepperType.vertical,
                onStepContinue: nextStep,
                onStepCancel: prevStep,
                onStepTapped: (index) => setState(() => stepIndex = index),
              ),
            ),
            const Divider(),
        
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("3. Stepper without Controls", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 400,
              child: CommonStepper(
                currentStep: stepIndex,
                steps: steps,
                type: StepperType.vertical,
                showControls: false,
                onStepTapped: (index) => setState(() => stepIndex = index),
              ),
            ),
            const Divider(),
        
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("4. Stepper with Custom Status (Error)", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 400,
              child: CommonStepper(
                currentStep: stepIndex,
                steps: [
                  const Step(title: Text("Step 1"), content: Text("Valid"), state: StepState.complete),
                  const Step(title: Text("Step 2"), content: Text("Error occurred"), state: StepState.error),
                  const Step(title: Text("Step 3"), content: Text("Continue"), state: StepState.indexed),
                ],
                type: StepperType.horizontal,
                onStepTapped: (index) => setState(() => stepIndex = index),
                onStepContinue: nextStep,
                onStepCancel: prevStep,
              ),
            ),
            const Divider(),
        
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("5. Small Size Stepper (Custom UI)", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: steps.asMap().entries.map((entry) {
                  final index = entry.key;
                  return Row(
                    children: [
                      GestureDetector(
                        onTap: () => setState(() => stepIndex = index),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: stepIndex == index ? Colors.blue : Colors.grey[300],
                          ),
                          child: Text('${index + 1}', style: const TextStyle(color: Colors.white)),
                        ),
                      ),
                      // Add connector line between steps
                      if (index < steps.length - 1)
                        Container(
                          width: 30,
                          height: 2,
                          color: Colors.grey[300],
                        ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class CommonStepper extends StatelessWidget {
  final int currentStep;
  final List<Step> steps;
  final StepperType type;
  final bool showControls;
  final Function()? onStepContinue;
  final Function()? onStepCancel;
  final void Function(int)? onStepTapped;
  final double? stepIconSize;
  final double? connectorThickness;
  final WidgetStateProperty<Color>? connectorColor;
  final EdgeInsetsGeometry? margin;
  final double? elevation;
  final ScrollController? controller;
  final Clip clipBehavior;
  final ScrollPhysics? physics;

  const CommonStepper({
    super.key,
    required this.currentStep,
    required this.steps,
    this.type = StepperType.vertical,
    this.showControls = true,
    this.onStepContinue,
    this.onStepCancel,
    this.onStepTapped,
    this.stepIconSize,
    this.connectorThickness,
    this.connectorColor,
    this.margin,
    this.elevation,
    this.controller,
    this.clipBehavior = Clip.hardEdge,
    this.physics,
  });

  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: currentStep,
      type: type,
      steps: steps,
      onStepTapped: onStepTapped,
      onStepContinue: showControls ? onStepContinue : null,
      onStepCancel: showControls ? onStepCancel : null,
      controlsBuilder: showControls ? null : (context, _) => const SizedBox.shrink(),

      stepIconBuilder: (stepIndex, stepState) {
        // Custom icon logic can go here
        return null;
      },
      stepIconHeight: stepIconSize,
      connectorThickness: connectorThickness,
      connectorColor: connectorColor,
      margin: margin,
      elevation: elevation,
      controller: controller,
      clipBehavior: clipBehavior,
      physics: physics,
    );
  }
}