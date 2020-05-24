import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:uuid/uuid.dart';

class AdvisorProgressBar extends StatelessWidget {
  final int totalSteps;
  final int currentStep;
  final double padding;
  final double size;
  final String uuid = Uuid().v1();
  final Color selectedColor = Colors.green;
  final List<Color> indicatorColors = [Colors.green, Colors.green, Colors.green, Colors.orange, Colors.orange, Colors.red];
  final Color unselectedColor = Colors.black12;
  final bool showLabel;
  final String label;

  AdvisorProgressBar({
    Key key,
    // this.uuid = ,
    @required this.totalSteps,
    @required this.currentStep,
    @required this.padding,
    @required this.size,
    @required this.showLabel,
    this.label
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
                selectedColor: indicatorColors[currentStep],
                unselectedColor: unselectedColor,
              )
              // child: LinearProgressIndicator(
              //   value: percentComplete,
              //   backgroundColor: Colors.grey.withAlpha(50),
                // valueColor: AlwaysStoppedAnimation<Color>(todoObject.color),
              // ),
            ),
            showLabel ? Text(label == null ? "" : label, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 12)) : Text(""),
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