import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class WidgetMap extends StatelessWidget {
  // final color;
  final String buttonLbl = "Karte";

  @override
  Widget build(BuildContext context) {
    
    // return Text("Das wird eine Map");
    return new MaterialApp(
          home: new Scaffold(
            body: new FlutterMap(
              options: new MapOptions(
                center: new LatLng(51.27264, 10.26469),
                zoom: 6.0,
              ),
              layers: [
                new TileLayerOptions(
                  urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c'],
                  additionalOptions: {
                   'accessToken': 'pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw',
                   'id': 'mapbox/light-v9',
                  },
                ),
                // new MarkerLayerOptions(
                //   markers: [
                //     new Marker(
                //       width: 80.0,
                //       height: 80.0,
                //       point: new LatLng(51.5, -0.09),
                //       builder: (ctx) => new Container(
                //             child: new FlutterLogo(),
                //           ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        );
      }
    }

