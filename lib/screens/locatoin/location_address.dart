import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

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
List<Placemark>  placemark=[];

Future<void>   getPositionFromLatLong(Position position)async{


   placemark=await placemarkFromCoordinates(position.latitude, position.longitude);


  print(placemark);


}































class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {




  String location='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Center(
                child: Text(
                  'location           ${location}',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              const Center(
                child: Text(
                  'عنوانك بمكانك ',
                  style: TextStyle(fontSize: 22),
                ),
              ),
               Center(
                child: Text(
                  ' ${placemark}',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              ElevatedButton(
                  onPressed: () async{
                    Position position = await determinePosition();

                    print(position.latitude);
                    print(position.longitude);
                    print(position.isMocked);
                    print(position.heading);
                    print(position.altitude);
                    print(position.accuracy);
                    print(position.floor);
                    print(position.speed);
                    print(position.timestamp);
                    print(position.speedAccuracy);
                    setState(() {
                      location='${position.latitude}   ${position.longitude}';

                      getPositionFromLatLong(position);
                    });
                  },
                  child: const Icon(Icons.location_on)),
            ],
          ),
        ),
      ),
    );
  }
}
