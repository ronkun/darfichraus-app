import 'package:crimsy/model/health_information_model.dart';
import 'package:crimsy/service/health_information_service.dart';
import 'package:crimsy/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdvisorPandemicInfectionsWidget extends StatelessWidget {
  final String feedLabel;
  final String zip;
  

  const AdvisorPandemicInfectionsWidget({
    Key key,
    this.feedLabel, 
    this.zip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<HealthInformationHelper>(
            future: getAllHealthInfosByZip(this.zip),
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
                        HealthInformation healthInfos = snapshot.data.healthInformation.first;
                        final int death = healthInfos.deaths;

                        return Card(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      ListTile(
                                        dense: true,
                                        // contentPadding: EdgeInsets.only(top: 0.0, bottom: 0.0),
                                        leading: Icon(Icons.public),
                                        title: Text('Einwohner (' + healthInfos.gen + ')', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                                        // subtitle: Text(healthInfos.ewz.toString() + " Menschen"),
                                        // trailing: Icon(Icons.arrow_drop_up, color: Colors.green,),
                                        trailing: Text(NumberFormat.decimalPattern().format(healthInfos.ewz).toString(), style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                                      ),
                                      ListTile(
                                        dense: true,
                                        // contentPadding: EdgeInsets.only(top: 0.0, bottom: 0.0),
                                        leading: Icon(Icons.person),
                                        title: Text('Infizierte', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                                        subtitle: Text(healthInfos.cases.toString() + " Personen"),
                                        trailing: Icon(Icons.arrow_drop_up, color: Colors.green,),
                                      ),
                                      ListTile(
                                        dense: true,
                                        leading: Icon(Icons.sentiment_very_dissatisfied),
                                        title: Text('Verstorbene', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                                        subtitle: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget> [
                                            Text(healthInfos.deaths.toString() + ' Personen'),
                                            Text(healthInfos.deathRate.toStringAsPrecision(3) + "% Sterblichkeit"),
                                          ]
                                        ),
                                        trailing: Icon(Icons.arrow_drop_down, color: Colors.red,),
                                      ),
                                      ListTile(
                                        dense: true,
                                        leading: Icon(Icons.healing),
                                        title: Text('Genesene', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                                        subtitle: Text(' 0  Personen'),
                                        trailing: Icon(Icons.arrow_drop_up, color: Colors.green,),
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        children: <Widget>[
                                          Padding(padding: EdgeInsets.only(left: 15)),
                                          Text("Stand: ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 10),),
                                          Text( '' + healthInfos.lastUpdate.toString() + ' (Robert Koch Institut) ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 10))
                                        ]
                                      ),
                                      SizedBox(height: 10),
                                      // ButtonBar(
                                      //   children: <Widget>[
                                      //     FlatButton(
                                      //       child: const Text('AKTUALISIEREN'),
                                      //       onPressed: () {/* ... */},
                                      //     ),
                                      //     // FlatButton(
                                      //     //   child: const Text('LISTEN'),
                                      //     //   onPressed: () {/* ... */},
                                      //     // ),
                                      //   ],
                                      // ),
                                      ],
                                    )
                                  );
                      }
                  }
                }
              // )
      );
    }
  }