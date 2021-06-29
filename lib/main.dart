import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var points = <LatLng>[
    new LatLng(35.22, -101.83),
    new LatLng(32.77, -96.79),
    new LatLng(29.76, -95.36),
    new LatLng(29.42, -98.49),
    new LatLng(35.22, -101.83),
  ];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Leaflet Maps')),
      body:new FlutterMap(
          options: new MapOptions(
            center: new LatLng(35.22, -101.83), minZoom: 5.0),
        layers: [
          new TileLayerOptions(
            urlTemplate:
              "https://api.mapbox.com/styles/v1/harshada-1010/cknbdlsq50lrs17qi78ya6xay/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiaGFyc2hhZGEtMTAxMCIsImEiOiJja25iY3VpeGcxcWR0MndvNmp5bGpuZnJxIn0.O0VkG5ldJ235KnHZKCb2SQ",
            additionalOptions: {
              'accessToken': 'pk.eyJ1IjoiaGFyc2hhZGEtMTAxMCIsImEiOiJja25iY3VpeGcxcWR0MndvNmp5bGpuZnJxIn0.O0VkG5ldJ235KnHZKCb2SQ',
              'id': 'mapbox.mapbox-streets-v8'
            }
            ),
          //new MarkerLayerOptions(markers: [
          //    new Marker(
          //    width: 45.0,
          //    height: 45.0,
          //    point: new LatLng(40.73, -74.00),
          //    builder: (context) => new Container(
          //      child: IconButton(
          //        icon: Icon(Icons.location_on),
          //        color: Colors.red,
          //        iconSize: 45.0,
          //        onPressed: () {
          //          print('Marker tapped');
          //        },
          //      ),
          //    )
          //  )
         // ])
          new PolylineLayerOptions(
            polylines: [
              new Polyline(
                points: points,
                strokeWidth: 5.0,
                color: Colors.red,
              )
            ]
          )
        ]

          )
      );
  }
}