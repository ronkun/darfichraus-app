import 'package:crimsy/model/city_information_model.dart';
import 'package:crimsy/utils/customIcons.dart';
import 'package:crimsy/utils/utility.dart';
import 'package:crimsy/widgets/advisor/dummyData.dart';
import 'package:crimsy/widgets/advisor/objects/stateObject.dart';
import 'package:crimsy/widgets/advisor/pages/advisorhome/advisorCardCrisisTile.dart';
import 'package:crimsy/widgets/advisor/pages/advisorhome/advisorCardCrisisTileDetails.dart';
import 'package:crimsy/widgets/advisor/pages/advisorhome/advisorCardProgressBar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pref_dessert/pref_dessert.dart';

class AdvisorHome extends StatefulWidget {
  AdvisorHome({Key key}) : super(key: key);

  @override
  _AdvisorHomeState createState() => _AdvisorHomeState();
}

class _AdvisorHomeState extends State<AdvisorHome> with TickerProviderStateMixin {
  var repo = new FuturePreferencesRepository<CityInformation>(new CityInfoDesSer());
  List<CityInformation> _selectedRegionsList = [];
  ScrollController scrollController;
  Color backgroundColor;
  LinearGradient backgroundGradient;
  Tween<Color> colorTween;
  int currentPage = 0;
  Color constBackColor;

