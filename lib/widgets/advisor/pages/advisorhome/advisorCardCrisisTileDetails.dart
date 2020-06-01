import 'package:crimsy/utils/colors.dart';
import 'package:crimsy/widgets/advisor/objects/advisorCardObject.dart';
import 'package:crimsy/widgets/advisor/objects/stateObject.dart';
import 'package:crimsy/widgets/advisor/pages/advisorhome/advisorCardProgressBar.dart';
import 'package:crimsy/widgets/advisor/pages/advisorhome/widgets/advisorFeedTile.dart';
import 'package:crimsy/widgets/advisor/pages/advisorhome/widgets/advisorPandemicInfectionsCard.dart';
import 'package:crimsy/widgets/advisor/pages/advisorhome/widgets/advisorSymptomsTile.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  DetailPage({@required this.advisorCardObject, Key key, this.restrictionIcons}) : super(key: key);

  final AdvisorCardObject advisorCardObject;
  final List<Image> restrictionIcons;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with TickerProviderStateMixin {
  TabController _tabController;
  // double percentComplete;
  // AnimationController animationBar;
  // double barPercent = 0.0;
  Tween<double> animT;
  // AnimationController scaleAnimation;

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    // scaleAnimation = AnimationController(vsync: this, duration: Duration(milliseconds: 1000), lowerBound: 0.0, upperBound: 1.0);
    // animationBar = AnimationController(vsync: this, duration: Duration(milliseconds: 100))
    //   ..addListener(() {
    //     setState(() {
    //       barPercent = animT.transform(animationBar.value);
    //     });
    //   });
    // animT = Tween<double>(begin: percentComplete, end: percentComplete);
    // scaleAnimation.forward();
    super.initState();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

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
            title: Text(widget.advisorCardObject.title),
            backgroundColor: MainColors.dirMainBlue,
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
            bottom: TabBar(
              unselectedLabelColor: Colors.white,
              labelColor: Colors.amber,
              tabs: [
                Tab(icon: Icon(Icons.public)),
                Tab(icon: Icon(Icons.insert_chart)),
                Tab(icon: Icon(Icons.rss_feed)),
              ],
              controller: _tabController, 
            ),
          ),
          body: TabBarView(
          children: [
            Padding(
            padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Row(
                  children:
                    List.generate(widget.restrictionIcons.length,(index){ 
                      return Padding(padding: EdgeInsets.only(left: 0, right: 9, bottom: 15),
                        child: 
                        // Row(children: <Widget>[
                          // Text("Maskenpflicht"),
                          Padding(padding: EdgeInsets.only(left: 6),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey.withAlpha(70), style: BorderStyle.solid, width: 1.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: widget.restrictionIcons[index],
                            ),
                          )
                        )
                      );
                    }
                  ),
                ), 
                // Row(
                //   children: <Widget> [
                //   Padding(
                //     padding: EdgeInsets.only(bottom: 30.0),
                //     child: Align(
                //       alignment: Alignment.bottomLeft,
                //       child: Hero(
                //         tag: widget.advisorCardObject.uuid + "_icon",
                //         child: Container(
                //           decoration: BoxDecoration(
                //             shape: BoxShape.circle,
                //             border: Border.all(color: Colors.grey.withAlpha(70), style: BorderStyle.solid, width: 1.0),
                //           ),
                //           child: Padding(
                //             padding: EdgeInsets.all(8.0),
                //             child: Icon(
                //               widget.advisorCardObject.icon,
                //               color: widget.advisorCardObject.color,
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // ]),
                AdvisorProgressBar(
                  totalSteps: 5,
                  currentStep: 2,
                  padding: 6.0,
                  size: 5,
                  showLabel: true,
                  // uuid: widget.advisorCardObject.uuid,
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(bottom: 12.0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Hero(
                      tag: widget.advisorCardObject.uuid + "_number_of_tasks",
                      child: Material(
                        color: Colors.transparent,
                        child: Text(
                          widget.advisorCardObject.region.cityInformationZip + ' - ' + 
                          widget.advisorCardObject.region.cityInformationCity + ", " + 
                          widget.advisorCardObject.region.cityInformationState,
                          style: TextStyle(fontWeight: FontWeight.w700, color: MainColors.dirMainBlue),
                          softWrap: false,
                        ),
                      ),
                    ),
                  ),
                ),

                AdvisorSymptomsWidget(),
                AdvisorFeedWidget(),
                AdvisorPandemicInfectionsWidget(zip: widget.advisorCardObject.region.cityInformationZip),
               
              ]
            )
          ),
          Text("TEST Tab 2"),
          Text("Test Tab 3")
          ],
          controller: _tabController,
          ),
        )
      ]);
    }


    //             Padding(
    //               padding: EdgeInsets.only(bottom: 30.0),
    //               child: Align(
    //                 alignment: Alignment.bottomLeft,
    //                 child: Hero(
    //                   tag: widget.advisorCardObject.uuid + "_progress_bar",
    //                   child: Material(
    //                     color: Colors.transparent,
    //                     child: Row(
    //                       children: <Widget>[
    //                         Expanded(
    //                           child: LinearProgressIndicator(
    //                             value: barPercent,
    //                             backgroundColor: Colors.grey.withAlpha(50),
    //                             valueColor: AlwaysStoppedAnimation<Color>(widget.advisorCardObject.color),
    //                           ),
    //                         ),
    //                         Padding(
    //                           padding: EdgeInsets.only(left: 5.0),
    //                           child: Text((barPercent * 100).round().toString() + "%"),
    //                         )
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //             Expanded(
    //               child: Hero(
    //                 tag: widget.advisorCardObject.uuid + "_just_a_test",
    //                 child: Material(
    //                   type: MaterialType.transparency,
    //                   child: FadeTransition(
    //                     opacity: scaleAnimation,
    //                     child: ScaleTransition(
    //                       scale: scaleAnimation,
    //                       child: ListView.builder(
    //                         padding: EdgeInsets.all(0.0),
    //                         itemBuilder: (BuildContext context, int index) {
    //                           DateTime currentDate = widget.advisorCardObject.tasks.keys.toList()[index];
    //                           DateTime _now = DateTime.now();
    //                           DateTime today = DateTime(_now.year, _now.month, _now.day);
    //                           String dateString;
    //                           if (currentDate.isBefore(today.subtract(Duration(days: 7)))) {
    //                             dateString = DateFormat.yMMMMEEEEd().format(currentDate);
    //                           } else if (currentDate.isBefore(today)) {
    //                             dateString = "Previous - " + DateFormat.E().format(currentDate);
    //                           } else if (currentDate.isAtSameMomentAs(today)) {
    //                             dateString = "Today";
    //                           } else if (currentDate.isAtSameMomentAs(today.add(Duration(days: 1)))) {
    //                             dateString = "Tomorrow";
    //                           } else {
    //                             dateString = DateFormat.E().format(currentDate);
    //                           }
    //                           List<Widget> tasks = [Text(dateString)];
    //                           widget.advisorCardObject.tasks[currentDate].forEach((task) {
    //                             tasks.add(CustomCheckboxListTile(
    //                               activeColor: widget.advisorCardObject.color,
    //                               value: task.isCompleted(),
    //                               onChanged: (value) {
    //                                 setState(() {
    //                                   task.setComplete(value);
    //                                   updateBarPercent();
    //                                 });
    //                               },
    //                               title: Text(task.task),
    //                               secondary: Icon(Icons.alarm),
    //                             ));
    //                           });
    //                           return Column(
    //                             crossAxisAlignment: CrossAxisAlignment.start,
    //                             children: tasks,
    //                           );
    //                         },
    //                         itemCount: widget.advisorCardObject.tasks.length,
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     )
    //   ],
    // );
  }
