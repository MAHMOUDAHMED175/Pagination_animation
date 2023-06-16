import 'dart:async';
import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import '../locatoin/location_address.dart';
import 'data.dart';
import 'dioHelper.dart';
//http
class JsonConnection {
  static double? pLat;
  static double? pLong;

  Data? list;

  Future getPTLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium);

    pLat = position.latitude;
    pLong = position.longitude;

    String date = DateTime.now().toIso8601String();
    int method = 4;

    final url =
        "http://api.aladhan.com/v1/timings/$date?latitude=$pLat&longitude=$pLong&method=$method";

    http.Response res = await http.get(Uri.parse(url), headers: {
      "Accept":
          "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8"
    });

    final data = json.decode(res.body);

    list = new Data.fromJson(data);

    return list;
  }
}
String? address;
List<Placemark>  placemarkAd=[];

Future<Position> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    await Geolocator.openLocationSettings();
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return Future.error('Location services are disabled.');
  }

  return await Geolocator.getCurrentPosition();
}
Future<void>   getPositionFromLatLong(Position position)async{


  placemarkAd=await placemarkFromCoordinates(position.latitude, position.longitude);


  print(placemarkAd);

  address=placemarkAd[1].street!;

  print(address);
}
Data? data;
//dio
void getCategoriesData() async {
  Position position = await determinePosition();
  String date = DateTime.now().toIso8601String();
  int method = 4;
  final url =
      "http://api.aladhan.com/v1/timings/$date?latitude=${position.latitude}&longitude=${position.longitude}&method=$method";
  DioHelper.getData(
    url: url,
  ).then((value) {
    data = Data.fromJson(value.data);
    print('sssssssssssssssssssssssss');
    print(date.toString());
    print('sssssssssssssssssssssssss${position.latitude}&longitude=${position.longitude}');
  }).catchError((error) {
    print(error.toString());
  });
}
