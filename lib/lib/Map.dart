/*

 1 - اعمل اكونت ع جوجل ماب ديفوليبر
 2-اتبع خطوات الاضافه في الابلكيشن
 3-اعمل جيت للباكيدج
   google_maps_flutter: ^2.3.1
  geolocator: ^9.0.2
 4- واعمل جيت لباكيدج دي عشان هاتحتجها
   flutter_polyline_points: ^1.0.0
ابدا في الشغل بقا
 */

///GET LocationName BY latitude ,longitude
/*

String addd='';
Future<String?> getLocationName(double latitude, double longitude) async {
  final apiKey = Endpoints.googleMapKey;
  final url = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&result_type=street_address&key=$apiKey';
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final results = data['results'];
    if (results.isNotEmpty) {
      print(results[0]['formatted_address']);
      addd ='${results[0]['formatted_address']}';
      return results[0]['formatted_address'];
    }
  }
  return null;
}
*/

///Do you want Add marke in map?
/// هاتعمل ماب للعلامات دي اللي عايز تحطها
//Map<MarkerId, Marker> markers = {};
///  اعمل بقا الفانكشان اللي هاتحطلك العلامات دي ع الماب
/*

addMarker(
    LatLng position,
    String id,
    BitmapDescriptor descriptor)
{
  MarkerId markerId = MarkerId(id);
  Marker marker = Marker(
      markerId: markerId,
      icon: descriptor,

      position: position);
  markers[markerId] = marker;
}

Future<void> getMarker(
    {
      required  double pickUpLatitude,
      required  double pickUpLongitude,
      required  double destinationLatitude,
      required  double destinationLongitude,
    }
    ) async {
  /// pick Up marker
  addMarker(
    LatLng(pickUpLatitude, pickUpLongitude),
    "pickUp",
    BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
  );
  /// destination marker
  addMarker(
    LatLng(destinationLatitude, destinationLongitude),
    "destination",
    BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
  );
}*/

///Do you want Add line from location to anothar?
/// you mast specify a starting and Ending point
// Map<PolylineId, Polyline> polylines = {};
//   List<LatLng> polylineCoordinates = [];
//   PolylinePoints polylinePoints = PolylinePoints();
/*

void getPolyline(
    {
      required  double pickUpLatitude,
      required  double pickUpLongitude,
      required  double destinationLatitude,
      required  double destinationLongitude,
    }) async {
  polylineCoordinates=[];
  PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
    Endpoints.googleMapKey,
    PointLatLng(pickUpLatitude, pickUpLongitude),
    PointLatLng(destinationLatitude, destinationLongitude),
    travelMode: TravelMode.driving,
    // wayPoints: [PolylineWayPoint(location: "Sabo, Yaba Lagos Nigeria")]
  );
  if (result.points.isNotEmpty) {
    result.points.forEach((PointLatLng point) {
      polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      addPolyLine();
    });
  }
}
addPolyLine() {
  PolylineId id = PolylineId("poly");
  Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.green,
      points: polylineCoordinates);
  polylines[id] = polyline;
  emit(DrewPolyLine());
}
}
*/


///  Add widgat to Screen
/*
GoogleMap(
initialCameraPosition: CameraPosition(
target: LatLng(pickUpLatitude,pickUpLongitude),
zoom: 7.0,
),
// mapType: MapType.values<MapType>,
tiltGesturesEnabled: true,
liteModeEnabled: false,
myLocationEnabled: true,
myLocationButtonEnabled: false,
buildingsEnabled: false,
compassEnabled: false,
indoorViewEnabled: false,
trafficEnabled: false,
zoomControlsEnabled: false,
zoomGesturesEnabled:true,
rotateGesturesEnabled: true,
scrollGesturesEnabled: true,
markers: Set<Marker>.of(TripsCubit.get(context).markers.values),
polylines: Set<Polyline>.of(TripsCubit.get(context).polylines.values),
),*/

/// you want specify your location?
// get current location
/*
Position position = await Geolocator.getCurrentPosition(
desiredAccuracy: LocationAccuracy.high,
);

// get latitude and longitude
double latitude = position.latitude;
double longitude = position.longitude;



*/
