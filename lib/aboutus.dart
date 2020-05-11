import 'package:crimsy/utils/colors.dart';
import 'package:crimsy/utils/utility.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  // const AboutUs({
  //   // Key key,
  //   // @required this.value,
  //   // @required this.onChanged,
  //   // this.activeColor,
  //   // this.title,
  // });

  // final bool value;
  // final ValueChanged<bool> onChanged;
  // final Color activeColor;
  // final Widget title;
  // final Widget subtitle;
  // final Widget secondary;
  // final bool isThreeLine;
  // final bool dense;
  // final bool selected;

  @override
  Widget build(BuildContext context) {
    return
    // Scaffold(
    //   body:
     Stack(
      children: <Widget>[
        Hero(
          tag: "widget.advisorCardObject.uuid _background",
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
            backgroundColor: MainColors.dirMainBlue,
            elevation: 0.0,
            leading: Hero(
              tag: "widget.advisorCardObject.uuid + ""_backIcon",
              child: Material(
                color: Colors.transparent,
                type: MaterialType.transparency,
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                ),
              ),
            ),
            actions: <Widget>[
              // Text("test"),
            ],
          ),
          body: 
              Container(
                // height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(40.0),
                child: Center(
                  child: Column(
                    children: <Widget> [
                      Expanded(child: 
                      Wrap(
                        children: <Widget>[
                          // RichText(
                          //   text: TextSpan(
                          //     text: 'Über uns ',
                          //     style: TextStyle(color: MainColors.dirMainBlue, fontSize: 17.0, fontWeight: FontWeight.bold),
                          //     children: <TextSpan>[
                          //       TextSpan(
                          //         text: 
                          //         "Zur Eindämmung der Krise werden in schneller Folge viele rechtliche Regelungen erlassen, insbesondere in Form von Allgemeinverfügungen und Verordnungen. Sie kommen zu einem kleinen Teil von Bund, viele auch von den Ländern, die meisten aber von den Kreisen und kreisfreien Städten. Die Inhalte der Regelungen sind zwar in einem gewissen Maße koordiniert, aber nicht völlig identisch. Zusätzlich gibt es noch Erlasse der Landesregierungen an die Kreise, die zum Verständnis der Entscheidungen hilfreich sind, wenn sie auch nicht direkt auf die Bürger wirken. Zur Auslegung der Regelungen sind auch die amtlichen Begründungen (soweit verfügbar) interessant. Auf den Webseiten der vielen regelnden Stellen, sind die Dokumente auch nicht immer schnell zu finden. Es ist deshalb schwer, den Überblick zu behalten, was an einem bestimmten Ort gerade gilt.",
                          //         style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal),
                          //       ),
                          //       TextSpan(
                          //         text: 
                          //         "Die Idee ist es eine Website bereitzustellen, welche alle Regelungen gut sortiert und durchsuchbar enthält. Uns ist dabei wichtig, dass eine Sortierung nach räumlichen Gebieten und Sachbereichen, um die jeweils gültigen Regelungen zu finden ist und einen Vergleich zu ermöglichen. Auch sind Metadaten für eine Suche hilfreich. Um der Entwicklung Schritt zu halten können, ist es wichtig, dass es als Nutzer möglich ist, auf neue Regelungen hinzuweisen und/oder mitzumachen, indem man eine bestimmte Region jeweils auf dem aktuellen Stand hält.", 
                          //         style: TextStyle(fontSize: 15.0)
                          //       ),
                          //     ],
                          //   ),
                          // ),

                          Padding(
                            padding: EdgeInsets.only(bottom: 10.0),
                            child: Text(
                              "Über uns",
                              style: TextStyle(color: MainColors.dirMainBlue, fontSize: 17.0, fontWeight: FontWeight.bold),
                            )
                          ),
                          
                           Padding(
                            padding: EdgeInsets.only(bottom: 10.0),
                            child: 
                              Text(
                                "Zur Eindämmung der Krise werden in schneller Folge viele rechtliche Regelungen erlassen, insbesondere in Form von Allgemeinverfügungen und Verordnungen. Sie kommen zu einem kleinen Teil von Bund, viele auch von den Ländern, die meisten aber von den Kreisen und kreisfreien Städten. Die Inhalte der Regelungen sind zwar in einem gewissen Maße koordiniert, aber nicht völlig identisch. Zusätzlich gibt es noch Erlasse der Landesregierungen an die Kreise, die zum Verständnis der Entscheidungen hilfreich sind, wenn sie auch nicht direkt auf die Bürger wirken. Zur Auslegung der Regelungen sind auch die amtlichen Begründungen (soweit verfügbar) interessant. Auf den Webseiten der vielen regelnden Stellen, sind die Dokumente auch nicht immer schnell zu finden. Es ist deshalb schwer, den Überblick zu behalten, was an einem bestimmten Ort gerade gilt.",
                                style: TextStyle(fontSize: 14.0),
                              )
                           ),

                          Text(
                            "Die Idee ist es eine Lösung bereitzustellen, welche alle Regelungen gut sortiert und durchsuchbar enthält. Uns ist dabei wichtig, dass eine Sortierung nach räumlichen Gebieten und Sachbereichen, um die jeweils gültigen Regelungen zu finden ist und einen Vergleich zu ermöglichen. Auch sind Metadaten für eine Suche hilfreich. Um der Entwicklung Schritt zu halten können, ist es wichtig, dass es als Nutzer möglich ist, auf neue Regelungen hinzuweisen und/oder mitzumachen, indem man eine bestimmte Region jeweils auf dem aktuellen Stand hält.", 
                            style: TextStyle(fontSize: 14.0)
                          ),
                          
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            width: MediaQuery.of(context).size.width,
                            child: RaisedButton(
                              onPressed: () => {
                                Utility.getInstance().launchURL('https://www.darfichraus.de')
                              },
                              color: Color.fromRGBO(58, 66, 86, 1.0),
                              child:
                                  Text("Link zur Webseite", style: TextStyle(color: Colors.white)),
                          ))
                        ]
                    ), 
                     ) // readButton
                    ],
                  ),
                ),
          )
        )]
    );
      
      // AnnotatedRegion<SystemUiOverlayStyle>(
      //   value: SystemUiOverlayStyle.light,
      //   child: Container(
      //     decoration: BoxDecoration(
      //       gradient: LinearGradient(
      //         begin: Alignment.topCenter,
      //         end: Alignment.bottomCenter,
      //         stops: [0.1, 0.7, 0.8, 0.9],
      //         colors: [
      //           MainColors.dirMainBlue,
      //           Colors.lightBlue[800],
      //           Colors.lightBlue[700],
      //           Colors.lightBlue[600],
      //         ],
      //       ),
      //     ),
      //     child: Padding(
      //       padding: EdgeInsets.symmetric(vertical: 40.0),
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.stretch,
      //         children: <Widget>[
      //           Container(
      //             alignment: Alignment.centerRight,
      //             child: FlatButton(
      //                 textColor: Colors.white,
      //                 onPressed: () {
      //                   // _pageController.nextPage(
      //                   //   duration: Duration(milliseconds: 500),
      //                   //   curve: Curves.ease,
      //                   // );
      //                   Navigator.pushNamed(context, '/');
      //                 },
      //                 child: Row(),
      //             ),
      //           )
      //         ]
      //       )
      //     )
      //   )
      // )
    // );
  }
}