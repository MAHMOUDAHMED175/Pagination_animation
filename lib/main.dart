import 'package:animation/screens/time_prayer/dioHelper.dart';
import 'package:animation/screens/time_prayer/json_connection.dart';
import 'package:animation/screens/time_prayer/pray.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'screens/shimmer_lottie_cache_network_image_glass/shimmer.dart';

void main() async {
  await DioHelper.Init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
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
          const Shimmers(),
          // SlideToUnlockPage(),
          // qiblahh(),
          // const Compass(),
          // const Location(),
          // QiblahMaps(),
          // PrayTimes(),
    );
  }
}
