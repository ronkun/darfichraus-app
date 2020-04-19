import 'package:crimsy/model/restriction_model.dart';
import 'package:crimsy/utility.dart';
import 'package:flutter/material.dart';

class FeedDetailView extends StatelessWidget {

 FeedDetailView();

  @override
  Widget build(BuildContext context) {
    Restriction data = ModalRoute.of(context).settings.arguments;
  //   return Scaffold(
  //     appBar: AppBar(
  //         elevation: 0.1,
  //         backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
  //         title: Text(data.restrictionShortDescription),
  //         actions: <Widget>[
  //           IconButton(
  //             icon: Icon(Icons.list),
  //             onPressed: () {},
  //           )
  //         ],
  //       // title: Text(data.restrictionShortDescription),
  //     ),
  //     body: Padding(
  //       padding: EdgeInsets.all(16.0),
  //       child: Column(
  //           children: <Widget>[topContent, bottomContent],
  //         ),
        
        
  //       Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //           children: [
  //            Text(data.restrictionDescription),
  //           ]
  //       ),
  //     ),
  //   );
  // }

    final levelIndicator = Container(
      child: Container(
        child: LinearProgressIndicator(
            backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
            value: 2,
            valueColor: AlwaysStoppedAnimation(Colors.green)),
      ),
    );

    final topContentText = Wrap(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 20.0),
        Icon(
          Icons.directions_car,
          color: Colors.white,
          size: 30.0,
        ),
        Container(
          width: 340.0,
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
                flex: 1, 
                child: levelIndicator
              ),
            Expanded(
                flex: 6,
                child: Padding(
                    padding: EdgeInsets.only(left: 20.0, top: 20.0, bottom: 20.0),
                    child: Text(
                      Utility.formatDateTime(data.restrictionStart),
                      style: TextStyle(color: Colors.white),
                    )
                )
            ),
          ],
        ),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        // Container(
        //     padding: EdgeInsets.only(left: 0),
        //     height: 370,
            // height: MediaQuery.of(context).size.height,
            // decoration: new BoxDecoration(
            //   image: new DecorationImage(
            //     image: new AssetImage("drive-steering-wheel.jpg"),
            //     fit: BoxFit.cover,
            //   ),
            // )),
        SingleChildScrollView(
          child: Container(
            height: 350,
            padding: EdgeInsets.all(34.0),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
            child: Center(
              child: topContentText,
            ),
          )),
          Positioned(
            left: 8.0,
            top: 60.0,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back, color: Colors.white),
            ),
          )
        ],
      );

    final bottomContentText = Text(
      data.restrictionDescription,
      style: TextStyle(fontSize: 15.0),
    );

    final readButton = Container(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        width: MediaQuery.of(context).size.width,
        child: RaisedButton(
          onPressed: () => {},
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
          children: <Widget>[bottomContentText, readButton],
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
}