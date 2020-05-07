import 'package:crimsy/widgets/advisor/customCheckboxTile.dart';
import 'package:crimsy/widgets/advisor/objects/stateObject.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatefulWidget {
  DetailPage({@required this.advisorCardObject, Key key}) : super(key: key);

  final AdvisorCardObject advisorCardObject;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with TickerProviderStateMixin {
  double percentComplete;
  AnimationController animationBar;
  double barPercent = 0.0;
  Tween<double> animT;
  AnimationController scaleAnimation;

  @override
  void initState() {
    scaleAnimation = AnimationController(vsync: this, duration: Duration(milliseconds: 1000), lowerBound: 0.0, upperBound: 1.0);
    percentComplete = widget.advisorCardObject.percentComplete();
    barPercent = percentComplete;
    animationBar = AnimationController(vsync: this, duration: Duration(milliseconds: 100))
      ..addListener(() {
        setState(() {
          barPercent = animT.transform(animationBar.value);
        });
      });
    animT = Tween<double>(begin: percentComplete, end: percentComplete);
    scaleAnimation.forward();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    animationBar.dispose();
    scaleAnimation.dispose();
  }

  void updateBarPercent() async {
    double newPercentComplete = widget.advisorCardObject.percentComplete();
    if (animationBar.status == AnimationStatus.forward || animationBar.status == AnimationStatus.completed) {
      animT.begin = newPercentComplete;
      await animationBar.reverse();
    } else {
      animT.end = newPercentComplete;
      await animationBar.forward();
    }
    percentComplete = newPercentComplete;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Hero(
          tag: widget.advisorCardObject.uuid + "_background",
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(0.0),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: Hero(
              tag: widget.advisorCardObject.uuid + "_backIcon",
              child: Material(
                color: Colors.transparent,
                type: MaterialType.transparency,
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Colors.grey,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
            actions: <Widget>[
              Hero(
                tag: widget.advisorCardObject.uuid + "_more_vert",
                child: Material(
                  color: Colors.transparent,
                  type: MaterialType.transparency,
                  child: PopupMenuButton(
                    icon: Icon(
                      Icons.more_vert,
                      color: Colors.grey,
                    ),
                    itemBuilder: (context) => <PopupMenuEntry<AdvisorCardSettings>>[
                      PopupMenuItem(
                        child: Text("Test"),
                        value: AdvisorCardSettings.edit_color,
                      ),
                      PopupMenuItem(
                        child: Text("Entfernen"),
                        value: AdvisorCardSettings.delete,
                      ),
                    ],
                    onSelected: (setting) {
                      switch (setting) {
                        case AdvisorCardSettings.edit_color:
                          print("Test");
                          break;
                        case AdvisorCardSettings.delete:
                          print("delete clicked");
                          break;
                      }
                    },
                  ),
                ),
              )
            ],
          ),
          body: Padding(
            padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 35.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 30.0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Hero(
                      tag: widget.advisorCardObject.uuid + "_icon",
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey.withAlpha(70), style: BorderStyle.solid, width: 1.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            widget.advisorCardObject.icon,
                            color: widget.advisorCardObject.color,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 12.0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Hero(
                      tag: widget.advisorCardObject.uuid + "_number_of_tasks",
                      child: Material(
                        color: Colors.transparent,
                        child: Text(
                          widget.advisorCardObject.taskAmount().toString() + " Tasks",
                          style: TextStyle(),
                          softWrap: false,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Hero(
                      tag: widget.advisorCardObject.uuid + "_title",
                      child: Material(
                        color: Colors.transparent,
                        child: Text(
                          widget.advisorCardObject.title,
                          style: TextStyle(fontSize: 30.0),
                          softWrap: false,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 30.0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Hero(
                      tag: widget.advisorCardObject.uuid + "_progress_bar",
                      child: Material(
                        color: Colors.transparent,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: LinearProgressIndicator(
                                value: barPercent,
                                backgroundColor: Colors.grey.withAlpha(50),
                                valueColor: AlwaysStoppedAnimation<Color>(widget.advisorCardObject.color),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text((barPercent * 100).round().toString() + "%"),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Hero(
                    tag: widget.advisorCardObject.uuid + "_just_a_test",
                    child: Material(
                      type: MaterialType.transparency,
                      child: FadeTransition(
                        opacity: scaleAnimation,
                        child: ScaleTransition(
                          scale: scaleAnimation,
                          child: ListView.builder(
                            padding: EdgeInsets.all(0.0),
                            itemBuilder: (BuildContext context, int index) {
                              DateTime currentDate = widget.advisorCardObject.tasks.keys.toList()[index];
                              DateTime _now = DateTime.now();
                              DateTime today = DateTime(_now.year, _now.month, _now.day);
                              String dateString;
                              if (currentDate.isBefore(today.subtract(Duration(days: 7)))) {
                                dateString = DateFormat.yMMMMEEEEd().format(currentDate);
                              } else if (currentDate.isBefore(today)) {
                                dateString = "Previous - " + DateFormat.E().format(currentDate);
                              } else if (currentDate.isAtSameMomentAs(today)) {
                                dateString = "Today";
                              } else if (currentDate.isAtSameMomentAs(today.add(Duration(days: 1)))) {
                                dateString = "Tomorrow";
                              } else {
                                dateString = DateFormat.E().format(currentDate);
                              }
                              List<Widget> tasks = [Text(dateString)];
                              widget.advisorCardObject.tasks[currentDate].forEach((task) {
                                tasks.add(CustomCheckboxListTile(
                                  activeColor: widget.advisorCardObject.color,
                                  value: task.isCompleted(),
                                  onChanged: (value) {
                                    setState(() {
                                      task.setComplete(value);
                                      updateBarPercent();
                                    });
                                  },
                                  title: Text(task.task),
                                  secondary: Icon(Icons.alarm),
                                ));
                              });
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: tasks,
                              );
                            },
                            itemCount: widget.advisorCardObject.tasks.length,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
