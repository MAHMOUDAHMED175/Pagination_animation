import 'package:animation/screens/locatoin/location_address.dart';
import 'package:flutter/material.dart';

import 'screens/compass/compass.dart';
import 'screens/qiblah/qiblah_maps.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home:
          // Containerr(),
          // Cube(),
          // ThreeDDrawer(),
          // Pagination(),
          // const AlertAnimate(),
          // ContainerRotate(),
          //   const ProfileImageMove(),
          // const Shimmers(),
          // SlideToUnlockPage(),
          // qiblahh(),
          // const Compass(),
      // const Location(),
      QiblahMaps(),



    );
  }
}
