import 'package:crimsy/model/post_model.dart';
import 'package:crimsy/model/restriction_model.dart';
import 'package:crimsy/service/post_service.dart';
import 'package:crimsy/utils/colors.dart';
import 'package:crimsy/utils/utility.dart';
import 'package:flutter/material.dart';

class FeedDetailView extends StatefulWidget {

  @override
  _FeedDetailViewState createState() => _FeedDetailViewState();
}

class _FeedDetailViewState extends State<FeedDetailView> {
  Restriction data;
  Future<Restriction> _restriction;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    data = ModalRoute.of(context).settings.arguments;
    _restriction = getRestriction(data.restrictionId);
  }

  @override
  Widget build(BuildContext context) {

    // final levelIndicator = Container(
    //   child: Container(
    //     child: LinearProgressIndicator(
    //         backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
    //         value: 2,
    //         valueColor: AlwaysStoppedAnimation(Colors.green)),
    //   ),
    // );

    final topContentText = Wrap(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 4.0, left: 0),
          child: Icon(
            Utility.getIconForCategory(data.restrictionType),
            // Icons.directions_car,
            color: Colors.white,
            size: 15.0,
          )
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6.0, left: 10),
          child: Text(
              data.translatedType(data.translatedType(data.restrictionType)),
              style: TextStyle(color: Colors.white, fontSize: 12.0),
          )
        ),
        Container(
          width: 320,
          child: new Divider(color: Colors.grey),
        ),
        SizedBox(height: 10.0),
        Text(
          data.restrictionShortDescription,
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
        SizedBox(height: 25.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
                flex: 2,
                child: Padding(
                    padding: EdgeInsets.only(left: 0.0, top: 10.0, bottom: 10.0),
                    child: Text(
                      _getRestrictionPeriod(data.restrictionStart, data.restrictionEnd),
                      style: TextStyle(color: Colors.white, fontSize: 12.0),
                    )
                )
            ),
            Expanded(
                flex: 2,
                child: Padding(
                    padding: EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
                    child: Text(
                      data.translatedType(data.restrictionArealIdentifier),
                      style: TextStyle(color: Colors.white, fontSize: 12.0),
                      textAlign: TextAlign.right,
                    )
                )
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Text(
                data.restrictionRecipient,
                style: TextStyle(color: Colors.amberAccent, fontSize: 12.0, fontWeight: FontWeight.bold),
              )
            ),
            // Expanded(
            //   // flex: 1, 
            //   child: Text("share button",  style: TextStyle(color: Colors.white, fontSize: 12.0), textAlign: TextAlign.right,),
            // ),
          ],
        )
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        SingleChildScrollView(
          child: Container(
            // height: MediaQuery.of(context).size.height *0.25,
            padding: EdgeInsets.only(top: 50.0, left: 50.0, right: 50.0, bottom: 30),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: MainColors.dirMainBlue),
            child: 
              topContentText,
            ),),
          Positioned(
            left: 8.0,
            top: 50.0,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back, color: Colors.white),
            ),
          ),
        ],
      );

    final bottomContentText = 
      Wrap(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text(
                data.restrictionPublisher,
                style: TextStyle(color: Colors.grey, fontSize: 12.0, fontWeight: FontWeight.bold),
              )
            ),

            FutureBuilder<Restriction>(
              future: _restriction,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data.restrictionDescription);
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                // By default, show a loading spinner.
                return CircularProgressIndicator();
              },
            )

            // Text(
            //   _restriction.,
            //   style: TextStyle(fontSize: 15.0),
            // )
          ]
      );

    final readButton = Container(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        width: MediaQuery.of(context).size.width,
        child: RaisedButton(
          onPressed: () => {
             Utility.getInstance().launchURL(data.restrictionFurtherInformation)
          },
          color: Color.fromRGBO(58, 66, 86, 1.0),
          child:
              Text("Link zur Quelle", style: TextStyle(color: Colors.white)),
     ));
        
    final bottomContent = Container(
      // height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      // color: Theme.of(context).primaryColor,
      padding: EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: <Widget>[
            bottomContentText, 
            readButton
          ],
        ),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            topContent, 
            bottomContent
          ],
      ),
    ));
  }

  String _getRestrictionPeriod(String start, String end) {
  if (end.isNotEmpty) {
    return Utility.formatDateTime(start) + " bis " + Utility.formatDateTime(end);
  }
    return Utility.formatDateTime(start);
  }
}