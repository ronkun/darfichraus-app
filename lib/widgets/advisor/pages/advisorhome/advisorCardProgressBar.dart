import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class AdvisorProgressBar extends StatelessWidget {
  final int totalSteps;
  final int currentStep;
  final double padding;
  final double size;
  final String uuid;
  final Color selectedColor = Colors.green;
  final Color unselectedColor = Colors.black12;

  const AdvisorProgressBar({
    Key key,
    this.totalSteps,
    this.currentStep,
    this.padding,
    this.size,
    this.uuid
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: uuid + "_progress_bar",
      child: Material(
        color: Colors.transparent,
        child: Row(
          children: <Widget>[
            Expanded(
              child: StepProgressIndicator(
                totalSteps: totalSteps,
                currentStep: currentStep,
                padding: padding,
                size: size,
                // progressDirection: TextDirection.rtl,
                selectedColor: selectedColor,
                unselectedColor: unselectedColor,
              )
              // child: LinearProgressIndicator(
              //   value: percentComplete,
              //   backgroundColor: Colors.grey.withAlpha(50),
              //   valueColor: AlwaysStoppedAnimation<Color>(todoObject.color),
              // ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.0, right: 5.0),
            //   // child: Text((percentComplete * 100).round().toString() + "%"),
            )
          ],
        ),
      ),
    );
  }
} 
