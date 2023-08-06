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



/// search Location  BYName
/*
DioManager dioManager = DioManager();
///static
SearchGoogleModel searchGoogleModel = SearchGoogleModel();

Future<void> getAddressesBySearchImpl({required String value}) async {
  emit(GetSearchLoadingState());
  Either<String, SearchGoogleModel> respond =
  await dioManager.getAddressesMapAsync(value: value);
  respond.fold((left) {
    emit(GetSearchErrorState());
    debugPrint("Get Data Failed");
  }, (right) {
    searchGoogleModel = right;
    emit(GetSearchSuccessState());
    debugPrint(searchGoogleModel.predictions![0].toString());
  });
}

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

/*

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';
import 'package:kadad_driver/model/search_google/search_google_by_map_model.dart';
import 'package:meta/meta.dart';
import '../../model/search_google/search_google_model.dart';
import '../../network/dio_maneger.dart';
import '../../shared/nav.dart';
import 'car_poolig__state.dart';

class CarPoolingCubit extends Cubit<CarPoolingState> {
  CarPoolingCubit() : super(CarPoolingitial());

  static CarPoolingCubit get(context) => BlocProvider.of(context);
  TimeOfDay select = TimeOfDay.now();
  int counter = 1;

  ///search screen
  void minus(){
    if(counter==0){
      return null;
    }else{
      counter--;
    }

    emit(minusState());
  }
  void plus() {
    counter++;
    emit(plussState());
  }

  void TimePicker(context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
        initialTime: select,
        initialEntryMode: TimePickerEntryMode.dial,
        context: context);
    if (timeOfDay != null) {
      select = timeOfDay;
    }
    emit(TimeOfDayState());
  }

//Show List by zayan

  bool showList = false;
  bool showLeaving = false;

  void showSelectList(bool value) {
    showList = value;
    emit(ShowSelectListState());
  }

  void showLeavingScreen(bool value) {
    showLeaving = value;
    emit(ShowLeavingState());
  }

  ///SearchGoogleModel
  DioManager dioManager = DioManager();
  ///static
  SearchGoogleModel searchGoogleModel = SearchGoogleModel();

  Future<void> getAddressesBySearchImpl({required String value}) async {
    emit(GetSearchLoadingState());
    Either<String, SearchGoogleModel> respond =
    await dioManager.getAddressesMapAsync(value: value);
    respond.fold((left) {
      emit(GetSearchErrorState());
      debugPrint("Get Data Failed");
    }, (right) {
      searchGoogleModel = right;
      emit(GetSearchSuccessState());
      debugPrint(searchGoogleModel.predictions![0].toString());
    });
  }


  LatLng? currentPosition;

  final Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  int markerIdCounter = 0;

  GoogleMapController? mapController;
  void getCurrentLocation() async {
    await Geolocator.checkPermission().then((value) async {
      print(value);
      if (value == LocationPermission.denied) {
        await Geolocator.requestPermission().then((value) async {
          final position = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high);
          currentPosition = LatLng(position.latitude, position.longitude);
          print(currentPosition);
          emit(GoMyLocation());
        });
      } else {

        final position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        currentPosition = LatLng(position.latitude, position.longitude);
        print(currentPosition);
        emit(GoMyLocation());
      }
    });
  }

  void goToCurrentLocation() {
    getCurrentLocation();
    mapController!.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: currentPosition!,
        zoom: 15,
      ),
    ));
  }

  void onMapCreated(GoogleMapController controller) async {
    mapController =controller;
    rootBundle.loadString('assets/map/theme_map.json').then((string) {
      controller.setMapStyle(string);});
    BitmapDescriptor customIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      'assets/images/marker1.png',);
    MarkerId markerId = MarkerId(markerIdVal());
    LatLng position = LatLng(30.033341250738083,31.23334497213364);
    Marker marker = Marker(
      markerId: markerId,
      position: position,
      icon: customIcon,
      draggable: false,
    );
    markers[markerId] = marker;
    getLocationByMapImpl(position:position);
    emit(ChooseLocation());
  }

  void onMapMove(CameraPosition position) {
    if (markers.length > 0) {
      MarkerId markerId = MarkerId(markerIdVal());
      Marker? marker = markers[markerId];
      Marker updatedMarker = marker!.copyWith(
        positionParam: position.target,
      );
      markers[markerId] = updatedMarker;
      getLocationByMapImpl(position:position.target);
      emit(ChooseLocation());
    }
  }

  String markerIdVal({bool increment = false}) {
    String val = 'marker_id_$markerIdCounter';
    if (increment) markerIdCounter++;
    return val;
  }


  String? city;
  String? address;
  LatLng? latLng;


  ///SearchGoogleModel
  SearchGoogleByMapModel searchGoogleByMapModel = SearchGoogleByMapModel();

  Future<void> getLocationByMapImpl({required LatLng position}) async {
    //emit(GetSearchLoadingState());
    Either<String, SearchGoogleByMapModel> respond =
    await dioManager.getAddressesByMapAsync(positionLat:position.latitude,positionLng: position.longitude);
    respond.fold((left) {
      debugPrint("Get Data Failed");
    }, (right) {
      searchGoogleByMapModel = right;
      if (searchGoogleByMapModel.status == 'OK') {
        //get LatLng Location
        final lat =searchGoogleByMapModel.results![0].geometry!.location!.lat;
        final lng =searchGoogleByMapModel.results![0].geometry!.location!.lng;
        latLng=LatLng(lat!, lng!);
        //get address Location
        final allAddress = searchGoogleByMapModel.results![0].formattedAddress!;
        final components = searchGoogleByMapModel.results![0].addressComponents!;
        for (final component in components) {
          if (component.types!.contains('administrative_area_level_1')) {
            AddressComponents addressComponents = component ;
            final  cityWords = addressComponents.shortName;
            removeListString(cityWords!);
            removeAfterWordString(allAddress, cityWords);
            emit(ChooseLocationss());
            break;
          } else {
            city = 'unknown';
          };
        }
      }
    });
  }

*/
/*  Future<void> getLocationName(LatLng position) async {
    final apiKey = Endpoints.googleMapKey;
    final url =Endpoints.chooseLocationByMap;
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude}, ${position
        .longitude}&result_type=street_address&key=$apiKey&language=en';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print(url);
      final data = jsonDecode(response.body);
      print(data);
      final status = data['status'];
      if (status == 'OK') {
        final allAddress = data['results'][0]['formatted_address'];
        print(allAddress);

        final components = data['results'][0]['address_components'];

        for (final component in components) {
          if (component['types'][0].contains('administrative_area_level_1')) {
            cityComponent = component;
          final  cityWords = cityComponent['short_name'];
            removeListString(cityWords);
            removeAfterWordString(allAddress, cityWords);
            emit(ChooseLocationss());
            break;
          } else {
            city = 'unknown';
          };
        }
      }
    }
  }*//*



  String removeListString(String string) {
    final indexCity = string.lastIndexOf(' ');
    if (indexCity != -1) {
      return city = string.substring(0, indexCity);
    }
    else {
      return city=string;
    }
  }

  String removeAfterWordString(String string, String word) {
    final indexAllAddress = string.indexOf(word);
    if (indexAllAddress != -1) {
      return address=string.substring(0, indexAllAddress).trim();
    } else {
      return address=string;
    }
  }






  bool ShowselectList = true;

  void setShowselectList(bool value) {
    ShowselectList = value;
    emit(setShowselectListState());
  }

  void backLocation(BuildContext context) {
    if (ShowselectList) {
      navigateBack(context);
    } else {
      setShowselectList(true);
    }
  }
}

*/
