import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';

class Compass extends StatefulWidget {
  const Compass({Key? key}) : super(key: key);

  @override
  State<Compass> createState() => _CompassState();
}

class _CompassState extends State<Compass> {
  double? handing;

  @override
  void initState() {
    super.initState();
    FlutterCompass.events!.listen((event) {
      setState(() {
        handing = event.heading;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Compass',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '${handing!.ceil()}',
            style: TextStyle(fontSize: 50),
          ),
          Center(
              child: Container(
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.black,
              ),
              BoxShadow(
                color: Colors.black,
              ),
            ]),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.height * 0.4,
              child: Stack(
                  alignment: Alignment.center,
                  children: [
                const Image(
                  image: AssetImage(
                    'assets/images/compass.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
                Transform.rotate(
                  angle: ((handing??0)*(pi/180)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 15,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.elliptical(150,500),
                              topRight: Radius.elliptical(150,500),
                              // bottomLeft: Radius.elliptical(150,500),
                              // bottomRight: Radius.elliptical(150,500),
                            )
                        ),
                      ),
                      Container(
                        width: 15,
                        height: 100,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            // topLeft: Radius.elliptical(150,500),
                            // topRight: Radius.elliptical(150,500),
                            bottomLeft: Radius.elliptical(150,500),
                            bottomRight: Radius.elliptical(150,500),
                          )
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ))
        ],
      ),
    );
  }
}
