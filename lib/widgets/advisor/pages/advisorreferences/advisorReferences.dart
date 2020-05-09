import 'package:crimsy/model/reference_model.dart';
import 'package:crimsy/model/restriction_model.dart';
import 'package:crimsy/widgets/advisor/pages/advisorreferences/advisorReferencesTiles.dart';
import 'package:flutter/material.dart';
import 'package:crimsy/service/post_service.dart';

class WidgetAdvisorArticles extends StatefulWidget {
  static const String routeId = 'feed';

  @override
  _WidgetAdvisorArticlesState createState() => _WidgetAdvisorArticlesState();
}

class _WidgetAdvisorArticlesState extends State<WidgetAdvisorArticles> {

  Future<List<SituationReference>> _references;
  Future<List<Restriction>> filteredRestrictions;
  // WidgetMainfeed();
  // @override
  // void initState() {
  //   getRestrictions().then((data) {
  //     setState(() {
  //       restrictions = filteredRestrictions = data;
  //     });
  //   });
  //   super.initState();
  // }


@override
void initState() {
  super.initState();
  _references = getAllSituationReferences();
}

  //  void _filterRestrictions(value) {
  //   setState(() {
  //     filteredRestrictions = restrictions
  //         .where((country) =>
  //             country['name'].toLowerCase().contains(value.toLowerCase()))
  //         .toList();
  //   });
  // }

@override
Widget build(BuildContext context) {
  return Scaffold(
    body:
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child:
        Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10),
                child:
                TextField(
                  autofocus: false,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.all(15.0),
                    hintText: 'Advices durchsuchen',
                    prefixIcon: Icon(Icons.search),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightBlue[800]),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightBlue[800]),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                  ),
                  // onSubmitted: ,
                ),
              ),
            //  Expanded(
            //   child: 
            //     FutureBuilder<List<Restriction>>(
            //       future: _restrictions,
            //       builder: (context, snapshot) {
            //         // _restrictions = snapshot;
            //         switch (snapshot.connectionState) {
            //           case ConnectionState.none:       
            //           case ConnectionState.active:
            //           case ConnectionState.waiting:
            //             return Utility.getCircularProgressIndicator(50.0, 50.0);
            //           case ConnectionState.done:
            //             if (snapshot.hasError) {
            //               return Text('Error: ${snapshot.error}');
            //             } else if(snapshot.hasData) {
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
                    child: 
                    Text(
                        "345 Artikel verfügbar",
                        style: TextStyle(color: Colors.lightBlue[800], fontSize: 11.0, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              AdvisorReference(
                text: "Es ist dringend empfohlen, einen Mindestabstand von 1,50m sofern es sich nicht um in einem Haushalt lebende Personen handelt. Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum",
                image: "assets/corona_icons/iconfinder_crowd-people-no-avoid-contact_5728185.png",
                title: "Abstandsregelung",
              ),

              AdvisorReference(
                text: "Das Tragen einer Gesichtsmake bei allen Einkaufsaktivitäten ist Pflicht.",
                image: "assets/corona_icons/iconfinder_doctor-advise-warning-suggestion-avatar_5728189.png",
                title: "Maskenpflicht",
              ),
              
              AdvisorReference(
                text: "Das Tragen einer Gesichtsmake bei allen Einkaufsaktivitäten ist Pflicht.",
                image: "assets/corona_icons/iconfinder_connection-route-spread-virus-global_5728179.png",
                title: "Internationale Reisewarnung",
              ),
            ],
          )
      )
      );
    }
}
 