  @override
  void initState() {
    super.initState();
    colorTween = ColorTween(begin: todos[0].color, end: todos[0].color);
    backgroundColor = todos[0].color;
    backgroundGradient = todos[0].gradient;
    scrollController = ScrollController();
    scrollController.addListener(() {
      ScrollPosition position = scrollController.position;
//      ScrollDirection direction = position.userScrollDirection;
      int page = position.pixels ~/ (position.maxScrollExtent / (todos.length.toDouble() - 1));
      double pageDo = (position.pixels / (position.maxScrollExtent / (todos.length.toDouble() - 1)));
      double percent = pageDo - page;
      if (todos.length - 1 < page + 1) {
        return;
      }
      colorTween.begin = todos[page].color;
      colorTween.end = todos[page + 1].color;
      setState(() {
        backgroundColor = colorTween.transform(percent);
        backgroundGradient = todos[page].gradient.lerpTo(todos[page + 1].gradient, percent);
      });
    });

    var prefRegions = repo.findAll();
      if(prefRegions!=null) {
          prefRegions.then((val) {
            if(val.isEmpty) {
            } else {
              CityInformation saveCity = val.asMap()[0];
              _selectedRegionsList.add(saveCity);
              // print("ADDED INITIAL: "+saveCity.cityInformationCity);
            }
         }
        );
      }
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;

    return Container(
      // decoration: BoxDecoration(gradient: backgroundGradient),
      child: Scaffold(
        // backgroundColor: Colors.transparent,
        backgroundColor: Colors.grey[100],
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Spacer(
              flex: 2,
            ),
            Padding(
              padding: EdgeInsets.only(left: 50.0),
              child: Text(
                "Deutschland",
                style: TextStyle(color: Colors.black, fontSize: 30.0),
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(left: 50.0),
              child: Text(
                "Landesweit aktive Verordnungen",
                style: TextStyle(color: Colors.black87),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 50.0, top: 10),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget> [
                  GestureDetector(
                      onTap: () {print('click on edit');},
                      child: 
                          // tag: todoObject.uuid + "_icon",
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey.withAlpha(70), style: BorderStyle.solid, width: 1.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Image(image: AssetImage('assets/corona_icons/iconfinder_doctor-advise-warning-suggestion-avatar_5728189.png'), height: 24),
                          ),
                        ),
                  ), 
                  SizedBox(width: 20),
              ],
            )),
            Spacer(
              flex: 2,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 50.0,
              ),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Stand: ",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: DateFormat('dd.MM.yyyy').format(DateTime.now()),
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Expanded(
              flex: 25,
              child: FutureBuilder<List<CityInformation>>(
                  future: repo.findAll(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:       
                      case ConnectionState.active:
                      case ConnectionState.waiting:
                        return Utility.getCircularProgressIndicator(50.0, 50.0);
                      case ConnectionState.done:
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else if(snapshot.hasData) {
                          return ListView.builder(
                            padding: EdgeInsets.only(left: 40.0, right: 40.0),
                            scrollDirection: Axis.horizontal,
                            physics: _CustomScrollPhysics(),
                            // physics: ClampingScrollPhysics(),
                            // controller: scrollController,
                            // shrinkWrap: true,
                            itemExtent: _width - 80,
                            itemCount: todos.length,
                            itemBuilder: (context, index) {
                              AdvisorCardObject advisorCardObject = todos[index];
                              // double percentComplete = todoObject.percentComplete();
                              return Padding(
                                padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 30.0),
                                child: InkWell(
                                  onTap: () {
                                    // Navigator.of(context).push(
                                    //   PageRouteBuilder(
                                    //     pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) => DetailPage(advisorCardObject: advisorCardObject),
                                    //     transitionDuration: Duration(milliseconds: 1000),
                                    //   ),
                                    // );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), boxShadow: [BoxShadow(color: Colors.black.withAlpha(70), offset: Offset(3.0, 10.0), blurRadius: 15.0)]),
                                    height: 250.0,
                                    child: Stack(
                                      children: <Widget>[
                                        Hero(
                                          tag: advisorCardObject.uuid + "_background",
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(10.0),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(16.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Expanded(
                                                flex: 1,
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Stack(
                                                      children: <Widget>[
                                                        Hero(
                                                          tag: advisorCardObject.uuid + "_icon",
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                              color: Colors.white,
                                                              shape: BoxShape.circle,
                                                              border: Border.all(color: Colors.grey.withAlpha(70), style: BorderStyle.solid, width: 1.0),
                                                            ),
                                                            child: Padding(
                                                              padding: EdgeInsets.all(8.0),
                                                              child: Icon(advisorCardObject.icon, color: advisorCardObject.color),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Spacer(),
                                                    Hero(
                                                      tag: advisorCardObject.uuid + "_more_vert",
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
                                                            PopupMenuItem(
                                                              child: Text("Default"),
                                                              value: AdvisorCardSettings.delete,
                                                            ),
                                                          ],
                                                          onSelected: (setting) {
                                                            switch (setting) {
                                                              case AdvisorCardSettings.edit_color:
                                                                print("edit color clicked");
                                                                break;
                                                              case AdvisorCardSettings.delete:
                                                                print("delete clicked");
                                                                setState(() {
                                                                  todos.remove(advisorCardObject);
                                                                });
                                                                break;
                                                            }
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                            //AdvisorCardTile
                                            AdvisorCardCrisisTile(
                                              crisisTitle: "Corona",
                                              crisisRestrictionsIcons: [RestrictionIcons.Mask],
                                              advisorCardObject: new AdvisorCardObject("Corona (SarS CoV-2)", Icons.verified_user),
                                            ),

                                            AdvisorCardCrisisTile(
                                              crisisTitle: "Influenza",
                                              crisisRestrictionsIcons: [RestrictionIcons.Mask, RestrictionIcons.Distance],
                                              //change to crisis details object
                                              advisorCardObject: new AdvisorCardObject("Influenza (H1N1)", Icons.accessibility),
                                            ),

                                        
                                              // Spacer(),
                                              // //Verordnungen/Bundesland
                                              // Hero(
                                              //   tag: todoObject.uuid + "_number_of_tasks",
                                              //   child: Material(
                                              //       color: Colors.transparent,
                                              //       child: Text(
                                              //         todoObject.taskAmount().toString() + " Verordnungen",
                                              //         style: TextStyle(),
                                              //         softWrap: false,
                                              //       )),
                                              // ),
                                            Spacer(),

                                            //Card Bundesland
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                              
                                              Padding(
                                                padding: EdgeInsets.only(bottom: 10),
                                                child:
                                                  Hero(
                                                    tag: advisorCardObject.uuid + "_title",
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: <Widget> [ 
                                                          Container(
                                                            margin: const EdgeInsets.only(right: 15.0),
                                                            width: 17,
                                                            child: Utility.translateRestrictionAreaSymbol(advisorCardObject.title),
                                                          ),
                                                          
                                                          Text(
                                                            advisorCardObject.title,
                                                            style: TextStyle(fontSize: 25.0),
                                                            softWrap: false,
                                                          )
                                                        ]),
                                                    ),
                                                  )
                                              ),
                                              // Spacer(),
                                          
                                                AdvisorProgressBar(
                                                  totalSteps: 5,
                                                  currentStep: 2,
                                                  padding: 6.0,
                                                  size: 6,
                                                  uuid: advisorCardObject.uuid,
                                                )
                                                ]
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },

                          );
                        }
                      }
                    }
              ),
            ),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomScrollPhysics extends ScrollPhysics {
  _CustomScrollPhysics({
    ScrollPhysics parent,
  }) : super(parent: parent);

  @override
  _CustomScrollPhysics applyTo(ScrollPhysics ancestor) {
    return _CustomScrollPhysics(parent: buildParent(ancestor));
  }

  double _getPage(ScrollPosition position) {
    return position.pixels / (position.maxScrollExtent / (todos.length.toDouble() - 1));
    // return position.pixels / position.viewportDimension;
  }

  double _getPixels(ScrollPosition position, double page) {
    // return page * position.viewportDimension;
    return page * (position.maxScrollExtent / (todos.length.toDouble() - 1));
  }

  double _getTargetPixels(ScrollPosition position, Tolerance tolerance, double velocity) {
    double page = _getPage(position);
    if (velocity < -tolerance.velocity)
      page -= 0.5;
    else if (velocity > tolerance.velocity) page += 0.5;
    return _getPixels(position, page.roundToDouble());
  }

  @override
  Simulation createBallisticSimulation(ScrollMetrics position, double velocity) {
    if ((velocity <= 0.0 && position.pixels <= position.minScrollExtent) || (velocity >= 0.0 && position.pixels >= position.maxScrollExtent)) return super.createBallisticSimulation(position, velocity);
    final Tolerance tolerance = this.tolerance;
    final double target = _getTargetPixels(position, tolerance, velocity);
    if (target != position.pixels) return ScrollSpringSimulation(spring, position.pixels, target, velocity, tolerance: tolerance);
    return null;
  }
}
