import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(new MaterialApp(
  home: new HomePage(),
));

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}



class HomePageState extends State<HomePage>{
  // final String url = "https://swapi.co/api/people";
  final String url = "https://api.darfichraus.de/restrictions";
  List data;

  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async {
    var response = await http.get(
      // encode url
      Uri.encodeFull(this.url),
      // only accept json response
      headers: {//"Accept": "application/json",
      "API-KEY": '6bce1751a010f90b68eb887cae8e2141cce149d5de664412e67cdf150006aa16f2bd0373ce496aa5'}
    );

    print(response.body);

    setState(() {
      var convertDataToJson = json.decode(response.body);
      // data = convertDataToJson['results'];
      data = convertDataToJson;
    });

    return 'success';
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('my title'),
      ),
      body: new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return new Container(
            child: new Center(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Card(
                    child: new Container(
                      margin: EdgeInsets.fromLTRB(15, 15, 15, 5),
                      child: new Column(
                        children: <Widget>[
                          new Row(
                            
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(data[index]['restrictionType'], style: TextStyle(fontSize: 18)),
                              Text(data[index]['restrictionState'], style: TextStyle(fontSize: 18)),
                            ],
                          ),
                          SizedBox(height: 10),
                          new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                                Text(data[index]['arealIdentifier'], style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                                SizedBox(height: 10), 
                                Text(data[index]['restrictionDescription']),
                            ],
                          ),
                          SizedBox(height: 10),
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(data[index]['restrictionStart']),
                              FlatButton(
                                onPressed: () {},
                                child: Text('Link folgen', style: TextStyle(color: Colors.white) ),
                                color: Colors.blue,
                              )
                            ],
                          )
                        ],
                      )
                      
                      //new Text(data[index]['areal']),
                      //padding: EdgeInsets.all(10),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}