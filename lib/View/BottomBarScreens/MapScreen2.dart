import 'dart:async';
import 'dart:convert';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:evchargingapp/Utils/colors.dart';
import 'package:evchargingapp/View/SignIn/SignIn.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:location/location.dart';

import '../../Models/ChargingStation_Model.dart';
import '../../ViewModel/ChargingStations_ViewModel.dart';
import '../../Widgets/CustomWidgets.dart';
import '../../Widgets/Filter_Widget.dart';
import '../../const/GooglMapApiKey.dart';
import '../BottomNavigationBar/MyBottomNavigationBar.dart';
import 'package:image/image.dart' as IMG;

class MapPage2 extends StatefulWidget {
  const MapPage2({super.key});

  @override
  State<MapPage2> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage2> {
  bool is_available_station_pressed=false;

  bool is_in_use_station_pressed=false;




  Location _locationController = new Location();

  final Completer<GoogleMapController> _mapController =
  Completer<GoogleMapController>();

  static const LatLng _pGooglePlex = LatLng(37.4223, -122.0848);
  static const LatLng _pApplePark = LatLng(37.3346, -122.0090);
  LatLng? _currentP = null;

  Map<PolylineId, Polyline> polylines = {};



  ChargingStationViewModel chargingStationViewModel=SignIn.chargingStationViewModel;

  List<Map<String, double>> locations = [];


  List<Map<String, double>> getStationLocations() {
    // List to store station locations
    List<Map<String, double>> locations = [];

    // Iterate through charging stations and extract coordinates
    for (ChargingStation station in chargingStationViewModel.chargingStations) {
      List<String> coordinates = station.location.split(',');
      double latitude = double.parse(coordinates[0]);
      double longitude = double.parse(coordinates[1]);
      locations.add({'latitude': latitude, 'longitude': longitude});
    }

    return locations;
  }
  Set<Marker> markers = Set();

// make sure to initialize before map loading

  late Future<BitmapDescriptor> defaultMarker;
  late Future<BitmapDescriptor> currentlocation_marker;


  Uint8List? resizeImage(Uint8List data, width, height) {
    Uint8List? resizedData = data;
    IMG.Image? img = IMG.decodeImage(data);
    IMG.Image resized = IMG.copyResize(img!, width: width, height: height);
    resizedData = Uint8List.fromList(IMG.encodePng(resized));
    return resizedData;
  }




  Future<BitmapDescriptor> getCustomMarker() async {
    ByteData data = await rootBundle.load('assets/marker.jpg');

    Uint8List bytes = data.buffer.asUint8List();
    Uint8List? smallimg = resizeImage(bytes, 65, 65);

    return await BitmapDescriptor.fromBytes(smallimg!);
  }

  Future<BitmapDescriptor> getCustomCurrentLocationMarker() async {
    ByteData data = await rootBundle.load('assets/currentlocation.png');
    Uint8List bytes = data.buffer.asUint8List();
    Uint8List? smallimg = resizeImage(bytes, 65, 65);

    return await BitmapDescriptor.fromBytes(smallimg!);
  }

  // Future<BitmapDescriptor> getCustomMarker() async {
  //   return await BitmapDescriptor.fromAssetImage(
  //     ImageConfiguration(size: const Size(200, 200)),
  //     'assets/marker.jpg',
  //   );
  // }




  Future<void> addMarkers() async {
    for (Map<String, double> location in locations) {
      LatLng latLng = LatLng(location['latitude']!, location['longitude']!);
      markers.add(
        Marker(
          markerId: MarkerId(latLng.toString()),
          position: latLng,
          icon: await defaultMarker, // Use await here to get the BitmapDescriptor
        ),
      );
    }
    print("currentlocation_marker"+_currentP.toString());

      markers.add(
        Marker(
          markerId: MarkerId('currentLocation'),
          position: _currentP!,
          icon: await currentlocation_marker, // Use await here to get the BitmapDescriptor
        ),
      );

  }



  @override
  void initState() {
    super.initState();
    defaultMarker = getCustomMarker();
    currentlocation_marker=getCustomCurrentLocationMarker();
    getLocationUpdates().then(
          (_) => {
        getPolylinePoints().then((coordinates) => {
          generatePolyLineFromPoints(coordinates),
        }),
      },
    );
    locations = getStationLocations(); // Call getStationLocations here
    addMarkers();
    getDirections();
  }



  // @override
  // void initState() {
  //   super.initState();
  //   getLocationUpdates().then(
  //         (_) => {
  //       getPolylinePoints().then((coordinates) => {
  //         generatePolyLineFromPoints(coordinates),
  //       }),
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    print("api "+chargingStationViewModel.chargingStations[0].location);
    print("locations"+locations.toString());
    return Scaffold(
      body: locations == null
          ? const Center(
        child: Text("Loading..."),
      )
          : Stack(
            children: [

              GoogleMap(
                      onMapCreated: ((GoogleMapController controller) =>
                _mapController.complete(controller)),
                      initialCameraPosition: CameraPosition(
              target: _pGooglePlex,
              zoom: 13,
                      ),
                      markers:markers,

                      // {
                      //
                      //   Marker(
                      //     markerId: MarkerId("_currentLocation"),
                      //     icon: BitmapDescriptor.defaultMarker,
                      //     position: _currentP!,
                      //   ),
                      //   // Marker(
                      //   //     markerId: MarkerId("_sourceLocation"),
                      //   //     icon: BitmapDescriptor.defaultMarker,
                      //   //     position: _pGooglePlex),
                      //   Marker(
                      //       markerId: MarkerId("_destionationLocation"),
                      //       icon: BitmapDescriptor.defaultMarker,
                      //     position: LatLng(locations[0]['latitude']!, locations[0]['longitude']!),
                      //   )
                      // },
                      polylines: Set<Polyline>.of(polylines.values),
                circles: {
                        Circle(circleId: CircleId("1"),
                          center:      _currentP ?? LatLng(0, 0),
                          radius: 600,
                          strokeWidth: 2,

                          strokeColor: ColorValues.primaryblue.withOpacity(0.4),
                          fillColor: ColorValues.primaryblue.withOpacity(0.4),



              )
                },

                    ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                    ),
                    TextField_Search(context),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: CircularButtons('assets/swap.svg', () {}, 45, 45),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: CircularButtons('assets/filter.svg', () {
                        showModalBottomSheet(
                          context: context,

                          shape: const RoundedRectangleBorder( // <-- SEE HERE
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(15.0),
                            ),
                          ),
                          isScrollControlled: true, // Enable full-screen behavior

                          builder: (context) {
                            return Filter_Widget(); // Use the custom widget
                          },
                        );
                      }, 45, 45),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: is_available_station_pressed || is_in_use_station_pressed ? MediaQuery.of(context).size.height * 0.02 : MediaQuery.of(context).size.height * 0.11),
                      child: Align(
                          alignment: Alignment.bottomRight,
                          child: CircularButtons('assets/path.svg', () {          _cameraToPosition(_currentP!);
                          }, 45, 45)),
                    ),
                  ],
                ),
              ),

            ],
          ),
    );
  }

  Future<void> _cameraToPosition(LatLng pos) async {
    final GoogleMapController controller = await _mapController.future;
    CameraPosition _newCameraPosition = CameraPosition(
      target: pos,
      zoom: 13,
    );
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(_newCameraPosition),
    );
  }

  Future<void> getLocationUpdates() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _locationController.serviceEnabled();
    if (_serviceEnabled) {
      _serviceEnabled = await _locationController.requestService();
    } else {
      return;
    }

    _permissionGranted = await _locationController.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _locationController.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationController.onLocationChanged
        .listen((LocationData currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        setState(() {
          _currentP =
              LatLng(currentLocation.latitude!, currentLocation.longitude!);
          print("currentlocation "+_currentP.toString());

          // _cameraToPosition(_currentP!);
        });
      }
    });
  }


  PolylinePoints polylinePoints = PolylinePoints();
  LatLng startLocation = LatLng(27.6683619, 85.3101895);
  LatLng endLocation = LatLng(27.6688312, 85.3077329);



  getDirections() async {
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      GOOGLE_MAPS_API_KEY,
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
    addPolyLine(polylineCoordinates);
  }

  addPolyLine(List<LatLng> polylineCoordinates) {
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
  Future<List<LatLng>> getPolylinePoints() async {
    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      GOOGLE_MAPS_API_KEY,
      PointLatLng(_pGooglePlex.latitude, _pGooglePlex.longitude),
      PointLatLng(_pApplePark.latitude, _pApplePark.longitude),
      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    return polylineCoordinates;
  }

  void generatePolyLineFromPoints(List<LatLng> polylineCoordinates) async {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id,
        color: Colors.black,
        points: polylineCoordinates,
        width: 8);
    setState(() {
      polylines[id] = polyline;
    });
  }
}
