import 'package:evchargingapp/const/GooglMapApiKey.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GoogleMapController? mapController;
  PolylinePoints polylinePoints = PolylinePoints();

  Set<Marker> markers = Set();
  Map<PolylineId, Polyline> polylines = {};

  LatLng startLocation = LatLng(27.6683619, 85.3101895);
  LatLng endLocation = LatLng(27.6688312, 85.3077329);

  @override
  void initState() {
    super.initState();

    markers.add(
      Marker(
        markerId: MarkerId(startLocation.toString()),
        position: startLocation,
        infoWindow: InfoWindow(
          title: 'Starting Point',
          snippet: 'Start Marker',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ),
    );

    markers.add(
      Marker(
        markerId: MarkerId(endLocation.toString()),
        position: endLocation,
        infoWindow: InfoWindow(
          title: 'Destination Point',
          snippet: 'Destination Marker',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ),
    );

    getDirections();
  }

  getDirections() async {
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      GOOGLE_MAPS_API_KEY, // Replace with your API key
      PointLatLng(startLocation.latitude, startLocation.longitude),
      PointLatLng(endLocation.latitude, endLocation.longitude),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    addPolyline(polylineCoordinates);
  }

  addPolyline(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.deepPurpleAccent,
      points: polylineCoordinates,
      width: 8,
    );
    polylines[id] = polyline;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Route Direction in Google Map"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: GoogleMap(
        zoomGesturesEnabled: true,
        initialCameraPosition: CameraPosition(
          target: startLocation,
          zoom: 16.0,
        ),
        markers: markers,
        polylines: Set<Polyline>.of(polylines.values),
        mapType: MapType.normal,
        onMapCreated: (controller) {
          setState(() {
            mapController = controller;
          });
        },
      ),
    );
  }
}
