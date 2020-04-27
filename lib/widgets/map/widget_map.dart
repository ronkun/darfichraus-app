import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geopoint/geopoint.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:geojson/geojson.dart';
import 'package:pedantic/pedantic.dart';
import 'dart:math' as math;

class WidgetMap extends StatefulWidget {
  static const String routeId = 'map';

  @override
  _WidgetsMapState createState() => _WidgetsMapState();
}

class _WidgetsMapState extends State<WidgetMap> {
  final lines = <Polyline>[];
  final polygons = <Polygon>[];

  String countygeojson = 'assets/geojson/bundeslaender_simplify200.geojson';
  String regiongeojson = 'assets/geojson/landkreise_simplify200.geojson';

  @override
  void initState() {
    processData();
    super.initState();
  }

  Future<void> processData() async {
    final geojson = GeoJson();

    geojson.processedMultipolygons.listen((GeoJsonMultiPolygon multiPolygon) {
      for (final polygon in multiPolygon.polygons) {
        final geoSerie = GeoSerie(
            type: GeoSerieType.polygon,
            name: polygon.geoSeries[0].name,
            geoPoints: <GeoPoint>[]);
        for (final serie in polygon.geoSeries) {
          geoSerie.geoPoints.addAll(serie.geoPoints);
        }
        final color =
            Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
                .withOpacity(0.6);
        final poly = Polygon(
            points: geoSerie.toLatLng(ignoreErrors: true), color: color);
        setState(() => polygons.add(poly));
      }
    });
    geojson.endSignal.listen((bool _) => geojson.dispose());
   
    final data = await rootBundle.loadString(regiongeojson);
    // final nameProperty = "ADMIN";
    unawaited(geojson.parse(data, verbose: true));

    //Polylines
    // final data = await rootBundle
    //     .loadString('assets/geojson/bundeslaender_simplify200.json');
    // final geojson = GeoJson();
    // geojson.processedLines.listen((GeoJsonLine line) {
    //   final color = Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
    //       .withOpacity(0.6);
    //   setState(() => lines.add(Polyline(
    //       strokeWidth: 2.0, color: color, points: line.geoSerie.toLatLng())));
    // });
    // geojson.endSignal.listen((_) => geojson.dispose());
    // unawaited(geojson.parse(data, verbose: true));
  }
      
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // child: new MapboxOverlay(
      // controller: new MapboxOverlayController(),
      // options: new MapboxMapOptions(
      //   style: Style.dark,
      //   camera: new CameraPosition(
      //     target: new LatLng(lat: 52.376316, lng: 4.897801),
      //     zoom: 15.0,
      //     bearing: 0.0,
      //     tilt: 0.0),
      //   ),
      // )
      body: FlutterMap(
        mapController: MapController(),
        options: MapOptions(
          center: LatLng(51.27264, 10.26469),
          zoom: 6.0,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
            additionalOptions: {
              'accessToken': 'pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw',
              'id': 'mapbox/light-v9',
            }),
          // PolylineLayerOptions(
            PolygonLayerOptions(
            // polylines: lines
            polygons: polygons,
          ),
          new MarkerLayerOptions(
            markers: [
              new Marker(
                width: 80.0,
                height: 80.0,
                point: new LatLng(52.27264, 11.26469),
                builder: (ctx) => new Container(
                      // child: new FlutterLogo(),
                      child: Icon(Icons.place, color: Colors.white,),
                    ),
              ),
            ],
          ),
        ],
      ));
    }
  }
