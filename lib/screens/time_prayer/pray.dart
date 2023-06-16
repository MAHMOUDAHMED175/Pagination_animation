import 'dart:async';
import 'dart:convert';

import 'package:animation/screens/time_prayer/json_connection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import 'data.dart';

class PrayTimes extends StatefulWidget {
  PrayTimes({Key? key}) : super(key: key);

  @override
  _PrayTimesState createState() => _PrayTimesState();
}

class _PrayTimesState extends State<PrayTimes> {
  JsonConnection jsonConnection = new JsonConnection();
  Data? list;

  static String city = 'Cairo';
  static String country = 'Egypt';
  static int method = 4;

  final String url =
      'http://api.aladhan.com/v1/timingsByCity?city=$city&country=$country&method=$method';

  Future getPTData() async {
    http.Response res = await http.get(Uri.parse(url), headers: {
      "Accept":
          "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8"
    });
    final data = jsonDecode(res.body);

    list = Data.fromJson(data);

    return list;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(
          'Pray Times',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        actions: [
          IconButton(
              onPressed: () async {

                  determinePosition();
                  Position position =await  determinePosition()  ;
                  getPositionFromLatLong(position);
                  getCategoriesData();

              },
              icon: Icon(
                Icons.location_on,
                size: 30,
                color: Colors.white,
              )),
        ],
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FutureBuilder(
              future: jsonConnection.getPTLocation(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: <Widget>[
                                    Text(address!),
                                  ],
                                ),
                              ),
                            ),
                            IconButton(
                                onPressed: ()  {
                                  determinePosition();
                                },
                                icon: Icon(
                                  Icons.location_on,
                                  size: 50,
                                )),
                          ],
                        ),                            Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
                                    color: Colors.greenAccent),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Text(
                                      '${data!.data!.date!.hijri!.weekday!.ar}'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
                                    color: Colors.greenAccent),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Text(
                                      '${data!.data!.date!.hijri!.day!}'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
                                    color: Colors.greenAccent),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Text(
                                      '${data!.data!.date!.hijri!.month!.ar}'),
                                ),
                              ),
                            ),
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.0),
                                      color: Colors.greenAccent),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Fajr'),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(snapshot.data.data.timings.fajr),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.0),
                                      color: Colors.greenAccent),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Dhuhr'),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(snapshot.data.data.timings.dhuhr),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.0),
                                      color: Colors.greenAccent),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Asr'),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(snapshot.data.data.timings.asr),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.0),
                                      color: Colors.greenAccent),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Maghrib'),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(snapshot.data.data.timings.maghrib),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.0),
                                      color: Colors.greenAccent),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Isha'),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(snapshot.data.data.timings.isha),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30.0),
                                          color: Colors.greenAccent),
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Text(
                                            '${data!.data!.date!.gregorian!.date}'),
                                      ),
                                    ),
                                  ),                          Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30.0),
                                          color: Colors.greenAccent),
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Text(
                                            '${data!.data!.date!.hijri!.date}'),
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                              //dio api
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Column(
                    children: [
                      Center(child: CupertinoActivityIndicator(radius: 50,color: Colors.black,)),
                      SizedBox(
                        height: 50,
                      ),
                      IconButton(
                          onPressed: () async {
                            determinePosition();
                            Position position = await determinePosition();
                            getPositionFromLatLong(position);
                            getCategoriesData();
                          },
                          icon: Icon(
                            Icons.location_on,
                            size: 40,
                            color: Colors.black,
                          )),

                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
